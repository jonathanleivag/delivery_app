import 'package:delivery_app/models/models.dart' show UserCreateResponseModel;
import 'package:delivery_app/providers/providers.dart' show ProfileProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart' show NotificationUtil;
import 'package:delivery_app/widgets/widgets.dart'
    show ButtonWidget, FormEditUserView, HeroEditUserView;
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
        FutureBuilder,
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

class EditUserView extends StatelessWidget {
  const EditUserView({Key? key}) : super(key: key);

  static const String routerName = '/edit-user';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double appBarHeight = AppBar().preferredSize.height;
    final ProfileProvider _profileProvider =
        Provider.of<ProfileProvider>(context);
    final bool _isLoading = _profileProvider.isLoading;

    Future<void> _onPressed() async {
      Alert(
        context: context,
        title: "Actualizar perfil",
        desc: "Si quieres editar tus datos cancela el registro con la X",
        style: const AlertStyle(
          descStyle: TextStyle(fontSize: 14),
          descTextAlign: TextAlign.start,
        ),
        buttons: [
          DialogButton(
            child: const Text(
              "Actualizar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () async {
              Navigator.pop(context);

              if (_profileProvider.isValidForm()) {
                FocusScope.of(context).unfocus();
                final UserCreateResponseModel data =
                    await _profileProvider.updateUser();

                if (data.success) {
                  NotificationUtil.showSnackBar(data.message!,
                      success: data.success);
                } else {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar perfil'),
        backgroundColor: ColorTheme.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () async {
            await _profileProvider.resetFormData();
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
            child: FutureBuilder(
              future: _profileProvider.loadUser(),
              builder: (context, snapshot) => Column(
                children: [
                  HeroEditUserView(profileProvider: _profileProvider),
                  FormEditUserView(profileProvider: _profileProvider)
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
          text: _isLoading ? 'Cargando...' : 'Actualizar',
          onPressed: _isLoading ? null : _onPressed,
          isLoading: _isLoading,
        ),
      ),
    );
  }
}
