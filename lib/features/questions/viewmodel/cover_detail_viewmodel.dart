import 'package:flutter/material.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';

import '../views/both_cover_detail/viewmodel/both_cover_detail_viewmodel.dart';

abstract class AbstractCoverDetailViewModel {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController idCardController = TextEditingController();

  TextEditingController idCardCodeController = TextEditingController();

  String? dateOfBirth;

  FocusNode get firstNameFocusNode;

  FocusNode get lastNameFocusNode;

  FocusNode get emailFocusNode;

  FocusNode get idCardFocusNode;

  FocusNode get idCardCodeFocusNode;

  bool get isFirstNameValid;

  bool get isLastNameValid;

  bool get isEmailValid;

  bool get isIDCardValid;

  bool get isIDCardCodeValid;

  bool get isFormValid;

  void validateFirstName(String value);

  void validateLastName(String value);

  void validateEmail(String value);

  void validateIDCard(String value);

  void validateIDCardCode(String value);

  void validateForm();

  Future<List<Quote>> getQuote(
      CoverQuoteViewModel coverQuoteViewModel,
      AttendingCustomerViewModel attendingCustomerViewModel,
      StartEndPickerViewModel startEndPickerViewModel,
      BasicInfoViewModel basicInfoViewModel);

  Future<List<Quote>> getQuoteForTwo(
      CoverQuoteViewModel coverQuoteViewModel,
      AttendingCustomerViewModel attendingCustomerViewModel,
      StartEndPickerViewModel startEndPickerViewModel,
      BasicInfoViewModel basicInfoViewModel,
      BothCoverDetailViewModel bothCoverDetailViewModel);
}
