import 'package:delivery_app/providers/providers.dart' show ProductProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widgets/widgets.dart'
    show
        ButtonWidget,
        CardImageCreateProductWidget,
        FormLocalCreateProductWidget,
        SelectCategoryCreateProductWidget;
import 'package:flutter/material.dart'
    show
        AppBar,
        BorderRadius,
        BuildContext,
        Colors,
        Column,
        Container,
        EdgeInsets,
        FocusScope,
        Icon,
        IconButton,
        Icons,
        Key,
        MediaQuery,
        Navigator,
        Padding,
        Scaffold,
        SingleChildScrollView,
        Size,
        SizedBox,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;
import 'package:rflutter_alert/rflutter_alert.dart'
    show Alert, AlertStyle, DialogButton;

class LocalCreateProductView extends StatelessWidget {
  const LocalCreateProductView({Key? key}) : super(key: key);
  static const routerName = '/local/create-product';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double appBarHeight = AppBar().preferredSize.height;
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);

    final _isLoading = _productProvider.isLoading;

    Future<void> _onPressed() async {
      Alert(
        context: context,
        title: "Crear producto",
        desc: "Si quieres editar tus datos cancela el registro con la X",
        style: const AlertStyle(
          descStyle: TextStyle(fontSize: 14),
          descTextAlign: TextAlign.start,
        ),
        buttons: [
          DialogButton(
            child: const Text(
              "Crear producto",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () async {
              Navigator.pop(context);
              if (_productProvider.isValidForm()) {
                FocusScope.of(context).unfocus();
                try {
                  if (_productProvider.formDataImage['image1'] == '') {
                    throw ('Debe seleccionar al menos una imagen');
                  }
                  if (_productProvider.formData['category'] == '') {
                    throw ('Debe seleccionar una categoria');
                  }
                  final data = await _productProvider.onSubmit();
                  if (!data.success) {
                    throw (data.message!);
                  } else {
                    NotificationUtil.showSnackBar(data.message!,
                        success: data.success);
                  }
                } catch (e) {
                  NotificationUtil.showSnackBar(e.toString(), success: false);
                }
              }
            },
            color: ColorTheme.primaryColor,
            radius: BorderRadius.circular(50),
          ),
        ],
      ).show();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear producto'),
        backgroundColor: ColorTheme.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            _productProvider.resetFormData();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height - appBarHeight,
          padding: EdgeInsets.only(
            top: size.height * 0.05,
            bottom: size.height * 0.05,
            left: size.width * 0.07,
            right: size.width * 0.07,
          ),
          child: SizedBox(
            width: size.width * 0.50,
            height: size.height * 0.50,
            child: Column(
              children: const [
                FormLocalCreateProductWidget(),
                CardImageCreateProductWidget(),
                SelectCategoryCreateProductWidget()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: size.height * 0.01,
          left: size.width * 0.07,
          right: size.width * 0.07,
        ),
        child: ButtonWidget(
          text: _isLoading ? 'Cargando...' : 'Crear producto',
          onPressed: _isLoading ? null : _onPressed,
          isLoading: _isLoading,
        ),
      ),
    );
  }
}
