import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/titile_widget_builder.dart';
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/add_on_item_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/terms_and_policy_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/what_cover_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/your_health_popup.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/date_time_ext.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/number_utils.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';
import 'package:travelbox/utils/widgets/drop_down/app_dropdown.dart';

class QuoteMoreDetailScreenMobile extends StatefulWidget {
  final Quote? quote;

  const QuoteMoreDetailScreenMobile({
    super.key,
    this.quote,
  });

  @override
  State<QuoteMoreDetailScreenMobile> createState() =>
      _QuoteMoreDetailScreenMobileState();
}

class _QuoteMoreDetailScreenMobileState
    extends State<QuoteMoreDetailScreenMobile> {
  int selectedindex = 0;
  int selectedindex2 = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuoteDetailViewModel>.value(
      value: sl<QuoteDetailViewModel>(),
      builder: (context, child) {
        final viewModel = context.watch<QuoteDetailViewModel>();
        return Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenericAppBarMobile(
                            trailing: SizedBox(
                              width: 43.w,
                              height: 43.h,
                            ),
                            leading: Padding(
                              padding: EdgeInsets.only(right: 9.w),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: R.palette.mediumBlack,
                              ),
                            ),
                            onLeadingPressed: () {
                              sl<Navigation>().goBack(context);
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Heading(
                            AppLocalizations.of(context)
                                .single_trip_cover_here_your_quote_2,
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            fontFamily: R.theme.larkenLightFontFamily,
                            color: R.palette.appHeadingTextBlackColor,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TitleWidgetBuilder(
                            timeFrame:
                                sl<CoverQuoteViewModel>().timeframeSelected,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            width: double.maxFinite,
                            decoration: R.theme.genericCardDecoration,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 23.w,
                                  right: 23.w,
                                  top: 24.h,
                                  bottom: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SubHeading(
                                    AppLocalizations.of(context)
                                        .your_trip_detail,
                                    fontWeight: FontWeight.w600,
                                    color: R.palette.darkBlack,
                                    fontSize: 23,
                                    fontFamily: R.theme.interRegular,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  SubHeading(
                                    "Thailand",
                                    fontWeight: FontWeight.w600,
                                    color: R.palette.appPrimaryBlue,
                                    fontSize: 32,
                                  ),
                                  Row(
                                    children: [
                                      SubHeading(
                                        'Oct 10 - Oct 17, 2023'.hardcoded,
                                        fontWeight: FontWeight.w400,
                                        color: R.palette.mediumBlack,
                                        fontSize: 17,
                                      ),
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text(
                                        "|",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: R.palette.mediumBlack,
                                          fontSize: 17.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      SizedBox(
                                        width: 0.35.sw,
                                        child: GenericDropDown<Widget>(
                                          contentPadding: EdgeInsets.zero,
                                          hintColor: R.palette.mediumBlack,
                                          fillColor: R.palette.appWhiteColor,
                                          hint: Text(
                                            AppLocalizations.of(context)
                                                .travellers,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: R.palette.appPrimaryBlue,
                                              fontSize: 17.sp,
                                              fontFamily: R.theme.interRegular,
                                            ),
                                          ),
                                          hintText: '',
                                          dropDownColor: R.palette.white,
                                          textColor: R.palette.appPrimaryBlue,
                                          iconColor: R.palette.appPrimaryBlue,
                                          items: [
                                            "Collins".hardcoded,
                                            "Max".hardcoded
                                          ].asMap().entries.map((entry) {
                                            return Text(
                                              entry.value,
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontFamily:
                                                    R.theme.interRegular,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            );
                                          }).toList(),
                                          textStyle: TextStyle(
                                            fontFamily: R.theme.interRegular,
                                            color: R.palette.mediumBlack,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          filled: true,
                                          mapDropDownText: (value) {
                                            return value;
                                          },
                                          onDropDownItemChanged: (value) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            decoration: R.theme.genericCardDecoration,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  R.assets.graphics.coverImage.path,
                                  width: 176.w,
                                  height: 41.h,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .asia_superior_travel_insurance,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            R.palette.appHeadingTextBlackColor,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Visibility(
                                        visible: viewModel.totalPrice > 0,
                                        child: SubHeading(
                                          "HK\$${NumberUtils.formatPriceNumber(viewModel.totalPrice + 80)}",
                                          fontWeight: FontWeight.w500,
                                          color: R.palette.mediumBlack,
                                          fontSize: 17,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      SubHeading(
                                        "HK\$${NumberUtils.formatPriceNumber(viewModel.totalPrice)}",
                                        fontWeight: FontWeight.w500,
                                        color: R.palette.appPrimaryBlue,
                                        fontSize: 24,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          viewModel.setSelectedPlan(
                                              AppLocalizations.of(context)
                                                  .txt_plan_b,
                                              200);
                                        },
                                        child: Container(
                                          width: 142.w,
                                          height: 47.h,
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
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.h, bottom: 10.h, left: 20.w),
                                      child: SubHeading(
                                        AppLocalizations.of(context)
                                            .whats_covered,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            R.palette.appHeadingTextBlackColor,
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
                                                left: 5.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Column(
                                              children: [
                                                WhatCoverItem(
                                                  headTitle:
                                                      AppLocalizations.of(
                                                              context)
                                                          .txt_your_health,
                                                  subTitle: AppLocalizations.of(
                                                          context)
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
                                                      heading:
                                                          AppLocalizations.of(
                                                                  context)
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
                                                left: 5.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Column(
                                              children: [
                                                WhatCoverItem(
                                                  headTitle:
                                                      AppLocalizations.of(
                                                              context)
                                                          .txt_your_trip,
                                                  subTitle: AppLocalizations.of(
                                                          context)
                                                      .txt_see_all_trip_coverage,
                                                  contents: const [
                                                    {
                                                      "name":
                                                          "Trip Cancellation",
                                                      "price": "1,500,000"
                                                    },
                                                    {
                                                      "name": "Trip Delay",
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
                                                      heading:
                                                          AppLocalizations.of(
                                                                  context)
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
                                                left: 5.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Column(
                                              children: [
                                                WhatCoverItem(
                                                  headTitle: AppLocalizations.of(context).txt_your_stuff,
                                                  subTitle:
                                                      AppLocalizations.of(context).txt_see_all_personal_belongings_coverage,
                                                  contents: const [
                                                    {
                                                      "name":
                                                          "Loss or damage to personal property",
                                                      "price": "1,500,000"
                                                    },
                                                    {
                                                      "name": "Loss of money",
                                                      "price": "500,000"
                                                    },
                                                    {
                                                      "name": "Home contents",
                                                      "price": "30,00,000"
                                                    },
                                                  ],
                                                  onClickSubTitle: () =>
                                                      _showDialog(
                                                    context, YourHealthPopup(
                                                      heading: AppLocalizations.of(context).txt_your_stuff,
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
                                                left: 5.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Column(
                                              children: [
                                                WhatCoverItem(
                                                  headTitle: AppLocalizations.of(context).txt_included_extras,
                                                  subTitle:
                                                  AppLocalizations.of(context).txt_see_all_included_extras,
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
                                                    context, YourHealthPopup(
                                                      heading:
                                                      AppLocalizations.of(context).txt_included_extras,
                                                      widgets: includedExtrasItems,
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
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.h, bottom: 10.h, left: 20.w),
                                      child: SubHeading(
                                        AppLocalizations.of(context).txt_what_can_you_add_on,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            R.palette.appHeadingTextBlackColor,
                                        fontFamily:
                                            R.theme.larkenLightFontFamily,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 210.h,
                                          // width: double.maxFinite,
                                          child: PageView.builder(
                                            padEnds: false,
                                            controller: PageController(
                                              viewportFraction: 0.5,
                                              initialPage: 1,
                                            ),
                                            onPageChanged: (int page) {
                                              setState(() {
                                                selectedindex = page;
                                              });
                                            },
                                            itemCount: quoteDetailAddOns.length,
                                            itemBuilder: (context, index) {
                                              final item =
                                                  quoteDetailAddOns[index];

                                              return AddOnItemWidget(
                                                headTitle:
                                                    item["name"].toString(),
                                                contents: item["description"]
                                                    .toString(),
                                                price: item["price"].toString(),
                                                subTitle:
                                                    item["subTitle"].toString(),
                                                onPressed: () =>
                                                    getDetailItemById(
                                                        item["id"].toString()),
                                                isAdded:
                                                    viewModel.isAddOnSelected(
                                                        item["id"].toString()),
                                                onSelectAdd: () => {
                                                  onAddOnSelected(
                                                      item["id"].toString(),
                                                      double.parse(item["price"]
                                                          .toString())),
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: _buildPageIndicator(),
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        SizedBox(
                                          height: 200.h,
                                          // width: double.maxFinite,
                                          child: PageView.builder(
                                            padEnds: false,
                                            controller: PageController(
                                              viewportFraction: 0.5,
                                              initialPage: 1,
                                            ),
                                            onPageChanged: (int page) {
                                              setState(() {
                                                selectedindex2 = page;
                                              });
                                            },
                                            itemCount:
                                                quoteDetailAddOns2.length,
                                            itemBuilder: (context, index) {
                                              final item =
                                                  quoteDetailAddOns2[index];

                                              return AddOnItemWidget(
                                                headTitle:
                                                    item["name"].toString(),
                                                contents: item["description"]
                                                    .toString(),
                                                price: item["price"].toString(),
                                                subTitle:
                                                    item["subTitle"].toString(),
                                                onPressed: () =>
                                                    getDetailItemById(
                                                        item["id"].toString()),
                                                isAdded:
                                                    viewModel.isAddOnSelected(
                                                        item["id"].toString()),
                                                onSelectAdd: () => {
                                                  onAddOnSelected(
                                                      item["id"].toString(),
                                                      double.parse(item["price"]
                                                          .toString())),
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: _buildPageIndicator2(),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      SubHeading(
                                        AppLocalizations.of(context).downloads,
                                        fontSize: 25,
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
                                        fontSize: 16,
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
                                        fontSize: 16,
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
                                        fontSize: 16,
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
                            height: 35.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: GenericButton(
                              width: 376.w,
                              onPressed: () async {
                                // EasyLoading.show();
                                // final result = await viewModel.getOrder();
                                // EasyLoading.dismiss();
                                // if (result == null) return;

                                Future.delayed(const Duration(seconds: 0), () {
                                  // ignore: use_build_context_synchronously
                                  sl<Navigation>().push(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      Routes.quotePurchaseDetailRoute);
                                });
                              },
                              text:
                                  AppLocalizations.of(context).txt_get_covered_for('${viewModel.selectedQuote?.quotePrice?.currency ?? 'HK\$'}${NumberUtils.formatPriceNumber(viewModel.totalPrice)}'),
                              isEnable: viewModel.selectedPlan != null,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: '${AppLocalizations.of(context).our} ',
                                  style: TextStyle(
                                    color: R.palette.textFieldHintGreyColor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    fontSize: 16.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: AppLocalizations.of(context)
                                          .privacy_policy,
                                      style: TextStyle(
                                        color: R.palette.appPrimaryBlue,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: R.theme.interRegular,
                                        fontSize: 16.sp,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          _showDialog(
                                            context,
                                            TermsAndPolicyPopup(
                                              title: AppLocalizations.of(context).txt_privacy_policy,
                                              subtitle:
                                                  AppLocalizations.of(context).txt_effective_date(DateTime(2024,1,1).formatToDoPattern),
                                              content: termsData,
                                            ),
                                          );
                                        },
                                    ),
                                    TextSpan(
                                        text: AppLocalizations.of(context).and,
                                        style: TextStyle(
                                          color:
                                              R.palette.textFieldHintGreyColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: R.theme.interRegular,
                                          fontSize: 16.sp,
                                        )),
                                    TextSpan(
                                      text:
                                          '${AppLocalizations.of(context).terms_of_business} ',
                                      style: TextStyle(
                                        color: R.palette.appPrimaryBlue,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: R.theme.interRegular,
                                        fontSize: 16.sp,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          _showDialog(
                                            context,
                                            TermsAndPolicyPopup(
                                              title: AppLocalizations.of(context).txt_privacy_policy,
                                              subtitle:
                                              AppLocalizations.of(context).txt_effective_date(DateTime(2024,1,1).formatToDoPattern),
                                              content: termsData,
                                            ),
                                          );
                                        },
                                    ),
                                    TextSpan(
                                        text: AppLocalizations.of(context)
                                            .available_for_you_to_read_here,
                                        style: TextStyle(
                                          color:
                                              R.palette.textFieldHintGreyColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: R.theme.interRegular,
                                          fontSize: 16.sp,
                                        )),
                                  ],
                                ),
                              ),
                              // SubHeading(
                              //   AppLocalizations.of(context)
                              //       .available_for_you_to_read_here,
                              //   color: R.palette.textFieldHintGreyColor,
                              //   fontWeight: FontWeight.w400,
                              //   fontFamily: R.theme.interRegular,
                              //   fontSize: 16,
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < quoteDetailAddOns.length; i++) {
      list.add(i == selectedindex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> _buildPageIndicator2() {
    List<Widget> list = [];
    for (int i = 0; i < quoteDetailAddOns2.length; i++) {
      list.add(i == selectedindex2 ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      height: 9.w,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        height: isActive ? 9.w : 8.w,
        width: isActive ? 10.w : 8.w,
        decoration: BoxDecoration(
          boxShadow: [
            isActive
                ? BoxShadow(
                    color: R.palette.appPrimaryBlue.withOpacity(0.72),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(
                      0.0,
                      0.0,
                    ),
                  )
                : const BoxShadow(
                    color: Colors.transparent,
                  )
          ],
          shape: BoxShape.circle,
          color: isActive ? R.palette.appPrimaryBlue : const Color(0xFF7AD0FF),
        ),
      ),
    );
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

  void onAddOnSelected(String id, double price) {
    var viewmodel = sl<QuoteDetailViewModel>();
    viewmodel.updateAddOn(id, price);
  }

  void getDetailItemById(String id) {
    switch (id) {
      case "1":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.cruiseCoverRoute);
        });
        break;
      case "2":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.vacationRentalRoute);
        });
        break;
      case "3":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.personalLiabilityRoute);
        });
        break;
      case "4":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.adventureExtremeRoute);
        });
        break;
      case "5":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.winterSportsRoute);
        });
        break;
      case "6":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.gadgetCoverRoute);
        });
        break;
      case "7":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.golfCoverRoute);
        });
        break;
      case "8":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.carHireExcessRoute);
        });
        break;
      case "9":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.cancelReasonRoute);
        });
        break;
      case "10":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.rentalCareRoute);
        });
        break;
      case "11":
        Future.delayed(Duration.zero, () {
          // ignore: use_build_context_synchronously
          sl<Navigation>().push(context, Routes.petCareRoute);
        });
        break;
      default:
        break;
    }
  }

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
          headTitle: "Personal accident",
          contents: [
            {"name": "Accident on public transport", "price": "1,500,000"},
            {"name": "Other type of accident", "price": "1,000,000"},
          ],
        ),
        WhatCoverItem(
          isPopup: true,
          headTitle: "Medical expenses",
          contents: [
            {"name": "Medical expenses", "price": "1,500,000"},
            {"name": "Follow up medical expe0nses", "price": "1,000,000"},
            {"name": "Major burns", "price": "1,000,000"},
          ],
        ),
        WhatCoverItem(
          isPopup: true,
          headTitle: "Chinese medicine ",
          contents: [
            {"name": "Chinese medicine practitioner", "price": "3,000"},
            {
              "name": "Chinese medicine practitioner (daily limit)",
              "price": "1,000,000/day"
            },
          ],
        ),
        WhatCoverItem(
          isPopup: true,
          headTitle: "Trauma counselling ",
          contents: [
            {"name": "Trauma counselling", "price": "1,500,000"},
            {
              "name": "Trauma counselling (daily limit)",
              "price": "1,000,000/day"
            },
          ],
        ),
        WhatCoverItem(
          isPopup: true,
          headTitle: "Worldwide emergency assistance",
          contents: [
            {"name": "Medical evacuation", "price": "1,500,000"},
            {
              "name": "Repatriation after local treatment",
              "price": "1,000,000/day"
            },
            {"name": "Hospital deposit", "price": "1,000,000"},
            {
              "name": "Repatriation of unattended children",
              "price": "1,500,000"
            },
            {"name": "Compassionate visit", "price": "1,000,000/day"},
            {
              "name": "Compassionate visit (daily limit)",
              "price": "1,200/per day for 5 days accommodation"
            },
            {"name": "Repatriation of remains", "price": "1,000,000"},
            {
              "name": "24-Hour Worldwide emergency assistance hotline",
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
          "name": "Laptop",
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
          "price": "300,000"
        },
        {
          "name":
          "Home contents protection (each item)",
          "price": "300,000"
        },
      ],
    ),
  ];

  List<WhatCoverItem> get includedExtrasItems => const [
    WhatCoverItem(
      isPopup: true,
      headTitle: "Extras",
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
          "price": "1,000"
        },
      ],
    ),
  ];
}
