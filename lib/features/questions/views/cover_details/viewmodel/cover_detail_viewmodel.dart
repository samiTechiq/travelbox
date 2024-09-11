// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/domain/extension/extension.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/questions/usecase/get_quote_usecase.dart';
import 'package:travelbox/features/questions/viewmodel/cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/both_cover_detail/viewmodel/both_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
import 'package:travelbox/utils/core/go_router/app_routes.dart';

import '../../basic_info/viewmodel/basic_info_viewmodel.dart';

@LazySingleton()
class CoverDetailViewModel extends ChangeNotifier
    implements AbstractCoverDetailViewModel {
  final GetQuoteUsecase getQuoteUseCase;

  CoverDetailViewModel({required this.getQuoteUseCase});

  bool agreeToTerms = false;
  String? _dob;
  late List<Quote> quote;

  @override
  bool isFormValid = false;

  void toggleAgreeToTerms() {
    agreeToTerms = !agreeToTerms;
    notifyListeners();
  }

  void setFormValid(bool value) {
    isFormValid = value;
    notifyListeners();
  }

  @override
  final TextEditingController firstNameController = TextEditingController();
  @override
  final TextEditingController lastNameController = TextEditingController();
  @override
  final TextEditingController emailController = TextEditingController();
  @override
  final TextEditingController idCardController = TextEditingController();
  @override
  final TextEditingController idCardCodeController = TextEditingController();

  @override
  final FocusNode firstNameFocusNode = FocusNode();
  @override
  final FocusNode lastNameFocusNode = FocusNode();
  @override
  final FocusNode emailFocusNode = FocusNode();
  @override
  final FocusNode idCardFocusNode = FocusNode();
  @override
  final FocusNode idCardCodeFocusNode = FocusNode();

  @override
  bool isFirstNameValid = false;
  @override
  bool isLastNameValid = false;
  @override
  bool isEmailValid = false;
  @override
  bool isIDCardCodeValid = false;
  @override
  bool isIDCardValid = false;

  @override
  void validateIDCard(String value) {
    isIDCardValid = value.isNotEmpty;
    notifyListeners();
  }

  @override
  void validateIDCardCode(String value) {
    isIDCardCodeValid = value.isNotEmpty;
    notifyListeners();
  }

  @override
  void validateFirstName(String value) {
    isFirstNameValid = value.isNotEmpty;
    notifyListeners();
  }

  @override
  void validateLastName(String value) {
    isLastNameValid = value.isNotEmpty;
    notifyListeners();
  }

  @override
  void validateEmail(String value) {
    isEmailValid = value.isNotEmpty;
    notifyListeners();
  }

  @override
  void validateForm() {
    isFormValid = isFirstNameValid &&
        isLastNameValid &&
        isEmailValid &&
        isIDCardCodeValid &&
        isIDCardValid;
  }

  @override
  Future<List<Quote>> getQuote(
      CoverQuoteViewModel coverQuoteViewModel,
      AttendingCustomerViewModel attendingCustomerViewModel,
      StartEndPickerViewModel startEndPickerViewModel,
      BasicInfoViewModel basicInfoViewModel) async {
    final List<String> coverIds = [];
    for (var element in coverQuoteViewModel.selectedCheckBox) {
      coverIds.add(element.id);
    }
    final GetQuoteRequest getQuoteRequest = GetQuoteRequest(
      accountId: '',
      coverId: coverQuoteViewModel.selectedCover.coverId,
      coverStartDate: startEndPickerViewModel.formattedStartDate,
      coverEndDate: startEndPickerViewModel.formattedEndDate,
      includedCoverItemIds: coverIds,
      email: basicInfoViewModel.email?.trim(),
      mobile: basicInfoViewModel.mobile,
      countryOfResidence: coverQuoteViewModel.selectedCountry.code,
      personsToCover: [
        PersonsToCover(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          dateOfBirth: dateOfBirth,
        ),
      ],
      language: 'en',
      country: coverQuoteViewModel.selectedCountry.code,
    );

    try {
      final result = await getQuoteUseCase(getQuoteRequest);
      // String data = await rootBundle.loadString('assets/data/quotes.json');
      // final jsonResult = jsonDecode(data);
      // final List<Quote> result = [];
      // jsonResult.forEach((v) {
      //   result.add(Quote.fromJson(v));
      // });
      quote = result;
      notifyListeners();
      return quote;
    } catch (e) {
      navigatorKey.currentState!.context.showSnackBar('Something went wrong');
      return [];
    }
  }

  @override
  set dateOfBirth(String? dateOfBirth) {
    _dob = dateOfBirth;
    notifyListeners();
  }

  @override
  String? get dateOfBirth => _dob;

  @override
  Future<List<Quote>> getQuoteForTwo(
      CoverQuoteViewModel coverQuoteViewModel,
      AttendingCustomerViewModel attendingCustomerViewModel,
      StartEndPickerViewModel startEndPickerViewModel,
      BasicInfoViewModel basicInfoViewModel,
      BothCoverDetailViewModel bothCoverDetailViewModel) {
    // TODO: implement getQuoteForTwo
    throw UnimplementedError();
  }

  @override
  set emailController(TextEditingController emailController) {}

  @override
  set firstNameController(TextEditingController firstNameController) {}

  @override
  set lastNameController(TextEditingController lastNameController) {}

  @override
  set idCardController(TextEditingController idCardController) {}

  @override
  set idCardCodeController(TextEditingController idCardController) {}

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    idCardController.dispose();
    emailController.dispose();
    idCardCodeController.dispose();
    super.dispose();
  }
}