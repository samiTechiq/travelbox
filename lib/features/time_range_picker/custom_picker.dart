import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'custom_calender.dart';

/// A custom date range picker widget that allows users to select a date range.
/// `const CustomDateRangePicker({
///   Key? key,
///   this.initialStartDate,
///   this.initialEndDate,
///   required this.primaryColor,
///   required this.backgroundColor,
///   required this.onApplyClick,
///   this.barrierDismissible = true,
///   required this.minimumDate,
///   required this.maximumDate,
///   required this.onCancelClick,
/// })`
class CustomDateRangePicker extends StatefulWidget {
  /// The minimum date that can be selected in the calendar.
  final DateTime minimumDate;

  /// The maximum date that can be selected in the calendar.
  final DateTime maximumDate;

  /// Whether the widget can be dismissed by tapping outside of it.
  final bool barrierDismissible;

  /// The initial start date for the date range picker. If not provided, the calendar will default to the minimum date.
  final DateTime? initialStartDate;

  /// The initial end date for the date range picker. If not provided, the calendar will default to the maximum date.
  final DateTime? initialEndDate;

  /// The primary color used for the date range picker.
  final Color primaryColor;

  /// The background color used for the date range picker.
  final Color backgroundColor;

  /// A callback function that is called when the user applies the selected date range.
  final Function(DateTime, DateTime) onApplyClick;

  /// A callback function that is called when the user cancels the selection of the date range.
  final Function() onCancelClick;

  const CustomDateRangePicker({
    Key? key,
    this.initialStartDate,
    this.initialEndDate,
    required this.primaryColor,
    required this.backgroundColor,
    required this.onApplyClick,
    this.barrierDismissible = true,
    required this.minimumDate,
    required this.maximumDate,
    required this.onCancelClick,
  }) : super(key: key);

  @override
  CustomDateRangePickerState createState() => CustomDateRangePickerState();
}

class CustomDateRangePickerState extends State<CustomDateRangePicker>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  DateTime? startDate;

  DateTime? endDate;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    startDate = widget.initialStartDate;
    endDate = widget.initialEndDate;
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 39.h),
            child: Column(
              children: [
                Container(
                  decoration: R.theme.genericCardDecoration,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 28.w, right: 16.22.w, top: 16.22.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SubHeading(
                                  AppLocalizations.of(context).txt_rental_vehicle_excess_cover,
                                  fontWeight: FontWeight.w600,
                                  maxLines: 3,
                                  color: R.palette.darkBlack,
                                  fontSize: 24,
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    sl<Navigation>().goBack(context);
                                  },
                                  child: Image.asset(
                                    R.assets.graphics.cross.path,
                                    width: 18.24.w,
                                    height: 18.24.w,
                                  ))
                            ],
                          ),
                          CustomCalendar(
                            minimumDate: widget.minimumDate,
                            maximumDate: widget.maximumDate,
                            initialEndDate: widget.initialEndDate,
                            initialStartDate: widget.initialStartDate,
                            primaryColor: widget.primaryColor,
                            startEndDateChange:
                                (DateTime startDateData, DateTime endDateData) {
                              setState(() {
                                startDate = startDateData;
                                endDate = endDateData;
                              });
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GenericButton(
                                  height: 41.83.h,
                                  fontSize: 17.29.sp,
                                  color: R.palette.disableButtonColor,
                                  buttonTextColor: R.palette.appGreyTextColor,
                                  onPressed: () {
                                    try {
                                      widget.onCancelClick();
                                      Navigator.pop(context);
                                    } catch (_) {}
                                  },
                                  text: AppLocalizations.of(context).cancel,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: GenericButton(
                                  height: 41.83.h,
                                  fontSize: 17.29.sp,
                                  onPressed: () {
                                    try {
                                      widget.onApplyClick(startDate!, endDate!);
                                      Navigator.pop(context);
                                    } catch (_) {}
                                  },
                                  text:
                                      AppLocalizations.of(context).txt_select_date,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 22.17.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                GenericButton(
                  onPressed: () {},
                  text: AppLocalizations.of(context).btn_add_to_plan_for_HK,
                ),
                SizedBox(
                  height: 30.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).txt_vehicle_policy('HK\$5,000'),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  maxLines: 13,
                  color: R.palette.textFieldHintGreyColor,
                ),
                SizedBox(
                  height: 56.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
