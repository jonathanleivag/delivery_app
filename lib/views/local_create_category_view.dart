import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/providers/providers.dart' show CategoryProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/validators/validators.dart'
    show InputCategoryValidator;
import 'package:delivery_app/widgets/widgets.dart'
    show ButtonWidget, TextFieldWidget;
import 'package:flutter/material.dart'
    show
        AppBar,
        AutovalidateMode,
        BorderRadius,
        BuildContext,
        Colors,
        Column,
        Container,
        EdgeInsets,
        FocusScope,
        Form,
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
import 'package:rflutter_alert/rflutter_alert.dart';

class LocalCreateCategoryView extends StatelessWidget {
  const LocalCreateCategoryView({Key? key}) : super(key: key);
  static const String routerName = '/local/create-category';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double appBarHeight = AppBar().preferredSize.height;
    final CategoryProvider _categoryProvider =
        Provider.of<CategoryProvider>(context);

    final bool _isLoading = _categoryProvider.isLoading;

    Future<void> _onPressed() async {
      Alert(
        context: context,
        title: "Crear categoría",
        desc: "Si quieres editar tus datos cancela el registro con la X",
        style: const AlertStyle(
          descStyle: TextStyle(fontSize: 14),
          descTextAlign: TextAlign.start,
        ),
        buttons: [
          DialogButton(
            child: const Text(
              "Crear categoría",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () async {
              Navigator.pop(context);

              if (_categoryProvider.isValidForm()) {
                FocusScope.of(context).unfocus();
                final CategoryResponseModel data =
                    await _categoryProvider.createCategory();
                _categoryProvider.resetCategory();
                if (!data.success) {
                  NotificationUtil.showSnackBar(data.message!,
                      success: data.success);
                } else {
                  _categoryProvider.resetForm();
                  NotificationUtil.showSnackBar(data.message!,
                      success: data.success);
                }
              } else {
                NotificationUtil.showSnackBar('Error en el formulario',
                    success: false);
              }
            },
            color: ColorTheme.primaryColor,
            radius: BorderRadius.circular(50),
          ),
        ],
      ).show();
    }

    SizedBox _space() => const SizedBox(height: 10);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Category'),
        backgroundColor: ColorTheme.primaryColor,
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
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _categoryProvider.formKey,
              child: Column(
                children: [
                  _space(),
                  TextFieldWidget(
                    hintText: 'Pizza',
                    icon: Icons.category,
                    name: 'category',
                    provider: _categoryProvider,
                    validator: InputCategoryValidator.categoryValidator,
                    labelText: 'Categoría',
                  ),
                  _space(),
                  TextFieldWidget(
                    hintText: 'Descripción de categoría',
                    icon: Icons.description,
                    maxLength: 140,
                    maxlines: 3,
                    provider: _categoryProvider,
                    name: 'description',
                    labelText: 'Descripción',
                  ),
                ],
              ),
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
          text: _isLoading ? 'Cargando...' : 'Crear categoría',
          onPressed: _isLoading ? null : _onPressed,
          isLoading: _isLoading,
        ),
      ),
    );
  }
}
