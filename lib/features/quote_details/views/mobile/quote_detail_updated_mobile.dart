import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/viewmodel/common_quote_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/titile_widget_builder.dart';
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart';
import 'package:travelbox/features/quote_details/widgets/filter_dialog.dart';
import 'package:travelbox/features/quote_details/widgets/optional_extras_dialog.dart';
import 'package:travelbox/features/quote_details/widgets/quote_list_card.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/terms_and_policy_popup.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';
import 'package:travelbox/utils/widgets/drop_down/app_dropdown.dart';

class QuoteDetailsUpdatedMobile extends StatelessWidget {
  QuoteDetailsUpdatedMobile({Key? key}) : super(key: key);

  Future<void> _showFilterDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const FilterDialog();
      },
    );
  }

  Future<void> _showOptionalExtrasDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const OptionalExtrasDialog();
      },
    );
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
            child: Scaffold(
              backgroundColor: R.palette.appBackgroundColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GenericAppBarMobile(
                        trailing: SizedBox(
                          height: 43.h,
                          width: 43.w,
                        ),
                        leading: Padding(
                          padding: EdgeInsets.only(right: 12.w),
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
                            .single_trip_cover_here_your_quote,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        fontFamily: R.theme.larkenLightFontFamily,
                        color: R.palette.appHeadingTextBlackColor,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TitleWidgetBuilder(
                        timeFrame: sl<CoverQuoteViewModel>().timeframeSelected,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: double.maxFinite,
                        decoration: R.theme.genericCardDecoration,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 23.w, right: 23.w, top: 24.h, bottom: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubHeading(
                                AppLocalizations.of(context).your_trip_detail,
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
                                    'Oct 10 - Oct 17, 2023',
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
                                        AppLocalizations.of(context).travellers,
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
                                        "Collins (30 years old)",
                                        "Max (29 years old)"
                                      ].asMap().entries.map((entry) {
                                        return Text(
                                          entry.value,
                                          style: TextStyle(
                                            fontSize: 17.sp,
                                            fontFamily: R.theme.interRegular,
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
                        width: double.maxFinite,
                        decoration: R.theme.genericCardDecoration,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 15.h),
                          child: Row(
                            children: [
                              GestureDetector(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      R.assets.graphics.sort.path,
                                      height: 19.h,
                                      width: 19.w,
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                      width: 0.25.sw,
                                      child: GenericDropDown(
                                        fillColor: Colors.white,
                                        items: [
                                          AppLocalizations.of(context)
                                              .highest_price,
                                          AppLocalizations.of(context)
                                              .lowest_price,
                                          AppLocalizations.of(context)
                                              .most_discounted,
                                          AppLocalizations.of(context).selected,
                                        ],
                                        textStyle: TextStyle(
                                          fontFamily: R.theme.interRegular,
                                          color: R.palette.mediumBlack,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hintTextStyle: TextStyle(
                                          fontFamily: R.theme.interRegular,
                                          fontSize: 17.sp,
                                          color: R.palette.mediumBlack,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        hintText:
                                            AppLocalizations.of(context).sort,
                                        filled: false,
                                        mapDropDownText: (value) {
                                          return Text(
                                            value,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: R.palette.mediumBlack,
                                                fontFamily:
                                                    R.theme.interRegular,
                                                fontSize: 17.sp),
                                          );
                                        },
                                        onDropDownItemChanged: (value) {},
                                        dropDownColor: R.palette.white,
                                        icon: const SizedBox(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _showFilterDialog(context);
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      R.assets.graphics.filter.path,
                                      height: 19.h,
                                      width: 19.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    SubHeading(
                                      AppLocalizations.of(context).filter,
                                      fontWeight: FontWeight.w400,
                                      color: R.palette.mediumBlack,
                                      fontFamily: R.theme.interRegular,
                                      fontSize: 17.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Column(
                          children: quotes.map((item) {
                        return QuoteCard(
                          quote: item,
                          onPressOptionalExtras: () =>
                              _showOptionalExtrasDialog(context),
                        );
                      }).toList()),
                      SizedBox(
                        height: 25.h,
                      ),
                      SubHeading(
                        AppLocalizations.of(context).quote_list_note,
                        fontWeight: FontWeight.w500,
                        color: R.palette.lightGray,
                        fontSize: 17,
                        maxLines: 16,
                      ),
                      RichText(
                        // textAlign: TextAlign.center,
                        text: TextSpan(
                          style: defaultStyle,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Our ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: R.theme.interRegular,
                                    fontSize: 16.sp,
                                    color: R.palette.textFieldHintGreyColor)),
                            TextSpan(
                                text:
                                    AppLocalizations.of(context).privacy_policy,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: R.theme.interRegular,
                                  fontSize: 16.sp,
                                  decoration: TextDecoration.underline,
                                  color: R.palette.appPrimaryBlue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _showDialog(
                                      context,
                                      const TermsAndPolicyPopup(
                                        title: 'Privacy Policy',
                                        subtitle:
                                            'Effective Date: 1 st January 2024',
                                        content: termsData,
                                      ),
                                    );
                                  }),
                            TextSpan(
                                text: AppLocalizations.of(context).and,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: R.theme.interRegular,
                                    fontSize: 16.sp,
                                    color: R.palette.textFieldHintGreyColor)),
                            TextSpan(
                                text: AppLocalizations.of(context)
                                    .term_and_conditions_apply,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: R.theme.interRegular,
                                  fontSize: 16.sp,
                                  decoration: TextDecoration.underline,
                                  color: R.palette.appPrimaryBlue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _showDialog(
                                      context,
                                      const TermsAndPolicyPopup(
                                        title: 'Terms of Business',
                                        subtitle:
                                            'Effective Date: 1 st January 2024',
                                        content: termsData,
                                      ),
                                    );
                                  }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
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

  Future<void> _showDialog(BuildContext context, Widget dialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
