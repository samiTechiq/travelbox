import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class CoverDetailCardsFieldViewModel extends ChangeNotifier {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobDayController = TextEditingController();
  final TextEditingController _dobMonthController = TextEditingController();
  final TextEditingController _dobYearController = TextEditingController();
  final TextEditingController _idCardController = TextEditingController();
  final TextEditingController _idCardCodeController = TextEditingController();

  TextEditingController get firstNameController => _firstNameController;

  TextEditingController get lastNameController => _lastNameController;

  TextEditingController get emailController => _emailController;

  TextEditingController get dobDayController => _dobDayController;

  TextEditingController get dobMonthController => _dobMonthController;

  TextEditingController get dobYearController => _dobYearController;

  TextEditingController get idCardController => _idCardController;

  TextEditingController get idCardCodeController => _idCardCodeController;

  late String _dob;

  String get dob => _dob;
}
