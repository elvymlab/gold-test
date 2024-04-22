abstract class ValidationRule {
  String? check(String? fieldValue);
}

class EmptyFieldValidationRule extends ValidationRule {
  @override
  String? check(String? fieldValue) {
    if (fieldValue == null || fieldValue.trim().isEmpty) {
      return 'Поле пустое';
    }
    return null;
  }
}
