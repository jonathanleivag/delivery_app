import 'package:form_field_validator/form_field_validator.dart'
    show RequiredValidator;

class InputAddressValidator {
  static final directionFromValidator =
      RequiredValidator(errorText: 'La dirección es requerida');

  static final barrioFromValidator =
      RequiredValidator(errorText: 'Barrio es requerido');
}
