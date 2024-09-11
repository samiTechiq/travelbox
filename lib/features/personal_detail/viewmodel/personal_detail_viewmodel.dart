import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/enum/email_state.dart';
import 'package:travelbox/data/enum/phone_state.dart';

@LazySingleton()
class PersonalDetailViewmodel extends ChangeNotifier {
  String title = 'Mr';
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? addressOne;
  String? addressTwo;
  String? townCity;
  String? stateCountry;
  String? postCode;
  String? country;
  DateTime? dateOfBirth;
  String? phoneNumberError;
  String? emailError;
  String? postCodeError;
  String? lastNameError;
  String? firstNameError;
  EmailState emailState = EmailState.none;
  PhoneState phoneState = PhoneState.none;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController addressOneController = TextEditingController();
  TextEditingController addressTwoController = TextEditingController();
  TextEditingController townCityController = TextEditingController();
  TextEditingController stateCountryController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void setEmailState(EmailState value) {
    emailState = value;
    notifyListeners();
  }

  void setPhoneState(PhoneState value) {
    phoneState = value;
    notifyListeners();
  }

  void setFirstName(String? value) {
    firstName = value;
    notifyListeners();
  }

  void setFirstNameError(String? value) {
    firstNameError = value;
    notifyListeners();
  }

  void setAddressOne(String? value) {
    addressOne = value;
    notifyListeners();
  }

  void setAddressTwo(String? value) {
    addressTwo = value;
    notifyListeners();
  }

  void setTownCity(String? value) {
    townCity = value;
    notifyListeners();
  }

  void setStateCountry(String? value) {
    stateCountry = value;
    notifyListeners();
  }

  void setPostcode(String? value) {
    postCode = value;
    notifyListeners();
  }

  void setPostcodeError(String? value) {
    postCodeError = value;
    notifyListeners();
  }

  void setCountry(String? value) {
    country = value;
    notifyListeners();
  }

  void setTitle(String value) {
    title = value;
    notifyListeners();
  }

  void setLastName(String? value) {
    lastName = value;
    notifyListeners();
  }

  void setLastNameError(String? value) {
    lastNameError = value;
    notifyListeners();
  }

  void setEmail(String? value) {
    email = value;
    notifyListeners();
  }

  void setEmailError(String? value) {
    emailError = value;
    notifyListeners();
  }

  void setMobile(String value) {
    mobile = value;
    notifyListeners();
  }

  void setPhoneNumberError(String? value) {
    phoneNumberError = value;
    notifyListeners();
  }

  void setDateOfBirth(DateTime? value) {
    dateOfBirth = value;
    notifyListeners();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    dateController.dispose();
    addressOneController.dispose();
    addressTwoController.dispose();
    townCityController.dispose();
    stateCountryController.dispose();
    postCodeController.dispose();
    countryController.dispose();
    super.dispose();
  }
}
