import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
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
import 'package:travelbox/features/quote_details/widgets/quote_expansion_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/calendar_utils.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/number_utils.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class QuoteDetailsDesktop extends StatefulWidget {
  const QuoteDetailsDesktop({Key? key}) : super(key: key);

  @override
  State<QuoteDetailsDesktop> createState() => _QuoteDetailsDesktopState();
}

class _QuoteDetailsDesktopState extends State<QuoteDetailsDesktop> {
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
  final double _itemHeight = 50.0;

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

  void _showOverlay(BuildContext context, Offset tapPosition) {
    overlayEntry?.remove();

    double overlayHeight = _itemHeight * traveler.length;
    double maxHeight = MediaQuery.of(context).size.height * 0.5;
    overlayHeight = overlayHeight > maxHeight ? maxHeight : overlayHeight;

    Offset adjustedPosition = Offset(tapPosition.dx, tapPosition.dy + 10);

    overlayEntry =
        _createOverlayEntry(context, adjustedPosition, overlayHeight);
    if (overlayEntry == null) return;

    Overlay.of(context).insert(overlayEntry!);
  }

  OverlayEntry _createOverlayEntry(
      BuildContext context, Offset position, double height) {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy,
        width: 200,
        height: height,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 20),
          child: Material(
            elevation: 4.0,
            child: Stack(
              children: [
                // Your ListView
                ListView.builder(
                  itemCount: traveler.length,
                  itemBuilder: (context, index) {
                    final data = traveler[index];
                    return ListTile(
                      title: Text(
                        '${data['name']} (${data['age']})',
                        style: TextStyle(
                          fontSize: 4.sp,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 4.w,
                    ),
                    onPressed: () {
                      overlayEntry?.remove();
                      overlayEntry = null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
        final viewModel = context.watch<QuoteDetailViewModel>();
        return Container(
          color: R.palette.appBackgroundColor,
          child: SafeArea(
            bottom: false,
            child: Scaffold(
              backgroundColor: R.palette.appBackgroundColor,
              appBar: GenericAppBarDesktop(
                trailing: const SizedBox(),
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Heading(
                          AppLocalizations.of(context).here_your_quote,
                          fontSize: 8,
                          fontWeight: FontWeight.normal,
                          fontFamily: R.theme.larkenLightFontFamily,
                          color: R.palette.appHeadingTextBlackColor,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          decoration: R.theme.genericCardDecoration,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 30.h),
                          child: Column(
                            children: [
                              TitleWidgetBuilder(
                                timeFrame:
                                    sl<CoverQuoteViewModel>().timeframeSelected,
                                imageSize: 70,
                                fontSize: 6,
                              ),
                              SizedBox(
                                height: 38.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SubHeading(
                                        AppLocalizations.of(context)
                                            .your_trip_detail,
                                        fontWeight: FontWeight.w700,
                                        color: R.palette.mediumBlack,
                                        fontSize: 4,
                                      ),
                                      SizedBox(
                                        height: 10.0.h,
                                      ),
                                      SubHeading(
                                        coverQuoteViewModel
                                            .selectedCountry.name,
                                        fontWeight: FontWeight.w600,
                                        color: R.palette.appPrimaryBlue,
                                        fontSize: 6,
                                      ),
                                      SizedBox(
                                        height: 10.0.h,
                                      ),
                                      Row(
                                        children: [
                                          SubHeading(
                                            "${DateFormat(R.stringRes.localeHelper.dateMonthFormatter).format(startEndViewModel.startDate!)} - ${DateFormat(R.stringRes.localeHelper.dateMonthYearFormatter).format(startEndViewModel.endDate!)}",
                                            fontWeight: FontWeight.w500,
                                            color: R.palette.mediumBlack,
                                            fontSize: 4,
                                          ),
                                          SizedBox(
                                            width: 10.0.w,
                                          ),
                                          Row(
                                            children: [
                                              SubHeading(
                                                "${traveler.length} ${AppLocalizations.of(context).txt_traveler}",
                                                fontWeight: FontWeight.w500,
                                                color: R.palette.appPrimaryBlue,
                                                fontSize: 5,
                                              ),
                                              SizedBox(
                                                width: 3.0.w,
                                              ),
                                              CompositedTransformTarget(
                                                link: layerLink,
                                                child: InkWell(
                                                  onTapUp: (details) {
                                                    _showOverlay(context,
                                                        details.globalPosition);
                                                  },
                                                  child: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: R
                                                        .palette.appPrimaryBlue,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.0.h,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SubHeading(
                                        AppLocalizations.of(context)
                                            .protect_your_trip,
                                        fontWeight: FontWeight.w700,
                                        color: R.palette.mediumBlack,
                                        fontSize: 5,
                                      ),
                                      SizedBox(
                                        height: 10.0.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Baseline(
                                            baseline: 50.0,
                                            baselineType:
                                                TextBaseline.alphabetic,
                                            child: SubHeading(
                                              viewModel.selectedQuote
                                                      ?.quotePrice?.currency ??
                                                  '',
                                              fontWeight: FontWeight.w600,
                                              color: R.palette.appPrimaryBlue,
                                              fontSize: 4,
                                            ),
                                          ),
                                          Baseline(
                                            baseline: 50.0,
                                            baselineType:
                                                TextBaseline.alphabetic,
                                            child: SubHeading(
                                              "${viewModel.totalPrice.toInt()}",
                                              fontWeight: FontWeight.w600,
                                              color: R.palette.appPrimaryBlue,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0.h,
                              ),
                              ListView.separated(
                                itemBuilder: (context, index) {
                                  final quote = quotes[index];
                                  return QuoteExpansionCard(
                                    heading: quote.name,
                                    subHeading: AppLocalizations.of(context)
                                        .txt_hong_kong_money(
                                            NumberUtils.formatPriceNumber(200)),
                                    destinationHeading: AppLocalizations.of(
                                            context)
                                        .txt_hong_kong_money(
                                            NumberUtils.formatPriceNumber(200)),
                                    isRecommended: quote.name != null
                                        ? quote.name!
                                            .toLowerCase()
                                            .contains('comprehensive')
                                        : false,
                                    quote: quote,
                                  );
                                },
                                separatorBuilder: (context, _) {
                                  return SizedBox(
                                    height: 30.h,
                                  );
                                },
                                itemCount: quotes.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                              SizedBox(
                                height: 35.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 55.h,
                        ),
                        GenericButton(
                          width: 0.2.sw,
                          onPressed: () async {
                            EasyLoading.show();
                            final result = await viewModel.getOrder();
                            EasyLoading.dismiss();
                            if (result == null) return;

                            Future.delayed(const Duration(seconds: 0), () {
                              sl<Navigation>().pushWithArgs(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  Routes.detailsPolicyRoute,
                                  args: result);
                            });
                          },
                          text: AppLocalizations.of(context).txt_get_covered_for(
                              '${viewModel.selectedQuote?.quotePrice?.currency ?? ''}${viewModel.totalPrice.toInt()}'),
                          isEnable: viewModel.selectedQuote != null,
                          fontSize: 5,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: defaultStyle,
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      '${AppLocalizations.of(context).txt_the} ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: R.theme.interRegular,
                                      fontSize: 4.sp,
                                      color: R.palette.textFieldHintGreyColor)),
                              TextSpan(
                                  text: AppLocalizations.of(context)
                                      .policy_wording
                                      .toLowerCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    fontSize: 4.sp,
                                    decoration: TextDecoration.underline,
                                    color: R.palette.appPrimaryBlue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                              TextSpan(
                                text:
                                    ' ${AppLocalizations.of(context).txt_quote_detail_policy}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: R.theme.interRegular,
                                  fontSize: 4.sp,
                                  color: R.palette.textFieldHintGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
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
