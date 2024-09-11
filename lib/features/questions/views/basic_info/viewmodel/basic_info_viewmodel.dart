import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/features/questions/views/basic_info/usecase/basic_info_usecase.dart';

@LazySingleton()
class BasicInfoViewModel extends ChangeNotifier {
  String? title = 'Mr';
  String? firstName;
  String? surname;
  String? email;
  String? mobile;
  String? password;
  String? phoneNumberError;
  bool acceptPolicy = false;
  String? confirmPassword;
  bool isKeepSignedIn = false;
  bool notReceiveMail = false;
  bool isShowPassword = false;
  bool isShowConfirmPassword = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController surnameNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();
  TextEditingController confirmPasswordNameController = TextEditingController();

  void setTitle(String value) {
    title = value;
    notifyListeners();
  }

  void toggleAcceptPolicy() {
    acceptPolicy = !acceptPolicy;
    notifyListeners();
  }

  void setPhoneNumberError(String? value) {
    phoneNumberError = value;
    notifyListeners();
  }

  bool isButtonEnabled() => acceptPolicy;

  void setFirstName(String? value) {
    firstName = value;
    notifyListeners();
  }

  void setSurname(String? value) {
    surname = value;
    notifyListeners();
  }

  void setEmail(String? value) {
    email = value;
    notifyListeners();
  }

  void setMobile(String? value) {
    mobile = value;
    notifyListeners();
  }

  void setPassword(String? value) {
    password = value;
    notifyListeners();
  }

  void toggleKeepSignedIn() {
    isKeepSignedIn = !isKeepSignedIn;
    notifyListeners();
  }

  void setConfirmPassword(String? value) {
    confirmPassword = value;
    notifyListeners();
  }

  void toggleNotReceiveMail() {
    notReceiveMail = !notReceiveMail;
    notifyListeners();
  }

  void toggleIsShowPassword() {
    debugPrint('isShowPassword $isShowPassword');
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void toggleIsShowConfirmPassword() {
    isShowConfirmPassword = !isShowConfirmPassword;
    notifyListeners();
  }

  RegisterRequest get params => RegisterRequest(
        title: title ?? '',
        firstName: firstName ?? '',
        surname: surname ?? '',
        email: email ?? '',
        mobile: mobile ?? '',
        countryCodeOfResidence: '',
        password: 'password',
      );

  void userRegister() async {}

  @override
  void dispose() {
    firstNameController.dispose();
    surnameNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    confirmPasswordNameController.dispose();
    super.dispose();
  }
}
