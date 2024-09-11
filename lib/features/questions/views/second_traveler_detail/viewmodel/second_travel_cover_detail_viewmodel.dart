import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/viewmodel/cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/both_cover_detail/viewmodel/both_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';

import '../../../model/quote_model.dart';
import '../../../usecase/get_quote_usecase.dart';
import '../../basic_info/viewmodel/basic_info_viewmodel.dart';

@LazySingleton()
class SecondTravelCoverDetailsViewModel extends ChangeNotifier
    implements AbstractCoverDetailViewModel {
  final GetQuoteUsecase getQuoteUseCase;

  SecondTravelCoverDetailsViewModel({required this.getQuoteUseCase});

  bool agreeToTerms = false;
  late List<Quote> quote;
  String? _dob;

  void toggleAgreeToTerms() {
    agreeToTerms = !agreeToTerms;
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
  bool isFormValid = false;
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
    isFormValid = isFirstNameValid && isLastNameValid && isEmailValid && isIDCardCodeValid && isIDCardValid;
  }

  @override
  Future<List<Quote>> getQuote(
      CoverQuoteViewModel coverQuoteViewModel,
      AttendingCustomerViewModel attendingCustomerViewModel,
      StartEndPickerViewModel startEndPickerViewModel,
      BasicInfoViewModel basicInfoViewModel) async {
    return [];
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
      BothCoverDetailViewModel bothCoverDetailViewModel) async {
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
      email: basicInfoViewModel.email,
      mobile: basicInfoViewModel.mobile,
      countryOfResidence: coverQuoteViewModel.selectedCountry.code,
      personsToCover: [
        PersonsToCover(
          firstName: bothCoverDetailViewModel.firstNameController.text,
          lastName: bothCoverDetailViewModel.lastNameController.text,
          dateOfBirth: bothCoverDetailViewModel.dob,
        ),
        PersonsToCover(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          dateOfBirth: _dob,
        ),
      ],
      language: 'en',
      country: coverQuoteViewModel.selectedCountry.code,
    );

    final result = await getQuoteUseCase(getQuoteRequest);
    // String data = await rootBundle.loadString('assets/data/quotes_for_two.json');
    // final jsonResult = jsonDecode(data);
    // final List<Quote> result = [];
    // jsonResult.forEach((v) {
    //   result.add(Quote.fromJson(v));
    // });
    quote = result;
    notifyListeners();
    return quote;
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
