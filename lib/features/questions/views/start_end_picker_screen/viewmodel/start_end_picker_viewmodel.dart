import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:travelbox/data/resources/r.dart';

@LazySingleton()
class StartEndPickerViewModel extends ChangeNotifier {
  DateTime? _startDate;

  DateTime? _endDate;

  DateTime? get startDate => _startDate;

  String get formattedStartDate =>
      DateFormat(R.stringRes.localeHelper.pickerDateFormatWithSlashes).format(_startDate!);

  String get formattedEndDate =>
      DateFormat(R.stringRes.localeHelper.pickerDateFormatWithSlashes).format(_endDate!);

  DateTime? get endDate => _endDate;

  void setStartDate(DateTime startDate) {
    _startDate = startDate;
    notifyListeners();
  }

  void setEndDate(DateTime endDate) {
    _endDate = endDate;
    notifyListeners();
  }

  bool isButtonEnabled() {
    return _startDate != null && _endDate != null;
  }
}
