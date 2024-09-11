import 'package:flutter_test/flutter_test.dart';
import 'package:travelbox/utils/core/validator/validator.dart';

void main() {
  late final Validator validator;

  setUpAll(() {
    validator = ValidatorImp();
  });

  group('validator for name field', () {
    test('throw error when user enter number in name field', () {
      final result = validator.validateInput('ahmad123',
          pattern: ValidationPattern.name.pattern);
      expect(result, ValidationResult.invalid);
    });

    test('throw error when user enter special character in name field', () {
      final result = validator.validateInput('ahmad@',
          pattern: ValidationPattern.name.pattern);
      expect(result, ValidationResult.invalid);
    });
    test('throw success when user enter only alphabet in name field', () {
      final result = validator.validateInput('ahmad',
          pattern: ValidationPattern.name.pattern);
      expect(result, ValidationResult.valid);
    });
  });
  group('validator for email field', () {
    test('throw error when user enter number in email field', () {
      final result = validator.validateInput('123',
          pattern: ValidationPattern.email.pattern);
      expect(result, ValidationResult.invalid);
    });

    test('throw error when user enter only @ in email field', () {
      final result = validator.validateInput('ahmad@',
          pattern: ValidationPattern.email.pattern);
      expect(result, ValidationResult.invalid);
    });
    test('throw error when user enter only .com in email field', () {
      final result = validator.validateInput('ahmad.com',
          pattern: ValidationPattern.email.pattern);
      expect(result, ValidationResult.invalid);
    });
    test('throw error when user enter @ and .com together', () {
      final result = validator.validateInput('ahmad@.com',
          pattern: ValidationPattern.email.pattern);
      expect(result, ValidationResult.invalid);
    });
    test('throw success when user correct format email', () {
      final result = validator.validateInput('ahmad@gmail.com',
          pattern: ValidationPattern.email.pattern);
      expect(result, ValidationResult.valid);
    });
  });


  group('validator for password field', () {
    test('throw error when user enter password less than 8', () {
      final result = validator.validateInput('123',
          pattern: ValidationPattern.password.pattern);
      expect(result, ValidationResult.invalid);
    });

    test('throw error when user enter password without alphabet', () {
      final result = validator.validateInput('12345678',
          pattern: ValidationPattern.password.pattern);
      expect(result, ValidationResult.invalid);
    });


    test('throw error when user enter password without digit', () {
      final result = validator.validateInput('ahmadhada',
          pattern: ValidationPattern.password.pattern);
      expect(result, ValidationResult.invalid);
    });

    test('throw error when user enter special characters', () {
      final result = validator.validateInput('ahmadhada@',
          pattern: ValidationPattern.password.pattern);
      expect(result, ValidationResult.invalid);
    });

    test('throw error when user enter special characters', () {
      final result = validator.validateInput('ahmad ad21',
          pattern: ValidationPattern.password.pattern);
      expect(result, ValidationResult.invalid);
    });


    test('throw success when password meet all requirment ', () {
      final result = validator.validateInput('ahmad231a',
          pattern: ValidationPattern.password.pattern);
      expect(result, ValidationResult.valid);
    });

    test('throw success when idcard meet all requirment ', () {
      final result = validator.validateInput('123123123123',
          pattern: ValidationPattern.idCard.pattern);
      expect(result, ValidationResult.valid);
    });

    test('throw error when user enter special characters', () {
      final result = validator.validateInput('123123123123a',
          pattern: ValidationPattern.idCard.pattern);
      expect(result, ValidationResult.invalid);
    });

    test('throw error when user enter invalid', () {
      final result = validator.validateInput('12',
          pattern: ValidationPattern.idCard.pattern);
      expect(result, ValidationResult.invalid);
    });

    test('throw success when IDCardCode meet all requirment ', () {
      final result = validator.validateInput('123',
          pattern: ValidationPattern.idCardCode.pattern);
      expect(result, ValidationResult.valid);
    });

    test('throw error when user enter special characters', () {
      final result = validator.validateInput('1231231233a',
          pattern: ValidationPattern.idCardCode.pattern);
      expect(result, ValidationResult.invalid);
    });

    test('throw error when user enter invalid', () {
      final result = validator.validateInput('12',
          pattern: ValidationPattern.idCardCode.pattern);
      expect(result, ValidationResult.invalid);
    });

  });
}
