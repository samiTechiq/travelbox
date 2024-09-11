import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/time_picker_popup.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/text_fields/app_text_field.dart';

import '../../../../cover_quote/viewmodel/cover_quote_viewmodel.dart';

class UntilDateBuilder extends StatelessWidget {
  final AvailableCoversTimeFrame timeFrame;
  final TextEditingController untilDateController;
  final StartEndPickerViewModel viewModel;
  final double fontSize;

  const UntilDateBuilder({
    Key? key,
    required this.timeFrame,
    required this.untilDateController,
    required this.viewModel,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (timeFrame) {
      case AvailableCoversTimeFrame.annual:
        return GenericTextField(
          hintText: R.stringRes.coverPickerScreen.fieldHint,
          onlyRead: true,
          enableInteractiveSelection: false,
          controller: untilDateController,
          textStyle: TextStyle(
            fontSize: fontSize.sp,
            fontFamily: R.theme.interRegular,
            fontWeight: FontWeight.w600,
            color: R.palette.mediumBlack,
          ),
          hintStyle: TextStyle(
            fontSize: fontSize.sp,
            fontFamily: R.theme.interRegular,
            fontWeight: FontWeight.w600,
            height: 1.4,
            color: R.palette.mediumBlack,
          ),
          onTap: () async {
            DateTime? pickedDate = await showDateCalenderPicker(
              context: context,
              initialStartDate: viewModel.endDate ?? DateTime.now(),
              minimumDate: DateTime.now(),
              maximumDate: DateTime(2100),
            );

            if (pickedDate != null) {
              int differenceInDays =
                  pickedDate.difference(viewModel.startDate!).inDays;
              if (differenceInDays > 90) {
                return Future.delayed(Duration.zero, () {
                  EasyLoading.showError(
                      AppLocalizations.of(context).msg_error_no_more_then_90_days);
                  return;
                });
              }

              int isBetter = pickedDate.compareTo(viewModel.startDate!);
              if (isBetter < 0) {
                return Future.delayed(Duration.zero, () {
                  EasyLoading.showError(AppLocalizations.of(context).msg_error_cant_choose_date);
                  return;
                });
              }

              viewModel.setEndDate(pickedDate);

              String formattedDate = DateFormat(
                      R.stringRes.localeHelper.reversePickerDateFormatYYYY)
                  .format(pickedDate);
              untilDateController.text = formattedDate;
            } else {}
          },
          trailingIcon: Icon(
            Icons.calendar_month_outlined,
            size: 18.h,
            color: R.palette.textFieldHintGreyColor,
          ),
          useBottomPadding: false,
        );
      case AvailableCoversTimeFrame.single:
        return GenericTextField(
          hintText: R.stringRes.coverPickerScreen.fieldHint,
          onlyRead: true,
          enableInteractiveSelection: false,
          controller: untilDateController,
          textStyle: TextStyle(
            fontSize: fontSize.sp,
            fontFamily: R.theme.interRegular,
            fontWeight: FontWeight.w600,
            color: R.palette.mediumBlack,
          ),
          hintStyle: TextStyle(
            fontSize: fontSize.sp,
            fontFamily: R.theme.interRegular,
            fontWeight: FontWeight.w600,
            height: 1.4,
            color: R.palette.mediumBlack,
          ),
          onTap: () async {
            DateTime? pickedDate = await showDateCalenderPicker(
              context: context,
              initialStartDate: viewModel.endDate ?? DateTime.now(),
              minimumDate: DateTime.now(),
              maximumDate: DateTime(2100),
            );

            if (pickedDate != null) {
              int differenceInDays =
                  pickedDate.difference(viewModel.startDate!).inDays;
              if (differenceInDays > 90) {
                return Future.delayed(Duration.zero, () {
                  EasyLoading.showError(
                      AppLocalizations.of(context).msg_error_no_more_then_90_days);
                  return;
                });
              }

              int isBetter = pickedDate.compareTo(viewModel.startDate!);
              if (isBetter < 0) {
                return Future.delayed(Duration.zero, () {
                  EasyLoading.showError(
                      AppLocalizations.of(context).msg_error_please_choose_until_date_after_from_date);
                  return;
                });
              }

              viewModel.setEndDate(pickedDate);

              String formattedDate = DateFormat(
                      R.stringRes.localeHelper.reversePickerDateFormatYYYY)
                  .format(pickedDate);
              untilDateController.text = formattedDate;
            } else {}
          },
          trailingIcon: Icon(
            Icons.calendar_month_outlined,
            size: 18.h,
            color: R.palette.textFieldHintGreyColor,
          ),
          useBottomPadding: false,
        );

      default:
        return GenericTextField(
          hintText: R.stringRes.coverPickerScreen.fieldHint,
          onlyRead: true,
          enableInteractiveSelection: false,
          controller: untilDateController,
          textStyle: TextStyle(
            fontSize: fontSize.sp,
            fontFamily: R.theme.interRegular,
            fontWeight: FontWeight.w600,
            color: R.palette.mediumBlack,
          ),
          hintStyle: TextStyle(
            fontSize: fontSize.sp,
            fontFamily: R.theme.interRegular,
            fontWeight: FontWeight.w600,
            height: 1.4,
            color: R.palette.mediumBlack,
          ),
          onTap: () async {
            DateTime? pickedDate = await showDateCalenderPicker(
              context: context,
              initialStartDate: viewModel.endDate ?? DateTime.now(),
              minimumDate: DateTime.now(),
              maximumDate: DateTime(2100),
            );

            if (pickedDate != null) {
              int differenceInDays =
                  pickedDate.difference(viewModel.startDate!).inDays;
              if (differenceInDays > 90) {
                return Future.delayed(Duration.zero, () {
                  EasyLoading.showError(
                      AppLocalizations.of(context).msg_error_no_more_then_90_days);
                  return;
                });
              }

              int isBetter = pickedDate.compareTo(viewModel.startDate!);
              if (isBetter < 0) {
                return Future.delayed(Duration.zero, () {
                  EasyLoading.showError(
                      AppLocalizations.of(context).msg_error_please_choose_until_date_after_from_date);
                  return;
                });
              }

              viewModel.setEndDate(pickedDate);

              String formattedDate = DateFormat(
                      R.stringRes.localeHelper.reversePickerDateFormatYYYY)
                  .format(pickedDate);
              untilDateController.text = formattedDate;
            } else {}
          },
          trailingIcon: Icon(
            Icons.calendar_month_outlined,
            size: 18.h,
            color: R.palette.textFieldHintGreyColor,
          ),
          useBottomPadding: false,
        );
    }
  }
}
