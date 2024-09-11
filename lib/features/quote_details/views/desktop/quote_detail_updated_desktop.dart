import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/language_dialog.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/viewmodel/common_quote_viewmodel.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/viewmodel/cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/family_group_cover_details/viewmodel/family_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/second_traveler_detail/viewmodel/second_travel_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/titile_widget_builder.dart';
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart';
import 'package:travelbox/features/quote_details/widgets/filter_dialog.dart';
import 'package:travelbox/features/quote_details/widgets/optional_extras_dialog.dart';
import 'package:travelbox/features/quote_details/widgets/quote_list_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/calendar_utils.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';
import 'package:travelbox/utils/widgets/drop_down/app_dropdown.dart';

class QuoteDetailsUpdatedDesktop extends StatefulWidget {
  const QuoteDetailsUpdatedDesktop({Key? key}) : super(key: key);

  @override
  State<QuoteDetailsUpdatedDesktop> createState() =>
      _QuoteDetailsUpdatedDesktopState();
}

class _QuoteDetailsUpdatedDesktopState
    extends State<QuoteDetailsUpdatedDesktop> {
  List<Map<String, String>> traveler = [];
  final startEndViewModel = sl<StartEndPickerViewModel>();
  final coverQuoteViewModel = sl<CoverQuoteViewModel>();
  final attendedCutomerViewModel = sl<AttendingCustomerViewModel>();
  final familyGroupViewModel = sl<FamilyGroupCoverDetailViewModel>();
  final basicViewModel = sl<BasicInfoViewModel>();
  final coverDetailViewModel = sl<CoverDetailViewModel>();
  final secondTravelCoverDetailsViewModel =
      sl<SecondTravelCoverDetailsViewModel>();

  final LayerLink layerLink = LayerLink();
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    getCustomerCount(
        attendedCutomerViewModel,
        familyGroupViewModel,
        basicViewModel,
        coverDetailViewModel,
        secondTravelCoverDetailsViewModel);
    super.initState();
  }

  @override
  void dispose() {
    overlayEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuoteDetailViewModel>.value(
      value: sl<QuoteDetailViewModel>(),
      builder: (context, child) {
        final quotes = sl<QuoteData>().quotes;
        return Container(
          color: R.palette.appBackgroundColor,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenericAppBarDesktop(
                            onTrailingPressed: () {
                              _showMyDialog(context);
                            },
                            leading: Icon(
                              Icons.arrow_back_ios,
                              color: R.palette.mediumBlack,
                            ),
                            onLeadingPressed: () {
                              sl<Navigation>().goBack(context);
                            },
                            isClickable: false,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 72.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Heading(
                                  AppLocalizations.of(context).here_your_quote,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: R.theme.larkenLightFontFamily,
                                  color: R.palette.appHeadingTextBlackColor,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TitleWidgetBuilder(
                                  timeFrame: sl<CoverQuoteViewModel>()
                                      .timeframeSelected,
                                  fontSize: 26,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  width: double.maxFinite,
                                  decoration: R.theme.genericCardDecoration,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 29.w, vertical: 22.7.h),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                R.assets.graphics.sort.path,
                                                height: 23.w,
                                                width: 21.h,
                                              ),
                                              SizedBox(
                                                // height: 50,
                                                width: 150.w,
                                                child: GenericDropDown(
                                                  fillColor: Colors.white,
                                                  items: [
                                                    AppLocalizations.of(context)
                                                        .highest_price,
                                                    AppLocalizations.of(context)
                                                        .lowest_price,
                                                    AppLocalizations.of(context)
                                                        .most_discounted,
                                                    AppLocalizations.of(context)
                                                        .selected,
                                                  ],
                                                  textStyle: TextStyle(
                                                    fontFamily:
                                                        R.theme.interRegular,
                                                    color:
                                                        R.palette.mediumBlack,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  hintTextStyle: TextStyle(
                                                    fontFamily:
                                                        R.theme.interRegular,
                                                    fontSize: 18.sp,
                                                    color:
                                                        R.palette.mediumBlack,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  hintText: AppLocalizations.of(
                                                          context)
                                                      .sort,
                                                  filled: false,
                                                  mapDropDownText: (value) {
                                                    return Text(
                                                      value,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: R.palette
                                                            .mediumBlack,
                                                        fontFamily: R
                                                            .theme.interRegular,
                                                        fontSize: 16.sp,
                                                      ),
                                                    );
                                                  },
                                                  onDropDownItemChanged:
                                                      (value) {},
                                                  dropDownColor:
                                                      R.palette.white,
                                                  icon: const SizedBox(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              _showFilterDialog();
                                            },
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  R.assets.graphics.filter.path,
                                                  height: 25.w,
                                                  width: 25.h,
                                                ),
                                                SizedBox(
                                                  width: 12.w,
                                                ),
                                                SubHeading(
                                                  AppLocalizations.of(context)
                                                      .filter,
                                                  fontWeight: FontWeight.w600,
                                                  color: R.palette.mediumBlack,
                                                  fontSize: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Column(
                                    children: quotes.map((item) {
                                  return QuoteCard(
                                      quote: item,
                                      onPressMoreDetail: () {
                                        sl<Navigation>().pushWithArgs(
                                          context,
                                          Routes.quoteMoreDetailRoute,
                                          args: item,
                                        );
                                      },
                                      onPressOptionalExtras:
                                          _showOptionalExtrasDialog);
                                }).toList()),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const LanguageDialog();
      },
    );
  }

  Future<void> _showFilterDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const FilterDialog();
      },
    );
  }

  Future<void> _showOptionalExtrasDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const OptionalExtrasDialog();
      },
    );
  }

  int getCustomerCount(
    AttendingCustomerViewModel viewModel,
    FamilyGroupCoverDetailViewModel familyGroupCoverDetailViewModel,
    BasicInfoViewModel basicInfoViewModel,
    CoverDetailViewModel coverDetailViewModel,
    SecondTravelCoverDetailsViewModel secondTravelCoverDetailsViewModel,
  ) {
    traveler.clear();
    switch (viewModel.travelingPartner) {
      case TravelingPartner.one:
        traveler.add({
          'name':
              '${basicInfoViewModel.firstName ?? ''} ${basicInfoViewModel.surname ?? ''}',
          'age': '${getAge(coverDetailViewModel.dateOfBirth ?? '')} yrs'
        });
        return 1;
      case TravelingPartner.two:
        traveler.addAll([
          {
            'name':
                '${basicInfoViewModel.firstName ?? ''} ${basicInfoViewModel.surname ?? ''}',
            'age': '${getAge(coverDetailViewModel.dateOfBirth ?? '')} yrs'
          },
          {
            'name':
                '${secondTravelCoverDetailsViewModel.firstNameController.text} ${secondTravelCoverDetailsViewModel.lastNameController.text}',
            'age':
                '${getAge(secondTravelCoverDetailsViewModel.dateOfBirth ?? '')} yrs'
          }
        ]);
        return 2;
      case TravelingPartner.family:
      case TravelingPartner.group:
        traveler.add(
          {
            'name':
                '${basicInfoViewModel.firstName ?? ''} ${basicInfoViewModel.surname ?? ''}',
            'age': '${getAge(coverDetailViewModel.dateOfBirth ?? '')} yrs'
          },
        );
        familyGroupCoverDetailViewModel.attendee.map((e) {
          traveler.add(
            {
              'name': '${e.firstName} ${e.lastName}',
              'age': '${CalendarUtils.getAge(e.dob)} yrs'
            },
          );
        });
        return familyGroupCoverDetailViewModel.attendee.length + 1;
      case TravelingPartner.none:
        return 0;
    }
  }

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

  final TextStyle defaultStyle = TextStyle(
    color: R.palette.appHeadingTextBlackColor,
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    fontFamily: R.theme.larkenDemoRegular,
  );

  final TextStyle linkStyle = TextStyle(
    color: R.palette.appPrimaryBlue,
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    fontFamily: R.theme.larkenDemoRegular,
  );
}
