import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/usecase/get_quote_usecase.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/model/card_data.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';

import '../../../model/quote_model.dart';
import '../../basic_info/viewmodel/basic_info_viewmodel.dart';
import '../../cover_details/widgets/cover_details_card_fields.dart';

@LazySingleton()
class FamilyGroupCoverDetailViewModel extends ChangeNotifier {
  final GetQuoteUsecase getQuoteUseCase;

  FamilyGroupCoverDetailViewModel({required this.getQuoteUseCase});

  List<CardData> attendee = [];

  late List<Quote> quote;

  //Info below belong to current visible person on screen
  String email = '';
  String lastName = '';
  DateTime dateOfBirth = DateTime.now();
  String firstName = '';
  String idCard = '';
  String idCardCode = '';

  CardData get cardData => CardData(
        firstName: firstName,
        lastName: lastName,
        email: email,
        dob: dateOfBirth,
        index: listIndex,
        idCard: idCard,
        idCardCode: idCardCode,
      );

  void setIDCard(String idCard) {
    this.idCard = idCard;
    notifyListeners();
  }

  void setIDCardCode(String idCardCode) {
    this.idCardCode = idCardCode;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setLastName(String lastName) {
    this.lastName = lastName;
    notifyListeners();
  }

  void setDateOfBirth(DateTime dateOfBirth) {
    this.dateOfBirth = dateOfBirth;
    notifyListeners();
  }

  DateTime setDayDOB(day) {
    int parsedDay;
    switch (day.runtimeType) {
      case int:
        if (day > 0 && day <= 31) {
          parsedDay = day;
        } else {
          parsedDay = 1;
        }
        break;
      case String:
      default:
        parsedDay = int.tryParse(day) ?? 1;
        break;
    }
    var result = dateOfBirth.copyWith(day: parsedDay);
    setDateOfBirth(result);
    return result;
  }

  DateTime setMonthDOB(month) {
    int parsedMonth;
    switch (month.runtimeType) {
      case int:
        if (month > 0 && month <= 12) {
          parsedMonth = month;
        } else {
          parsedMonth = 1;
        }
        break;
      case String:
      default:
        parsedMonth = int.tryParse(month) ?? 1;
        break;
    }
    var result = dateOfBirth.copyWith(day: parsedMonth);
    setDateOfBirth(result);
    return result;
  }

  DateTime setYearDOB(year) {
    int parsedYear;
    switch (year.runtimeType) {
      case int:
        if (1900 <= year && year <= DateTime.now().year) {
          parsedYear = year;
        } else {
          parsedYear = 2000;
        }
        break;
      case String:
      default:
        parsedYear = int.tryParse(year) ?? 1;
        break;
    }
    var result = dateOfBirth.copyWith(year: parsedYear);
    setDateOfBirth(result);
    return result;
  }

  void clear() {
    email = '';
    lastName = '';
    firstName = '';
    dateOfBirth = DateTime.now();
    idCard = '';
    idCardCode = '';
    notifyListeners();
  }

  void setFirstName(String firstName) {
    this.firstName = firstName;
    notifyListeners();
  }

  void addAttendee(CardData cardData) {
    attendee.add(cardData);
    listIndex++;
    notifyListeners();
  }

  final List<CoverDetailCardFields> _cardList = [];

  int listIndex = 0;
  int selectedIndex = 0;
  bool agreeToTerm = false;

  List<CoverDetailCardFields> get cardList => _cardList;

  void setSelectIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void addCard(CoverDetailCardFields card) {
    _cardList.add(card);
    notifyListeners();
  }

  void toggleAgreeToTerm() {
    agreeToTerm = !agreeToTerm;
    notifyListeners();
  }

  /// removeIndexValue is index value of CardData, not the real index of attendee
  /// Example list index value: [0, 1, 2, 3] => [0, 2, 3] => [0, 3]
  void removeCard(int removeIndexValue) {
    // Remove item with index
    if (_cardList.length > 1 || attendee.length > 1) {
      //Find item with index value
      CardData? data = attendee
          .firstWhereOrNull((element) => element.index == removeIndexValue);
      CoverDetailCardFields? widget = _cardList
          .firstWhereOrNull((element) => element.index == removeIndexValue);
      //Remove
      attendee.remove(data);
      _cardList.remove(widget);
      //Notify & update UI
      if (listIndex > 0) {
        listIndex--;
        notifyListeners();
      }
    }
  }

  Future<List<Quote>> getQuote(
      CoverQuoteViewModel coverQuoteViewModel,
      AttendingCustomerViewModel attendingCustomerViewModel,
      StartEndPickerViewModel startEndPickerViewModel,
      BasicInfoViewModel basicInfoViewModel) async {
    final List<String> coverIds = [];
    final List<PersonsToCover> persons = [];
    for (var element in coverQuoteViewModel.selectedCheckBox) {
      coverIds.add(element.id);
    }
    final DateFormat formatter =
        DateFormat(R.stringRes.localeHelper.pickerDateFormatWithSlashes);
    for (var element in attendee) {
      persons.add(
        PersonsToCover(
          firstName: element.firstName,
          lastName: element.lastName,
          dateOfBirth: formatter.format(element.dob),
        ),
      );
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
      personsToCover: persons,
      language: 'en',
      country: coverQuoteViewModel.selectedCountry.code,
    );

    try {
      final result = await getQuoteUseCase(getQuoteRequest);
      quote = result;
      notifyListeners();
      return quote;
    } catch (e) {
      EasyLoading.showError(AppLocalizations.current.msg_error_something_went_wrong);
      return [];
    }
  }
}
