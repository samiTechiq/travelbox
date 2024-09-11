import 'package:injectable/injectable.dart';
import 'package:travelbox/data/const/const_data.dart';

enum ValidationResult {
  valid,
  empty,
  invalid,
}

enum ValidationPattern { name, email, password, phone, postCode, otp, idCard, idCardCode, day, month, year }

extension ValidationPatternExtension on ValidationPattern {
  RegExp get pattern {
    switch (this) {
      case ValidationPattern.name:
        return RegExp(r'^[a-zA-Z]+$');
      case ValidationPattern.email:
        return RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
      case ValidationPattern.password:
        return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
      case ValidationPattern.phone:
        return RegExp(r'(^(?:[+0]9)?\d{8,12}$)');
      case ValidationPattern.postCode:
        return RegExp(regexPattern);
      case ValidationPattern.otp:
        return RegExp(r'^[0-9]*$');
      case ValidationPattern.idCard:
        return RegExp(r'^\d{12}$');
      case ValidationPattern.idCardCode:
        return RegExp(r'^\d{3}$');
      case ValidationPattern.day:
        return RegExp('^(0?[1-9]|[12][0-9]|3[01])\$');
      case ValidationPattern.month:
        return RegExp("^(0?[1-9]|1[012])\$");
      case ValidationPattern.year:
        return RegExp(r'^\d{4}$');
    }
  }
}

abstract class Validator {
  ValidationResult validateInput(String input,
      {bool allowEmpty = true, RegExp? pattern});
}

@LazySingleton(as: Validator)
class ValidatorImp implements Validator {
  @override
  ValidationResult validateInput(String input,
      {bool allowEmpty = true, RegExp? pattern}) {
    if (input.isEmpty) {
      return allowEmpty ? ValidationResult.empty : ValidationResult.invalid;
    } else if (pattern != null && !pattern.hasMatch(input)) {
      return ValidationResult.invalid;
    }
    return ValidationResult.valid;
  }
}
