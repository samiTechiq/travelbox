import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/time_picker_popup.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/until_date_builder.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';
import 'package:travelbox/utils/widgets/text_fields/app_text_field.dart';

import '../../../../../data/di/dependeny_injection.dart';

class PickerCard extends StatelessWidget {
  const PickerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: PickerCardMobile(),
      desktopLayout: PickerCardDesktop(),
    );
  }
}

class PickerCardMobile extends StatelessWidget {
  const PickerCardMobile({Key? key}) : super(key: key);

  static TextEditingController fromDateController = TextEditingController();
  static TextEditingController untilDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final coverQuoteViewModel = sl<CoverQuoteViewModel>();
    final viewModel = context.watch<StartEndPickerViewModel>();
    return Container(
      width: double.maxFinite,
      decoration: R.theme.genericCardDecoration,
      child: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(
              AppLocalizations.of(context).txt_select_date,
              color: R.palette.darkBlack,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).From,
              color: R.palette.lightGray,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 12.h,
            ),
            GenericTextField(
              hintText: R.stringRes.coverPickerScreen.fieldHint,
              controller: fromDateController,
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontFamily: R.theme.interRegular,
                fontWeight: FontWeight.w500,
                color: R.palette.mediumBlack,
              ),
              hintStyle: TextStyle(
                fontSize: 15.sp,
                fontFamily: R.theme.interRegular,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: R.palette.mediumBlack,
              ),
              onlyRead: true,
              enableInteractiveSelection: false,
              onTap: () async {
                if (coverQuoteViewModel.timeframeSelected ==
                    AvailableCoversTimeFrame.single) {
                  DateTimeRange? dateRange = await showDateRangeCalenderPicker(
                    context: context,
                    initialStartDate: viewModel.startDate,
                    initialEndDate: viewModel.endDate,
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
                    viewModel.setStartDate(dateRange.start);
                    viewModel.setEndDate(dateRange.end);
                  }
                  if (dateRange?.start == null || dateRange?.end == null) {
                    return;
                  }
                  String formattedStartDate = DateFormat(
                          R.stringRes.localeHelper.reversePickerDateFormatYYYY)
                      .format(dateRange!.start);
                  fromDateController.text = formattedStartDate;
                  String formattedEndDate = DateFormat(
                          R.stringRes.localeHelper.reversePickerDateFormatYYYY)
                      .format(dateRange.end);
                  untilDateController.text = formattedEndDate;
                  return;
                }
                DateTime? pickedDate = await showDateCalenderPicker(
                  context: context,
                  initialStartDate: viewModel.startDate,
                  minimumDate: DateTime.now(),
                  maximumDate: DateTime(2100),
                );

                if (pickedDate != null) {
                  viewModel.setStartDate(pickedDate);
                  String formattedDate = DateFormat(
                          R.stringRes.localeHelper.reversePickerDateFormatYYYY)
                      .format(pickedDate);
                  fromDateController.text = formattedDate;
                  if (coverQuoteViewModel.timeframeSelected ==
                      AvailableCoversTimeFrame.annual) {
                    viewModel
                        .setEndDate(pickedDate.add(const Duration(days: 365)));
                    String formattedDate = DateFormat(R
                            .stringRes.localeHelper.reversePickerDateFormatYYYY)
                        .format(pickedDate.add(const Duration(days: 365)));
                    untilDateController.text = formattedDate;
                  }
                }
              },
              trailingIcon: Icon(
                Icons.calendar_month_outlined,
                size: 18.h,
                color: R.palette.textFieldHintGreyColor,
              ),
              useBottomPadding: false,
            ),
            SizedBox(
              height: 33.h,
            ),
            if (viewModel.startDate != null ||
                sl<CoverQuoteViewModel>().timeframeSelected ==
                    AvailableCoversTimeFrame.single) ...[
              SubHeading(
                AppLocalizations.of(context).txt_until,
                color: R.palette.lightGray,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 12.h,
              ),
              UntilDateBuilder(
                timeFrame: sl<CoverQuoteViewModel>().timeframeSelected,
                untilDateController: untilDateController,
                viewModel: viewModel,
              ),
              SizedBox(
                height: 37.h,
              )
            ],
          ],
        ),
      ),
    );
  }
}

