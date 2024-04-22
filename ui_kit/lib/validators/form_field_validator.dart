import 'package:ui_kit/validators/rules.dart';

class Validator {
  List<ValidationRule> _rules = [];

  Validator(this._rules);

  /// Экзэмпляр будет выполнять проверку.
  /// что длина поля не равна 0.
  factory Validator.notEmptyValue() => Validator([EmptyFieldValidationRule()]);

  void addRule(ValidationRule rule) {
    _rules.add(rule);
  }

  String? check(String? fieldValue) {
    for (var rule in _rules) {
      final result = rule.check(fieldValue);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
