import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/providers/providers.dart' show RegisterProvider;
import 'package:delivery_app/theme/color_theme.dart';
import 'package:delivery_app/utils/utils.dart'
    show NotificationUtil, SecureStorageUtil;
import 'package:delivery_app/validators/validators.dart'
    show InputRegisterValidator;
import 'package:delivery_app/widgets/widgets.dart'
    show ActionRegisterOrLoginWidget, TextFieldWidget, ButtonWidget;

import 'package:flutter/material.dart'
    show
        AutovalidateMode,
        BorderRadius,
        BuildContext,
        TextAlign,
        Colors,
        Column,
        Container,
        EdgeInsets,
        FocusScope,
        Form,
        Icons,
        Key,
        Navigator,
        SizedBox,
        StatelessWidget,
        Text,
        TextInputType,
        TextStyle,
        Widget;
import 'package:delivery_app/views/views.dart'
    show LoginView, ClientProductListView;

import 'package:rflutter_alert/rflutter_alert.dart'
    show Alert, AlertStyle, DialogButton;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormRegisterWidget extends StatelessWidget {
  const FormRegisterWidget({
    Key? key,
    required this.registerProvider,
  }) : super(key: key);
  final RegisterProvider registerProvider;
  @override
  Widget build(BuildContext context) {
    final bool _isLoading = registerProvider.isLoading;
    final maskFormatter = MaskTextInputFormatter(
        mask: '+## (#) #### ####', filter: {"#": RegExp(r'[0-9]')});

    Future<void> _onPressed() async {
      Alert(
        context: context,
        title: "Crear cuenta",
        desc: "Si quieres editar tus datos cancela el registro con la X",
        style: const AlertStyle(
          descStyle: TextStyle(fontSize: 14),
          descTextAlign: TextAlign.start,
        ),
        buttons: [
          DialogButton(
            child: const Text(
              "Crear cuenta",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () async {
              Navigator.pop(context);
              if (registerProvider.formData['password'] !=
                  registerProvider.formData['confirmPassword']) {
                registerProvider.formData['confirmPassword'] = '';
              }

              if (registerProvider.isValidForm()) {
                FocusScope.of(context).unfocus();
                final UserCreateResponseModel data =
                    await registerProvider.onSubmit();

                if (!data.success) {
                  NotificationUtil.showSnackBar(data.message!,
                      success: data.success);
                } else {
                  await SecureStorageUtil.set('user', data.data!.toJson());
                  await SecureStorageUtil.set('token', data.token!);
                  await SecureStorageUtil.set('role', '');
                  await SecureStorageUtil.set('isrole', 'false');
                  Navigator.of(context)
                      .pushReplacementNamed(ClientProductListView.routerName);
                  registerProvider.resetForm();
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: registerProvider.formKey,
        child: Column(
          children: [
            _space(),
            TextFieldWidget(
              hintText: 'email@email.cl',
              icon: Icons.email,
              initialValue: registerProvider.formData['email'],
              validator: InputRegisterValidator.emailValidator,
              provider: registerProvider,
              name: 'email',
              keyboardType: TextInputType.emailAddress,
              labelText: 'Correo Electronico',
            ),
            _space(),
            TextFieldWidget(
              hintText: 'Jonathan',
              icon: Icons.person,
              initialValue: registerProvider.formData['name'],
              validator: InputRegisterValidator.nameValidator,
              provider: registerProvider,
              name: 'name',
              labelText: 'Nombre',
            ),
            _space(),
            TextFieldWidget(
              hintText: 'Leiva Gómez',
              icon: Icons.person_outline,
              initialValue: registerProvider.formData['lastName'],
              validator: InputRegisterValidator.lastNameValidator,
              provider: registerProvider,
              name: 'lastName',
              labelText: 'Apellido',
            ),
            _space(),
            TextFieldWidget(
              hintText: '+56955555555',
              icon: Icons.phone,
              inputFormatters: [maskFormatter],
              initialValue: registerProvider.formData['phone'],
              keyboardType: TextInputType.phone,
              validator: InputRegisterValidator.phoneValidator,
              provider: registerProvider,
              name: 'phone',
              labelText: 'Telefono',
            ),
            _space(),
            TextFieldWidget(
              hintText: '********',
              icon: Icons.lock,
              isPassword: true,
              initialValue: registerProvider.formData['password'],
              validator: InputRegisterValidator.passwordValidator,
              provider: registerProvider,
              name: 'password',
              labelText: 'Contraseña',
            ),
            _space(),
            TextFieldWidget(
              hintText: '********',
              icon: Icons.lock_outline,
              isPassword: true,
              initialValue: registerProvider.formData['confirmPassword'],
              provider: registerProvider,
              name: 'confirmPassword',
              labelText: 'Confirmar Contraseña',
              validatorConfirmPassword: InputRegisterValidator.passwordConfirm(
                  password: registerProvider.formData['password']!,
                  confirmPassword:
                      registerProvider.formData['confirmPassword']!),
            ),
            _space(),
            ButtonWidget(
              text: _isLoading ? 'Cargando...' : 'Registrarse',
              onPressed: _isLoading ? null : _onPressed,
              isLoading: _isLoading,
            ),
            _space(),
            const ActionRegisterOrLoginWidget(
              text1: '¿Tienes cuenta?',
              text2: 'Login',
              router: LoginView.routerName,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _space() => const SizedBox(height: 10);
}
