import 'dart:ui';

class CustomDateRangePickerArgs {
  final Color backgroundColor;
  final DateTime maximumDate;
  final DateTime minimumDate;
  final Function(dynamic, dynamic) onApplyClick;
  final VoidCallback onCancelClick;
  final Color primaryColor;
  final DateTime? initialEndDate;
  final DateTime? initialStartDate;

  CustomDateRangePickerArgs({
    required this.backgroundColor,
    required this.maximumDate,
    required this.minimumDate,
    required this.onApplyClick,
    required this.onCancelClick,
    required this.primaryColor,
    required this.initialEndDate,
    required this.initialStartDate,
  });
}
