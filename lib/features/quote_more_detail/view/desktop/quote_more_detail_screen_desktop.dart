import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/viewmodel/cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/family_group_cover_details/viewmodel/family_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/second_traveler_detail/viewmodel/second_travel_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/titile_widget_builder.dart';
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/add_on_item_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/terms_and_policy_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/adventure_extreme_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/cancel_reason_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/car_hire_excess_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/cruise_cover_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/gadget_cover_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/golf_cover_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/personal_liability_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/pet_care_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/rental_car_care.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/vacation_rental_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/winter_sport_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/what_cover_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/your_health_popup.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/calendar_utils.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/date_time_ext.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/number_utils.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class QuoteMoreDetailScreenDesktop extends StatefulWidget {
  final Quote? quote;

  const QuoteMoreDetailScreenDesktop({
    super.key,
    this.quote,
  });

  @override
  State<QuoteMoreDetailScreenDesktop> createState() =>
      _QuoteMoreDetailScreenDesktopState();
}

class _QuoteMoreDetailScreenDesktopState
    extends State<QuoteMoreDetailScreenDesktop> {
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
  final ScrollController _scrollController = ScrollController();

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
        final viewModel = context.watch<QuoteDetailViewModel>();
        return Container(
          color: R.palette.appBackgroundColor,
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GenericAppBarDesktop(
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Heading(
                            AppLocalizations.of(context).here_your_quote,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            fontFamily: R.theme.larkenLightFontFamily,
                            color: R.palette.appHeadingTextBlackColor,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          TitleWidgetBuilder(
                            timeFrame:
                                sl<CoverQuoteViewModel>().timeframeSelected,
                            fontSize: 6,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            decoration: R.theme.genericCardDecoration,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 15.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SubHeading(
                                          AppLocalizations.of(context).your_trip_detail,
                                          fontWeight: FontWeight.w800,
                                          color: R.palette.mediumBlack,
                                          fontSize: 7,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        SubHeading(
                                          coverQuoteViewModel
                                              .selectedCountry.name,
                                          fontWeight: FontWeight.w600,
                                          color: R.palette.appPrimaryBlue,
                                          fontSize: 8,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            // SubHeading(
                                            //   "${DateFormat(R.stringRes.localeHelper.dateMonthFormatter).format(startEndViewModel.startDate!)} - ${DateFormat(R.stringRes.localeHelper.dateMonthYearFormatter).format(startEndViewModel.endDate!)}",
                                            //   fontWeight: FontWeight.w600,
                                            //   color: R.palette.mediumBlack,
                                            //   fontSize: 4,
                                            // ),
                                            SubHeading(
                                              "Oct 10 - Oct 17, 2023".hardcoded,
                                              fontWeight: FontWeight.w600,
                                              color: R.palette.mediumBlack,
                                              fontSize: 5,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            SubHeading(
                                              "   |   ",
                                              fontWeight: FontWeight.w600,
                                              color: R.palette.mediumBlack,
                                              fontSize: 5,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Row(
                                              children: [
                                                SubHeading(
                                                  '${traveler.length} ${AppLocalizations.of(context).txt_traveler}',
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      R.palette.appPrimaryBlue,
                                                  fontSize: 5,
                                                ),
                                                // SubHeading(
                                                //   "Traveler",
                                                //   fontWeight: FontWeight.w600,
                                                //   color:
                                                //       R.palette.appPrimaryBlue,
                                                //   fontSize: 5,
                                                // ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SubHeading(
                                          AppLocalizations.of(context)
                                              .protect_your_trip,
                                          fontWeight: FontWeight.w800,
                                          color: R.palette.mediumBlack,
                                          fontSize: 6,
                                        ),
                                        SizedBox(
                                          height: 13.h,
                                        ),
                                        Visibility(
                                          visible: viewModel.totalPrice > 0,
                                          child: SubHeading(
                                            "HK\$${NumberUtils.formatPriceNumber(viewModel.totalPrice + 80)}",
                                            fontWeight: FontWeight.w700,
                                            color: R.palette.mediumBlack,
                                            fontSize: 5,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        SubHeading(
                                          "HK\$${NumberUtils.formatPriceNumber(viewModel.totalPrice)}",
                                          fontWeight: FontWeight.w700,
                                          color: R.palette.appPrimaryBlue,
                                          fontSize: 6,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            decoration: R.theme.genericCardDecoration,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  R.assets.graphics.coverImage.path,
                                  width: 176,
                                  height: 41,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SubHeading(
                                  AppLocalizations.of(context).asia_superior_travel_insurance,
                                  fontSize: 7,
                                  fontWeight: FontWeight.w900,
                                  color: R.palette.appHeadingTextBlackColor,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      SubHeading(
                                        AppLocalizations.of(context).txt_plan_b,
                                        fontSize: 6,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            R.palette.appHeadingTextBlackColor,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SubHeading(
                                        "HK\$280.00".hardcoded,
                                        fontWeight: FontWeight.w500,
                                        color: R.palette.mediumBlack,
                                        fontSize: 6,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      SubHeading(
                                        "HK\$200.00".hardcoded,
                                        fontWeight: FontWeight.w800,
                                        color: R.palette.appPrimaryBlue,
                                        fontSize: 6,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          viewModel.setSelectedPlan(
                                              AppLocalizations.of(context)
                                                  .txt_plan_b,
                                              200);
                                        },
                                        child: Container(
                                          width: 42.w,
                                          height: 36.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: viewModel.selectedPlan ==
                                                    AppLocalizations.of(context)
                                                        .txt_plan_b
                                                ? R.palette.appPrimaryBlue
                                                : R.palette.disableButtonColor,
                                          ),
                                          child: Center(
                                            child: SubHeading(
                                              AppLocalizations.of(context)
                                                  .select,
                                              color: viewModel.selectedPlan ==
                                                      AppLocalizations.of(
                                                              context)
                                                          .txt_plan_b
                                                  ? R.palette.white
                                                  : R.palette.mediumBlack,
                                              fontFamily: R.theme.interRegular,
                                              fontSize: 5,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 50,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.h,
                                                bottom: 10.h,
                                                left: 20.w),
                                            child: SubHeading(
                                              AppLocalizations.of(context)
                                                  .whats_covered,
                                              fontSize: 7,
                                              fontWeight: FontWeight.w400,
                                              color: R.palette
                                                  .appHeadingTextBlackColor,
                                              fontFamily:
                                                  R.theme.larkenLightFontFamily,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                    color: R.palette
                                                        .textFieldHintGreyColor,
                                                    width: 0.5),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.w,
                                                      top: 5.h,
                                                      bottom: 5.h),
                                                  child: Column(
                                                    children: [
                                                      WhatCoverItem(
                                                        headTitle:
                                                            AppLocalizations.of(
                                                                    context)
                                                                .txt_your_health,
                                                        subTitle: AppLocalizations
                                                                .of(context)
                                                            .txt_see_all_health_coverage,
                                                        contents: const [
                                                          {
                                                            "name":
                                                                "Emergency accident",
                                                            "price": "1,500,000"
                                                          },
                                                          {
                                                            "name":
                                                                "Emergency medical expenses",
                                                            "price": "500,000"
                                                          },
                                                          {
                                                            "name":
                                                                "Follow-up medical expenses",
                                                            "price": "30,00,000"
                                                          },
                                                        ],
                                                        onClickSubTitle: () =>
                                                            _showDialog(
                                                          context,
                                                          YourHealthPopup(
                                                            heading: AppLocalizations
                                                                    .of(context)
                                                                .txt_your_health,
                                                            widgets: healthItems,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 25.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.w,
                                                      top: 5.h,
                                                      bottom: 5.h),
                                                  child: Column(
                                                    children: [
                                                      WhatCoverItem(
                                                        headTitle:
                                                            AppLocalizations.of(
                                                                    context)
                                                                .txt_your_trip,
                                                        subTitle: AppLocalizations
                                                                .of(context)
                                                            .txt_see_all_trip_coverage,
                                                        contents: const [
                                                          {
                                                            "name":
                                                                "Trip Cancellation",
                                                            "price": "1,500,000"
                                                          },
                                                          {
                                                            "name":
                                                                "Trip Delay",
                                                            "price": "500,000"
                                                          },
                                                          {
                                                            "name":
                                                                "Trip interruption",
                                                            "price": "30,00,000"
                                                          },
                                                        ],
                                                        onClickSubTitle: () =>
                                                            _showDialog(
                                                          context,
                                                          YourHealthPopup(
                                                            heading: AppLocalizations
                                                                    .of(context)
                                                                .txt_your_trip,
                                                            widgets: tripItems,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 25.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.w,
                                                      top: 5.h,
                                                      bottom: 5.h),
                                                  child: Column(
                                                    children: [
                                                      WhatCoverItem(
                                                        headTitle:
                                                            AppLocalizations.of(
                                                                    context)
                                                                .txt_your_stuff,
                                                        subTitle: AppLocalizations
                                                                .of(context)
                                                            .txt_see_all_personal_belongings_coverage,
                                                        contents: const [
                                                          {
                                                            "name":
                                                                "Loss or damage to personal property",
                                                            "price": "1,500,000"
                                                          },
                                                          {
                                                            "name":
                                                                "Loss of money",
                                                            "price": "500,000"
                                                          },
                                                          {
                                                            "name":
                                                                "Home contents",
                                                            "price": "30,00,000"
                                                          },
                                                        ],
                                                        onClickSubTitle: () =>
                                                            _showDialog(
                                                          context,
                                                          YourHealthPopup(
                                                            heading: AppLocalizations
                                                                    .of(context)
                                                                .txt_your_stuff,
                                                            widgets: stuffItems,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 25.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5.w,
                                                      top: 5.h,
                                                      bottom: 5.h),
                                                  child: Column(
                                                    children: [
                                                      WhatCoverItem(
                                                        headTitle: AppLocalizations
                                                                .of(context)
                                                            .txt_included_extras,
                                                        subTitle: AppLocalizations
                                                                .of(context)
                                                            .txt_see_all_included_extras,
                                                        contents: const [
                                                          {
                                                            "name":
                                                                "Personal liability",
                                                            "price": "1,500,000"
                                                          },
                                                          {
                                                            "name":
                                                                "Rental vehicle excess",
                                                            "price": "500,000"
                                                          },
                                                        ],
                                                        onClickSubTitle: () =>
                                                            _showDialog(
                                                          context,
                                                          YourHealthPopup(
                                                            heading: AppLocalizations
                                                                    .of(context)
                                                                .txt_included_extras,
                                                            widgets: const [
                                                              WhatCoverItem(
                                                                isPopup: true,
                                                                headTitle:
                                                                    "Extras",
                                                                contents: [
                                                                  {
                                                                    "name":
                                                                        "Rental vehicle excess",
                                                                    "price":
                                                                        "1,500,000"
                                                                  },
                                                                  {
                                                                    "name":
                                                                        "Personal liability",
                                                                    "price":
                                                                        "1,000"
                                                                  },
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 25.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 50,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 5.h, bottom: 10.h, left: 5.w),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 0.9.sh,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 15.w),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: SubHeading(
                                                    AppLocalizations.of(context)
                                                        .txt_what_can_you_add_on,
                                                    fontSize: 7,
                                                    fontWeight: FontWeight.w400,
                                                    color: R.palette
                                                        .appHeadingTextBlackColor,
                                                    fontFamily: R.theme
                                                        .larkenLightFontFamily,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              Expanded(
                                                child: RawScrollbar(
                                                  mainAxisMargin: 5,
                                                  trackVisibility: false,
                                                  thickness: 0.5,
                                                  thumbVisibility: true,
                                                  interactive: false,
                                                  child: ListView.builder(
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    controller:
                                                        _scrollController,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        quoteDetailAddOnsWeb
                                                            .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final item =
                                                          quoteDetailAddOnsWeb[
                                                              index];
                                                      return AddOnItemWidget(
                                                        headTitle: item["name"]
                                                            .toString(),
                                                        contents:
                                                            item["description"]
                                                                .toString(),
                                                        price: item["price"]
                                                            .toString(),
                                                        subTitle:
                                                            item["subTitle"]
                                                                .toString(),
                                                        onPressed: () =>
                                                            getDetailItemById(
                                                                item["id"]
                                                                    .toString()),
                                                        isAdded: viewModel
                                                            .isAddOnSelected(
                                                                item["id"]
                                                                    .toString()),
                                                        onSelectAdd: () => {
                                                          onAddOnSelected(
                                                              item["id"]
                                                                  .toString(),
                                                              double.parse(item[
                                                                      "price"]
                                                                  .toString())),
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      SubHeading(
                                        AppLocalizations.of(context).downloads,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            R.palette.appHeadingTextBlackColor,
                                        fontFamily:
                                            R.theme.larkenLightFontFamily,
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      SubHeading(
                                        AppLocalizations.of(context)
                                            .benefits_schedule,
                                        fontWeight: FontWeight.w500,
                                        color: R.palette.appPrimaryBlue,
                                        fontSize: 5,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            R.palette.appPrimaryBlue,
                                        decorationThickness: 2,
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      SubHeading(
                                        AppLocalizations.of(context)
                                            .policy_wording,
                                        fontWeight: FontWeight.w500,
                                        color: R.palette.appPrimaryBlue,
                                        fontSize: 5,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            R.palette.appPrimaryBlue,
                                        decorationThickness: 2,
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      SubHeading(
                                        AppLocalizations.of(context)
                                            .covid_19_extension,
                                        fontWeight: FontWeight.w500,
                                        color: R.palette.appPrimaryBlue,
                                        fontSize: 5,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            R.palette.appPrimaryBlue,
                                        decorationThickness: 2,
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
                            height: 65.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: GenericButton(
                              width: 130,
                              onPressed: () async {
                                // EasyLoading.show();
                                // final result = await viewModel.getOrder();
                                // EasyLoading.dismiss();
                                // if (result == null) return;

                                Future.delayed(const Duration(seconds: 0), () {
                                  sl<Navigation>().push(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      Routes.quotePurchaseDetailRoute);
                                });
                              },
                              text: AppLocalizations.of(context)
                                  .txt_get_covered_for(
                                      '${viewModel.selectedQuote?.quotePrice?.currency ?? 'HK\$'}${NumberUtils.formatPriceNumber(viewModel.totalPrice)}'),
                              isEnable: viewModel.selectedPlan != null,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text:
                                        '${AppLocalizations.of(context).our} ',
                                    style: TextStyle(
                                      color: R.palette.textFieldHintGreyColor,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: R.theme.interRegular,
                                      fontSize: 4.sp,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: AppLocalizations.of(context)
                                            .privacy_policy,
                                        style: TextStyle(
                                          color: R.palette.appPrimaryBlue,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: R.theme.interRegular,
                                          fontSize: 4.sp,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            _showDialog(
                                              context,
                                              TermsAndPolicyPopup(
                                                title:
                                                    AppLocalizations.of(context)
                                                        .txt_privacy_policy,
                                                subtitle: AppLocalizations.of(
                                                        context)
                                                    .txt_effective_date(
                                                        DateTime(2024, 1, 1)
                                                            .formatToDoPattern),
                                                content: termsData,
                                              ),
                                            );
                                          },
                                      ),
                                      TextSpan(
                                          text:
                                              AppLocalizations.of(context).and,
                                          style: TextStyle(
                                            color: R
                                                .palette.textFieldHintGreyColor,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: R.theme.interRegular,
                                            fontSize: 4.sp,
                                          )),
                                      TextSpan(
                                        text:
                                            '${AppLocalizations.of(context).terms_of_business} ',
                                        style: TextStyle(
                                          color: R.palette.appPrimaryBlue,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: R.theme.interRegular,
                                          fontSize: 4.sp,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            _showDialog(
                                              context,
                                              TermsAndPolicyPopup(
                                                title: AppLocalizations.of(context).txt_terms_of_business,
                                                subtitle:
                                                AppLocalizations.of(
                                                    context)
                                                    .txt_effective_date(
                                                    DateTime(2024, 1, 1)
                                                        .formatToDoPattern),
                                                content: termsData,
                                              ),
                                            );
                                          },
                                      ),
                                      TextSpan(
                                          text:
                                              AppLocalizations.of(context).are,
                                          style: TextStyle(
                                            color: R
                                                .palette.textFieldHintGreyColor,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: R.theme.interRegular,
                                            fontSize: 4.sp,
                                          ),),
                                    ],
                                  ),
                                ),
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .available_for_you_to_read_here,
                                  color: R.palette.textFieldHintGreyColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 6,
                                  textStyle: TextStyle(
                                    color: R.palette.textFieldHintGreyColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    fontSize: 5.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void onAddOnSelected(String id, double price) {
    var viewmodel = sl<QuoteDetailViewModel>();
    viewmodel.updateAddOn(id, price);
  }

  void getDetailItemById(String id) {
    switch (id) {
      case "1":
        _showDialog(context, const CruiseCoverPopup());
        break;
      case "2":
        _showDialog(context, const VacationRentalPopup());
        break;
      case "3":
        _showDialog(context, const PersonalLiabilityPopup());
        break;
      case "4":
        _showDialog(context, const AdventureExtremePopup());
        break;
      case "5":
        _showDialog(context, const WinterSportPopup());
        break;
      case "6":
        _showDialog(context, const GadgetCoverPopup());
        break;
      case "7":
        _showDialog(context, const GolfCoverPopup());
        break;
      case "8":
        _showDialog(context, const CarHireExcessPopup());
        break;
      case "9":
        _showDialog(context, const CancelReasonPopup());
        break;
      case "10":
        _showDialog(context, const RentalCarCare());
        break;
      case "11":
        _showDialog(context, const PetCarePopup());
        break;
      default:
        break;
    }
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

  Future<void> _showDialog(BuildContext context, Widget dialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  List<WhatCoverItem> get healthItems => const [
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Personal accident",
      contents: [
        {
          "name":
          "Accident on public transport",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Other type of accident",
          "price":
          "1,000,000"
        },
      ],
    ),
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Medical expenses",
      contents: [
        {
          "name":
          "Medical expenses",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Follow up medical expe0nses",
          "price":
          "1,000,000"
        },
        {
          "name":
          "Major burns",
          "price":
          "1,000,000"
        },
      ],
    ),
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Chinese medicine ",
      contents: [
        {
          "name":
          "Chinese medicine practitioner",
          "price":
          "3,000"
        },
        {
          "name":
          "Chinese medicine practitioner (daily limit)",
          "price":
          "1,000,000/day"
        },
      ],
    ),
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Trauma counselling ",
      contents: [
        {
          "name":
          "Trauma counselling",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Trauma counselling (daily limit)",
          "price":
          "1,000,000/day"
        },
      ],
    ),
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Worldwide emergency assistance",
      contents: [
        {
          "name":
          "Medical evacuation",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Repatriation after local treatment",
          "price":
          "1,000,000/day"
        },
        {
          "name":
          "Hospital deposit",
          "price":
          "1,000,000"
        },
        {
          "name":
          "Repatriation of unattended children",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Compassionate visit",
          "price":
          "1,000,000/day"
        },
        {
          "name":
          "Compassionate visit (daily limit)",
          "price":
          "1,200/per day for 5 days accommodation"
        },
        {
          "name":
          "Repatriation of remains",
          "price":
          "1,000,000"
        },
        {
          "name":
          "24-Hour Worldwide emergency assistance hotline",
          "price": ""
        },
      ],
    ),
  ];

  List<WhatCoverItem> get tripItems => const [
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Trip cancellation",
      contents: [
        {
          "name":
          "Trip cancellation (Option A)",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Trip cancellation -Single occupancy reimbursement  (Option B)",
          "price":
          "1,000,000"
        },
      ],
    ),
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Trip interruption ",
      contents: [
        {
          "name":
          "Trip interruption",
          "price":
          "1,500,000"
        },
      ],
    ),
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Trip re-routing",
      contents: [
        {
          "name":
          "Trip re-routing (accommodation)",
          "price":
          "300/per day for accommodation"
        },
      ],
    ),
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Travel delay",
      contents: [
        {
          "name":
          "Cash allowance - Option A - Cash allowance",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Cash allowance - Option A - Cash allowance (daily rate)",
          "price":
          "300/per each\nfull 6-hour delay "
        },
        {
          "name":
          "Cash allowance - Option B - Expenses rebate",
          "price":
          "300/per each\nfull 6-hour delay "
        },
        {
          "name":
          "Cash allowance - Option B - Expenses rebate (daily rate)",
          "price":
          "300/per day\nfor accommodation"
        },
      ],
    ),
  ];

  List<WhatCoverItem> get stuffItems => const [
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Personal property",
      contents: [
        {
          "name":
          "Personal property",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Personal property (per item limit)",
          "price":
          "1,000,000"
        },
        {
          "name":
          "Laptop",
          "price":
          "1,000,000"
        },
        {
          "name":
          "Mobile Phone",
          "price":
          "1,000,000"
        },
      ],
    ),
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Travel documents ",
      contents: [
        {
          "name":
          "Travel documents ",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Loss of travel documents (accommodation expenses)",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Personal money ",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Unauthorized use of Credit Card",
          "price":
          "1,500,000"
        },
        {
          "name":
          "Baggage delay",
          "price":
          "1,500,000"
        },
      ],
    ),
    WhatCoverItem(
      isPopup: true,
      headTitle:
      "Home contents protection",
      contents: [
        {
          "name":
          "Home contents protection",
          "price":
          "300,000"
        },
        {
          "name":
          "Home contents protection (each item)",
          "price":
          "300,000"
        },
      ],
    ),
  ];
}
