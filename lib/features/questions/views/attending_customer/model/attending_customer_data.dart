import '../viewmodel/attending_customer_viewmodel.dart';

class AttendingCustomerDataModel {
  final String title;
  bool isSelected;
  final TravelingPartner travelingPartner;

  AttendingCustomerDataModel({
    required this.title,
    this.isSelected = false,
    required this.travelingPartner,
  });
}
