import 'package:form_field_validator/form_field_validator.dart'
    show
        EmailValidator,
        MinLengthValidator,
        MultiValidator,
        PatternValidator,
        RequiredValidator;

class InputLoginValidator {
  static final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Se requiere contraseña'),
    MinLengthValidator(8,
        errorText: 'La contraseña debe tener al menos 8 dígitos'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'La contraseña deben tener al menos un carácter especial')
  ]);

  static final emailValidator = EmailValidator(errorText: 'Email inválido');
}
