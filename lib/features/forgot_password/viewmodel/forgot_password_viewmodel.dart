import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ForgotPasswordViewModel extends ChangeNotifier {
  String? email = '';
  TextEditingController emailController = TextEditingController();

  bool _isEmailValid = false;

  bool get isEmailValid => _isEmailValid;

  void validateEmail(String value) {
    _isEmailValid = value.isNotEmpty;
    notifyListeners();
  }

  void setEmail(String? value) {
    email = value;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
