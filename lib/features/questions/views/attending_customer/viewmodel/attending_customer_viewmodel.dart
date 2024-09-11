import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/features/questions/views/attending_customer/model/attending_customer_data.dart';

enum TravelingPartner { one, two, family, group, none }

@LazySingleton()
class AttendingCustomerViewModel extends ChangeNotifier {
  String _attendingCustomer = '';
  TravelingPartner _travelingPartner = TravelingPartner.none;

  String get attendingCustomer => _attendingCustomer;

  TravelingPartner get travelingPartner => _travelingPartner;

  void _setAttendingCustomer(AttendingCustomerDataModel attendingCustomer) {
    _attendingCustomer = attendingCustomer.title;
    _travelingPartner = attendingCustomer.travelingPartner;
    notifyListeners();
  }

  void toggleSelectedAttendee(
      AttendingCustomerDataModel data, List<AttendingCustomerDataModel> list) {
    for (var element in list) {
      element.isSelected = false;
    }
    data.isSelected = !data.isSelected;
    _setAttendingCustomer(data);
    notifyListeners();
  }
}