class PickerCardDesktop extends StatelessWidget {
  const PickerCardDesktop({Key? key}) : super(key: key);

  static TextEditingController fromDateController = TextEditingController();

  static TextEditingController untilDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final coverQuoteViewModel = sl<CoverQuoteViewModel>();
    final viewModel = context.watch<StartEndPickerViewModel>();
    return Container(
      width: double.maxFinite,
      decoration: R.theme.genericCardDecoration,
      child: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 35.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(
              AppLocalizations.of(context).txt_select_date,
              color: R.palette.darkBlack,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 28.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).From,
                      color: R.palette.lightGray,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: (viewModel.startDate != null ||
                              sl<CoverQuoteViewModel>().timeframeSelected ==
                                  AvailableCoversTimeFrame.single)
                          ? 0.158.sw
                          : 0.32.sw,
                      child: GenericTextField(
                        hintText: R.stringRes.coverPickerScreen.fieldHint,
                        controller: fromDateController,
                        textStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w500,
                          color: R.palette.mediumBlack,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                          color: R.palette.mediumBlack,
                        ),
                        onlyRead: true,
                        enableInteractiveSelection: false,
                        onTap: () async {
                          if (coverQuoteViewModel.timeframeSelected ==
                              AvailableCoversTimeFrame.single) {
                            DateTimeRange? dateRange =
                                await showDateRangeCalenderPicker(
                              context: context,
                              initialEndDate: viewModel.endDate,
                              initialStartDate: viewModel.startDate,
                              minimumDate: DateTime.now(),
                              maximumDate: DateTime(2100),
                            );

                            if (dateRange != null) {
                              int differenceInDays = dateRange.end
                                  .difference(dateRange.start)
                                  .inDays;
                              if (differenceInDays > 90) {
                                return Future.delayed(Duration.zero, () {
                                  EasyLoading.showError(
                                      AppLocalizations.of(context).msg_error_no_more_then_90_days);
                                  return;
                                });
                              }
                              viewModel.setStartDate(dateRange.start);
                              viewModel.setEndDate(dateRange.end);
                            }
                            if (dateRange?.start == null ||
                                dateRange?.end == null) {
                              return;
                            }
                            String formattedStartDate = DateFormat(R.stringRes
                                    .localeHelper.reversePickerDateFormatYYYY)
                                .format(dateRange!.start);
                            fromDateController.text = formattedStartDate;
                            String formattedEndDate = DateFormat(R.stringRes
                                    .localeHelper.reversePickerDateFormatYYYY)
                                .format(dateRange.end);
                            untilDateController.text = formattedEndDate;
                            return;
                          }

                          DateTime? pickedDate = await showDateCalenderPicker(
                            context: context,
                            initialStartDate: viewModel.startDate,
                            minimumDate: DateTime.now(),
                            maximumDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            viewModel.setStartDate(pickedDate);
                            String formattedDate = DateFormat(R.stringRes
                                    .localeHelper.reversePickerDateFormatYYYY)
                                .format(pickedDate);
                            fromDateController.text = formattedDate;
                            if (coverQuoteViewModel.timeframeSelected ==
                                AvailableCoversTimeFrame.annual) {
                              viewModel.setEndDate(
                                  pickedDate.add(const Duration(days: 365)));
                              String formattedDate = DateFormat(R.stringRes
                                      .localeHelper.reversePickerDateFormatYYYY)
                                  .format(pickedDate
                                      .add(const Duration(days: 365)));
                              untilDateController.text = formattedDate;
                            }
                          }
                        },
                        trailingIcon: Icon(
                          Icons.calendar_month_outlined,
                          size: 18.h,
                          color: R.palette.textFieldHintGreyColor,
                        ),
                        useBottomPadding: false,
                      ),
                    )
                  ],
                ),
                if (viewModel.startDate != null) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).txt_until,
                        color: R.palette.lightGray,
                        fontSize:16,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        width:  0.158.sw,
                        child: UntilDateBuilder(
                          timeFrame:
                              sl<CoverQuoteViewModel>().timeframeSelected,
                          untilDateController: untilDateController,
                          viewModel: viewModel,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ]
              ],
            ),
            SizedBox(
              height: 37.h,
            )
          ],
        ),
      ),
    );
  }
}
