import 'package:form_field_validator/form_field_validator.dart'
    show RequiredValidator;

class InputCategoryValidator {
  static final categoryValidator =
      RequiredValidator(errorText: 'Categoría es requerida');
}
