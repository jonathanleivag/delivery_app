import 'package:form_field_validator/form_field_validator.dart'
    show RequiredValidator;

class InputProductValidator {
  static final name =
      RequiredValidator(errorText: 'El nombre del producto es requerido');
  static final price =
      RequiredValidator(errorText: 'El precio del producto requerido');
  static final description =
      RequiredValidator(errorText: 'La descripción del producto es requerida');
}
