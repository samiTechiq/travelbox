import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/detail_policy/widgets/personal_tile.dart';
import 'package:travelbox/features/detail_policy/widgets/policy__detail_widget.dart';
import 'package:travelbox/features/detail_policy/widgets/ticker_view/ticket_view.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/questions/views/both_cover_detail/viewmodel/both_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/viewmodel/cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/family_group_cover_details/viewmodel/family_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/second_traveler_detail/viewmodel/second_travel_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/calendar_utils.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class DetailPolicyScreenDesktop extends StatelessWidget {
  DetailPolicyScreenDesktop({Key? key}) : super(key: key);

  // static List<Widget> widgets = [
  //   PolicyDetailWidget(
  //     text: R.stringRes.policyDetailScreen.medicalExpenses,
  //     subText: "\$1,000,000",
  //   ),
  //   PolicyDetailWidget(
  //     text: R.stringRes.policyDetailScreen.personalAccident,
  //     subText: "\$1,200,000",
  //   ),
  //   PolicyDetailWidget(
  //     text: R.stringRes.policyDetailScreen.worldAssistance,
  //     subText: R.stringRes.policyDetailScreen.available,
  //   )
  // ];
  final order = sl<QuoteDetailViewModel>().order;
  final basicInfoViewModel = sl<BasicInfoViewModel>();
  final coverDetailViewModel = sl<CoverDetailViewModel>();
  final coverQuoteViewModel = sl<CoverQuoteViewModel>();
  final secondTravelerViewModel = sl<SecondTravelCoverDetailsViewModel>();
  final bothCoverDetail = sl<BothCoverDetailViewModel>();
  final familyAndGroupViewModel = sl<FamilyGroupCoverDetailViewModel>();
  final startEndViewModel = sl<StartEndPickerViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          appBar: GenericAppBarDesktop(
            trailing: SubHeading(
              AppLocalizations.of(context).txt_skip,
              fontSize: 8,
              fontWeight: FontWeight.w400,
              color: R.palette.darkBlack,
            ),
            leading: InkWell(
              onTap: () {
                sl<Navigation>().goBack(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: R.palette.mediumBlack,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 0.45.sw,
                    child: Column(
                      children: [
                        Heading(
                          AppLocalizations.of(context).details_about_your_policy,
                          fontSize: 6,
                          color: R.palette.appHeadingTextBlackColor,
                          fontFamily: R.theme.larkenLightFontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Center(
                          child: Column(
                            children: [
                              GenericText(
                                AppLocalizations.of(context).txt_your_quote,
                                fontStyle: FontStyle.italic,
                                fontFamily: R.theme.larken,
                                fontSize: 6,
                                fontWeight: FontWeight.w900,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Baseline(
                                    baseline: 50.0,
                                    baselineType: TextBaseline.alphabetic,
                                    child: SizedBox(
                                      child: Text(
                                        sl<QuoteDetailViewModel>().currency ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 4.sp,
                                          fontFamily: R.theme.larken,
                                          fontWeight: FontWeight.w900,
                                          color: R.palette.appPrimaryBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Baseline(
                                    baseline: 50.0,
                                    baselineType: TextBaseline.alphabetic,
                                    child: Text(
                                      sl<QuoteDetailViewModel>()
                                          .totalPrice
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                        fontSize: 10.0.sp,
                                        fontFamily: R.theme.larken,
                                        fontWeight: FontWeight.w900,
                                        color: R.palette.appPrimaryBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // RichText(
                              //   text: TextSpan(children: [
                              //     WidgetSpan(
                              //       child: Transform.translate(
                              //         offset: const Offset(-1, 1),
                              //         child: Text(
                              //           sl<QuoteDetailViewModel>().currency ?? '',
                              //           textScaleFactor: 0.7,
                              //           style: TextStyle(
                              //             fontSize: 8.0.sp,
                              //             fontFamily: R.theme.larken,
                              //             fontWeight: FontWeight.w900,
                              //             color: R.palette.appPrimaryBlue,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //     TextSpan(
                              //       text: sl<QuoteDetailViewModel>()
                              //           .totalPrice
                              //           .toStringAsFixed(2),
                              //       style: TextStyle(
                              //         fontSize: 8.0.sp,
                              //         fontFamily: R.theme.larken,
                              //         fontWeight: FontWeight.w900,
                              //         color: R.palette.appPrimaryBlue,
                              //       ),
                              //     ),
                              //   ]),
                              // )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0.h,
                        ),
                        Container(
                          width: double.maxFinite,
                          decoration: R.theme.genericCardDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 27.h,
                                    ),
                                    SubHeading(
                                      order.name ?? '',
                                      fontSize: 6,
                                      fontWeight: FontWeight.w500,
                                      color: R.palette.darkBlack,
                                      fontFamily: R.theme.larkenDemoRegular,
                                    ),
                                    SizedBox(
                                      height: 27.h,
                                    ),
                                    if (order.coverGroups != null) ...[
                                      ListView.separated(
                                        itemBuilder: (context, index) {
                                          final element =
                                              order.coverGroups![index];
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SubHeading(
                                                element.name ?? '',
                                                fontSize: 4,
                                                fontWeight: FontWeight.w600,
                                                color: R.palette.darkBlack,
                                              ),
                                              SizedBox(
                                                height: 19.h,
                                              ),
                                              if (order.coverGroups![index]
                                                      .coverItems !=
                                                  null) ...[
                                                ListView.builder(
                                                  itemBuilder:
                                                      (context, nestedIndex) {
                                                    final nestedElement = order
                                                            .coverGroups![index]
                                                            .coverItems![
                                                        nestedIndex];
                                                    return PolicyDetailWidget(
                                                      text:
                                                          nestedElement.name ??
                                                              '',
                                                      subText:
                                                          "${nestedElement.amountCovered?.amount ?? ''} ${nestedElement.amountCovered?.currency ?? ''}",
                                                      fontSize: 4,
                                                      iconTextWidth: 5,
                                                      iconWidth: 6,
                                                    );
                                                  },
                                                  itemCount: order
                                                      .coverGroups![index]
                                                      .coverItems!
                                                      .length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                )
                                              ]
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SubHeading(
                                                AppLocalizations.of(context).txt_see_all,
                                                fontSize: 4,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w400,
                                                color: R.palette.appPrimaryBlue,
                                              ),
                                              SizedBox(
                                                height: 40.0.h,
                                              )
                                            ],
                                          );
                                        },
                                        itemCount: order.coverGroups!.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                      ),
                                    ],
                                    SizedBox(
                                      height: 13.0.h,
                                    ),
                                  ],
                                ),
                              ),
                              TicketView(
                                backgroundPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 0),
                                backgroundColor: R.palette.appWhiteColor,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 0),
                                drawArc: false,
                                triangleAxis: Axis.vertical,
                                contentBackgroundColor:
                                    R.palette.appBackgroundColor,
                                borderRadius: 7,
                                drawDivider: false,
                                trianglePos: .5,
                                corderRadius: 0,
                                dividerStrokeWidth: 9,
                                triangleSize: const Size(20, 10),
                                drawTriangle: false,
                                drawBorder: true,
                                drawShadow: false,
                                dividerColor: Colors.red,
                                child: Container(
                                  height: 49.h,
                                  width: double.maxFinite,
                                  color: R.palette.appBackgroundColor,
                                ),
                              ),
                              SizedBox(
                                height: 30.0.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 0.7.sw,
                                      child: SubHeading(
                                        AppLocalizations.of(context).txt_personal_and_trip_coverage_details,
                                        fontSize: 5,
                                        fontWeight: FontWeight.w600,
                                        color: R.palette.darkBlack,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0.h,
                                    ),
                                    if (coverDetailViewModel.dateOfBirth !=
                                        null) ...[
                                      PersonalTile(
                                        heading:
                                            AppLocalizations.of(context).name,
                                        value:
                                            '${basicInfoViewModel.firstName ?? ''} ${basicInfoViewModel.surname ?? ''} (${getAge(
                                          coverDetailViewModel.dateOfBirth ??
                                              '',
                                        )} yrs)',
                                        fontSize: 5,
                                      ),
                                    ],
                                    if (secondTravelerViewModel
                                            .firstNameController
                                            .text
                                            .isNotEmpty &&
                                        secondTravelerViewModel
                                            .lastNameController
                                            .text
                                            .isNotEmpty) ...[
                                      PersonalTile(
                                        heading:
                                            AppLocalizations.of(context).name,
                                        value:
                                            '${basicInfoViewModel.firstName ?? ''} ${basicInfoViewModel.surname ?? ''} (${getAge(bothCoverDetail.dateOfBirth ?? '')} yrs)',
                                        fontSize: 5,
                                      ),
                                      PersonalTile(
                                        heading: AppLocalizations.of(context).txt_2nd_traveller_name,
                                        value:
                                            '${secondTravelerViewModel.firstNameController.text} ${secondTravelerViewModel.lastNameController.text} (${getAge(secondTravelerViewModel.dateOfBirth ?? '')} yrs)',
                                        fontSize: 5,
                                      )
                                    ],
                                    if (familyAndGroupViewModel
                                        .attendee.isNotEmpty)
                                      ...familyAndGroupViewModel.attendee
                                          .map((e) => PersonalTile(
                                                heading:
                                                    "${e.index + 2} ${AppLocalizations.of(context).txt_traveller_name}",
                                                value:
                                                    '${e.firstName} ${e.lastName} (${CalendarUtils.getAge(e.dob)} yrs)',
                                                fontSize: 7,
                                              )),
                                    PersonalTile(
                                      heading:
                                          AppLocalizations.of(context).policy,
                                      value: getType(context),
                                      fontSize: 5,
                                    ),
                                    PersonalTile(
                                      heading:
                                          AppLocalizations.of(context).plan,
                                      value: order.name != null
                                          ? order.name!.contains(' ')
                                              ? order.name!.split(' ')[0]
                                              : ''
                                          : '',
                                      fontSize: 5,
                                    ),
                                    PersonalTile(
                                      heading: AppLocalizations.of(context).destination,
                                      value: coverQuoteViewModel
                                          .selectedCountry.name,
                                      fontSize: 5,
                                    ),
                                    PersonalTile(
                                      heading: AppLocalizations.of(context).policy_start_date,
                                      value: DateFormat(R.stringRes.localeHelper
                                              .pickerDateFormatDMY)
                                          .format(startEndViewModel.startDate!),
                                      fontSize: 5,
                                    ),
                                    PersonalTile(
                                      heading: AppLocalizations.of(context).policy_end_date,
                                      value: DateFormat(R.stringRes.localeHelper
                                              .pickerDateFormatDMY)
                                          .format(startEndViewModel.endDate!),
                                      fontSize: 5,
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        policyRow(R.assets.graphics.mailImage.path,
                            AppLocalizations.of(context).we_will_email_you_your,
                            imageSize: 8, fontSize: 4),
                        SizedBox(
                          height: 32.h,
                        ),
                        policyRow(
                          R.assets.graphics.pathIconForward.path,
                          imageSize: 8,
                          fontSize: 4,
                          AppLocalizations.of(context).your_price_includes_the_HK,
                        ),
                        SizedBox(
                          height: 31.h,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: R.theme.genericTextStyle,
                            children: <TextSpan>[
                              TextSpan(
                                  text: AppLocalizations.of(context).txt_the,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: R.theme.interRegular,
                                      fontSize: 4.sp,
                                      color: R.palette.textFieldHintGreyColor)),
                              TextSpan(
                                  text: ' ${AppLocalizations.of(context).policy_wording.toLowerCase()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 4.sp,
                                      fontFamily: R.theme.interRegular,
                                      color: R.palette.appPrimaryBlue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                              TextSpan(
                                text: ' ${AppLocalizations.of(context).txt_is_available_for_you_to} ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 4.sp,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.textFieldHintGreyColor),
                              ),
                              TextSpan(
                                  text: AppLocalizations.of(context).txt_read_here,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 4.sp,
                                      fontFamily: R.theme.interRegular,
                                      color: R.palette.appPrimaryBlue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                              TextSpan(
                                text: '. ${AppLocalizations.of(context).txt_if_you_want_to_learn} ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 4.sp,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.textFieldHintGreyColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 44.h,
                        ),
                        GenericButton(
                          onPressed: () {
                            sl<Navigation>().pushWithArgs(
                              context,
                              Routes.detailsPolicyConfirmRoute,
                              args: order.orderId,
                            );
                          },
                          text:
                              '${AppLocalizations.of(context).txt_purchase_cover_for} ${sl<QuoteDetailViewModel>().currency ?? ''} ${sl<QuoteDetailViewModel>().totalPrice.toStringAsFixed(0)}',
                          fontSize: 5,
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        SizedBox(
                          width: 0.7.sw,
                          child: SubHeading(
                            R.stringRes.policyDetailScreen.clickHere.hardcoded,
                            fontSize: 5,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            color: R.palette.dullBlack,
                          ),
                        ),
                        SizedBox(
                          height: 47.h,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getType(BuildContext context) {
    if (coverQuoteViewModel.timeframeSelected ==
        AvailableCoversTimeFrame.none) {
      return '';
    }
    return coverQuoteViewModel.timeframeSelected ==
            AvailableCoversTimeFrame.single
        ? AppLocalizations.of(context).single_trip_cover
        : AppLocalizations.of(context).annual_trip_cover;
  }

  Widget policyRow(String imageUrl, String text,
      {double imageSize = 18, double fontSize = 14}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: imageSize.w,
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: SubHeading(
            text,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: R.palette.textFieldHintGreyColor,
          ),
        )
      ],
    );
  }
}

//get the age in years from the date of birth
int getAge(String dateOfBirth, {String? format}) {
  if (dateOfBirth.isEmpty) {
    return 0;
  }
  final DateTime today = DateTime.now();
  final date = DateFormat(format ?? "yyyy/MM/dd").parse(dateOfBirth);
  int age = today.year - date.year;
  final int month1 = today.month;
  final int month2 = date.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    final int day1 = today.day;
    final int day2 = date.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}
