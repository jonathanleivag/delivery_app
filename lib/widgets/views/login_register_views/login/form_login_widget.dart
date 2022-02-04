import 'package:delivery_app/providers/providers.dart' show LoginProvider;
import 'package:delivery_app/utils/utils.dart'
    show NotificationUtil, SecureStorageUtil;
import 'package:delivery_app/validators/validators.dart'
    show InputLoginValidator;
import 'package:delivery_app/widgets/widgets.dart'
    show ActionRegisterOrLoginWidget, TextFieldWidget, ButtonWidget;

import 'package:flutter/material.dart'
    show
        AutovalidateMode,
        BuildContext,
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
        TextEditingController,
        TextInputType,
        Widget;
import 'package:provider/provider.dart' show Provider;
import 'package:delivery_app/views/views.dart' show CheckAuthView, RegisterView;

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginProvider _loginProvider = Provider.of<LoginProvider>(context);

    Map<String, TextEditingController> _formData = {
      'email': TextEditingController(text: _loginProvider.formData['email']),
      'password':
          TextEditingController(text: _loginProvider.formData['password']),
    };

    final bool _isLoading = _loginProvider.isLoading;

    Future<void> _onPress() async {
      _loginProvider.formData = {
        'email': _formData['email']!.text,
        'password': _formData['password']!.text,
      };
      if (_loginProvider.isValidForm()) {
        FocusScope.of(context).unfocus();
        final data = await _loginProvider.onSubmit();

        if (!data.success) {
          NotificationUtil.showSnackBar(data.message!, success: data.success);
        } else {
          await SecureStorageUtil.set('user', data.data!.toJson());
          await SecureStorageUtil.set('token', data.token!);
          await SecureStorageUtil.set('role', '');
          await SecureStorageUtil.set('isrole', 'false');
          Navigator.of(context).pushReplacementNamed(CheckAuthView.routerName);
          _loginProvider.resetForm();
        }
      } else {
        NotificationUtil.showSnackBar('Campos vacios', success: false);
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _loginProvider.formKey,
        child: Column(
          children: [
            _space(),
            TextFieldWidget(
              hintText: 'email@email.cl',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: InputLoginValidator.emailValidator,
              controller: _formData['email'],
              labelText: 'Correo electronico',
            ),
            _space(),
            TextFieldWidget(
              hintText: '********',
              icon: Icons.lock,
              controller: _formData['password'],
              isPassword: true,
              validator: InputLoginValidator.passwordValidator,
              labelText: 'Contraseña',
            ),
            _space(),
            ButtonWidget(
              text: _isLoading ? 'Cargando...' : 'Iniciar sesión',
              onPressed: _isLoading ? null : _onPress,
              isLoading: _isLoading,
            ),
            _space(),
            const ActionRegisterOrLoginWidget(
              text1: '¿No tienes cuente?',
              text2: 'Registrate',
              router: RegisterView.routerName,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _space() => const SizedBox(height: 20);
}
