import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/time_picker_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/add_decline_service_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/base_quote_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/time_picker_widget.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CarHireExcessPopup extends StatelessWidget {
  const CarHireExcessPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: CarHireExcessPopupMobile(),
        desktopLayout: CarHireExcessPopupDesktop());
  }
}

class CarHireExcessPopupMobile extends StatefulWidget {
  const CarHireExcessPopupMobile({super.key});

  @override
  State<CarHireExcessPopupMobile> createState() =>
      _CarHireExcessPopupMobileState();
}

class _CarHireExcessPopupMobileState extends State<CarHireExcessPopupMobile> {
  String? form;

  String? to;

  DateTime? initialStartDate;

  DateTime? initialEndDate;

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
        title: AppLocalizations.of(context).car_hire_excess_waiver,
        onPressed: () {},
        content: content(),
        titleButton: "${AppLocalizations.of(context).add_to_plan_for} HK\$",
        isEnableButton: isEnable());
  }

  Widget content() {
    return Expanded(
        child: Column(
      children: [
        SubHeading(
          AppLocalizations.of(context).rental_vehicle_excess_cover_content,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          maxLines: 10,
        ),
        SizedBox(
          height: 12.h,
        ),
        SubHeading(
          AppLocalizations.of(context).rental_vehicle_excess_cover_content_2,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          maxLines: 10,
        ),
        SizedBox(height: 35.h),
        TimePickerWidget(
          onDatePicker: () async {
            DateTimeRange? dateRange = await showDateRangeCalenderPicker(
              context: context,
              initialStartDate: initialStartDate,
              initialEndDate: initialEndDate,
              minimumDate: DateTime.now(),
              maximumDate: DateTime(2100),
            );
            if (dateRange != null) {
              int differenceInDays =
                  dateRange.end.difference(dateRange.start).inDays;
              if (differenceInDays > 90) {
                return Future.delayed(Duration.zero, () {
                  EasyLoading.showError(
                      AppLocalizations.of(context).msg_error_no_more_then_90_days);
                  return;
                });
              }
              setState(() {
                form = DateFormat(R.stringRes.localeHelper.pickerDateFormatter)
                    .format(dateRange.start);
                to = DateFormat(R.stringRes.localeHelper.pickerDateFormatter)
                    .format(dateRange.end);
                initialStartDate = dateRange.start;
                initialEndDate = dateRange.end;
              });
            }
            if (dateRange?.start == null || dateRange?.end == null) {
              return;
            }
            return;
          },
          form: form,
          to: to,
        ),
        const Spacer(),
        AddDeclineServiceWidget(
          country: 'HK'.hardcoded,
          money: '24.6'.hardcoded,
          isAdd: true,
        ),
      ],
    ));
  }

  bool isEnable() {
    if (form != null && to != null) {
      return true;
    }
    return false;
  }
}

class CarHireExcessPopupDesktop extends StatefulWidget {
  const CarHireExcessPopupDesktop({super.key});

  @override
  State<CarHireExcessPopupDesktop> createState() =>
      _CarHireExcessPopupDesktopState();
}

class _CarHireExcessPopupDesktopState extends State<CarHireExcessPopupDesktop> {
  String? form;

  String? to;

  DateTime? initialStartDate;

  DateTime? initialEndDate;

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
        title: AppLocalizations.of(context).car_hire_excess_waiver,
        onPressed: () {},
        content: content(),
        titleButton: "${AppLocalizations.of(context).add_to_plan_for} HK\$260".hardcoded,
        isEnableButton: isEnable());
  }

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeading(
          AppLocalizations.of(context).rental_vehicle_excess_cover_content,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 4,
          fontWeight: FontWeight.w400,
          maxLines: 10,
        ),
        SizedBox(
          height: 12.h,
        ),
        SubHeading(
          AppLocalizations.of(context).rental_vehicle_excess_cover_content_2,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 4,
          fontWeight: FontWeight.w400,
          maxLines: 10,
        ),
        SizedBox(height: 30.h),
        TimePickerWidget(
          onDatePicker: () async {
            DateTimeRange? dateRange = await showDateRangeCalenderPicker(
              context: context,
              initialStartDate: initialStartDate,
              initialEndDate: initialEndDate,
              minimumDate: DateTime.now(),
              maximumDate: DateTime(2100),
            );
            if (dateRange != null) {
              int differenceInDays =
                  dateRange.end.difference(dateRange.start).inDays;
              if (differenceInDays > 90) {
                return Future.delayed(Duration.zero, () {
                  EasyLoading.showError(
                      AppLocalizations.of(context).msg_error_no_more_then_90_days);
                  return;
                });
              }
              setState(() {
                form = DateFormat(R.stringRes.localeHelper.pickerDateFormatter)
                    .format(dateRange.start);
                to = DateFormat(R.stringRes.localeHelper.pickerDateFormatter)
                    .format(dateRange.end);
                initialStartDate = dateRange.start;
                initialEndDate = dateRange.end;
              });
            }
            if (dateRange?.start == null || dateRange?.end == null) {
              return;
            }
            return;
          },
          form: form,
          to: to,
        ),
        SizedBox(height: 200.h),
        AddDeclineServiceWidget(
          country: 'HK'.hardcoded,
          money: '24.6'.hardcoded,
          isAdd: true,
        ),
      ],
    );
  }

  bool isEnable() {
    if (form != null && to != null) {
      return true;
    }
    return false;
  }
}
