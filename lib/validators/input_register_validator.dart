import 'package:form_field_validator/form_field_validator.dart'
    show
        EmailValidator,
        MatchValidator,
        MinLengthValidator,
        MultiValidator,
        PatternValidator,
        RequiredValidator;

class InputRegisterValidator {
  static final emailValidator = EmailValidator(errorText: 'Email inválido');

  static final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'Nombre obrigatório'),
    MinLengthValidator(3, errorText: 'Nombre muy corto'),
  ]);

  static final lastNameValidator = MultiValidator([
    RequiredValidator(errorText: 'Apellidos obrigatório'),
    MinLengthValidator(3, errorText: 'Apellidos muy corto'),
  ]);

  static final phoneValidator = MultiValidator([
    RequiredValidator(errorText: 'Teléfono obrigatório'),
    MinLengthValidator(9, errorText: 'Teléfono muy corto'),
  ]);

  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Se requiere contraseña'),
    MinLengthValidator(8,
        errorText: 'La contraseña debe tener al menos 8 dígitos'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'La contraseña deben tener al menos un carácter especial'),
  ]);

  static String? passwordConfirm(
          {required String password, required String confirmPassword}) =>
      MatchValidator(errorText: 'Contraseñas no son iguales').validateMatch(
        password,
        confirmPassword,
      );
}
