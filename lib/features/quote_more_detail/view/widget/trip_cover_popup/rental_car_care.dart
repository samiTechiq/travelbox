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

class RentalCarCare extends StatefulWidget {
  const RentalCarCare({super.key});

  @override
  State<RentalCarCare> createState() => _RentalCarCareState();
}

class _RentalCarCareState extends State<RentalCarCare> {
  String? form;

  String? to;

  DateTime? initialStartDate;

  DateTime? initialEndDate;

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
        title: AppLocalizations.of(context).txt_rental_car_care,
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
          AppLocalizations.of(context).txt_accidental_damage,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16.sp,
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

class RentalCarCareMobile extends StatefulWidget {
  const RentalCarCareMobile({
    super.key,
  });

  @override
  State<RentalCarCareMobile> createState() => _RentalCarCareMobileState();
}

class _RentalCarCareMobileState extends State<RentalCarCareMobile> {
  String? form;

  String? to;

  DateTime? initialStartDate;

  DateTime? initialEndDate;

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
        title: AppLocalizations.of(context).txt_rental_car_care,
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
          AppLocalizations.of(context).txt_accidental_damage,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16.sp,
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

class RentalCarCareDesktop extends StatefulWidget {
  const RentalCarCareDesktop({super.key});

  @override
  State<RentalCarCareDesktop> createState() => _RentalCarCareDesktopState();
}

class _RentalCarCareDesktopState extends State<RentalCarCareDesktop> {
  String? form;

  String? to;

  DateTime? initialStartDate;

  DateTime? initialEndDate;

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
        title: AppLocalizations.of(context).txt_rental_car_care,
        onPressed: () {},
        content: content(),
        titleButton: "${AppLocalizations.of(context).add_to_plan_for} HK\$",
        isEnableButton: isEnable());
  }

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeading(
          AppLocalizations.of(context).txt_accidental_damage,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 16.sp,
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
