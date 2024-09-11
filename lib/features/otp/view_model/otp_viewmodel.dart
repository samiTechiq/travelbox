import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class OtpViewmodel extends ChangeNotifier {
  String? _otpCode;
  bool _verify = false;

  String? get otpCode => _otpCode;
  bool get verify => _verify;

  void setOtpCode(String? value) {
    _otpCode = _otpCode;
    notifyListeners();
  }

  void setVerify(bool value) {
    _verify = value;
    notifyListeners();
  }

}
