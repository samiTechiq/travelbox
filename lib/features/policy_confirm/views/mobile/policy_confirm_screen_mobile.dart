import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/detail_policy/widgets/policy__detail_widget.dart';
import 'package:travelbox/features/detail_policy/widgets/policy_list_card_widget.dart';
import 'package:travelbox/features/policy_confirm/viewmodel/policy_confirm_viewmodel.dart';
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/terms_and_policy_popup.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/date_time_ext.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class PolicyConfirmMobile extends StatefulWidget {
  const PolicyConfirmMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<PolicyConfirmMobile> createState() => _PolicyConfirmMobileState();
}

class _PolicyConfirmMobileState extends State<PolicyConfirmMobile> {
  static final coverQuoteViewModel = sl<CoverQuoteViewModel>();

  // List<Widget> widgets = [
  //   PolicyDetailWidget(
  //       text:
  //           'You are a ${coverQuoteViewModel.selectedCountry.code} resident. What we mean by\n“${coverQuoteViewModel.selectedCountry.name} resident"',
  //       iconWidth: 22,
  //       bottomPadding: 30,
  //       iconTextWidth: 14,
  //       fontSize: 18,
  //       textDec: TextDecoration.underline),
  //   PolicyDetailWidget(
  //     text: R.stringRes.policyConfirmScreen.policyDetail2,
  //     iconWidth: 22,
  //     bottomPadding: 30,
  //     fontSize: 18,
  //     iconTextWidth: 14,
  //   ),
  //   PolicyDetailWidget(
  //     text: R.stringRes.policyConfirmScreen.policyDetail3,
  //     iconWidth: 22,
  //     bottomPadding: 30,
  //     fontSize: 18,
  //     iconTextWidth: 14,
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<PolicyConfirmViewModel>(),
      builder: (context, child) {
        final viewModel = context.watch<PolicyConfirmViewModel>();
        return Container(
          color: R.palette.appBackgroundColor,
          child: SafeArea(
            bottom: false,
            child: Scaffold(
              backgroundColor: R.palette.appBackgroundColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GenericAppBar(
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
                      SubHeading(
                        AppLocalizations.of(context).txt_some_but_important_boring_stuff_before_you,
                        fontSize: 32,
                        fontFamily: R.theme.larkenLightFontFamily,
                        fontWeight: FontWeight.w400,
                        color: R.palette.appHeadingTextBlackColor,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            R.assets.graphics.boringStuff.path,
                            height: 230.h,
                            width: 355.sw,
                            fit: BoxFit.cover,
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SubHeading2(
                                    AppLocalizations.of(context).txt_your_quote,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: R.theme.interRegular,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    textBaseline: TextBaseline.ideographic,
                                    children: <Widget>[
                                      SubHeading2(
                                        sl<QuoteDetailViewModel>().currency ??
                                            'HK'.hardcoded,
                                        fontSize: 27.sp,
                                        fontFamily: R.theme.larkenDemoRegular,
                                        fontWeight: FontWeight.w700,
                                        color: R.palette.appPrimaryBlue,
                                      ),
                                      SubHeading2(
                                        '\$',
                                        fontSize: 27.sp,
                                        fontFamily: R.theme.larken,
                                        fontWeight: FontWeight.w700,
                                        color: R.palette.appPrimaryBlue,
                                      ),
                                      SubHeading2(
                                        sl<QuoteDetailViewModel>()
                                            .totalPrice
                                            .toStringAsFixed(2),
                                        fontSize: 45.sp,
                                        fontFamily: R.theme.larken,
                                        fontWeight: FontWeight.w700,
                                        color: R.palette.appPrimaryBlue,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SubHeading(
                        AppLocalizations.of(context).txt_please_confirm_the_following_is_true,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: R.palette.appHeadingTextBlackColor,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      PolicyCard(
                        policyList: _policyList(context),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              viewModel.setConfirmAbove();
                            },
                            child: SquareBox(
                              checkValue: viewModel.confirmAbove,
                              iconSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                              child: SubHeading(
                            AppLocalizations.of(context).txt_i_confirm_the_above_is_true,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: R.palette.mediumBlack,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      SubHeading(
                        AppLocalizations.of(context).txt_exciting_documents_to_acknowledge,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: R.palette.lightGray,
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showDialog(
                            context,
                            TermsAndPolicyPopup(
                              title: AppLocalizations.of(context).txt_terms_of_business,
                              subtitle: AppLocalizations.of(
                                  context)
                                  .txt_effective_date(
                                DateTime(2024, 1, 1)
                                    .formatToDoPattern,
                              ),
                              content: termsData,
                            ),
                          );
                        },
                        child: readTermsPrivacy(
                          R.assets.graphics.pathIconForward.path,
                          AppLocalizations.of(context).txt_read_terms_and_conditions,
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showDialog(
                            context,
                            TermsAndPolicyPopup(
                              title: AppLocalizations.of(context).txt_privacy_policy,
                              subtitle: AppLocalizations.of(
                                  context)
                                  .txt_effective_date(
                                DateTime(2024, 1, 1)
                                    .formatToDoPattern,
                              ),
                              content: termsData,
                            ),
                          );
                        },
                        child: readTermsPrivacy(
                          R.assets.graphics.pathIconForward.path,
                          AppLocalizations.of(context).txt_read_privacy_policy,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              viewModel.setAcceptPolicy();
                            },
                            child: SquareBox(
                              checkValue: viewModel.acceptPolicy,
                              iconSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: SubHeading(
                              AppLocalizations.of(context).txt_i_accept_the_tcs_and_privacy_policy,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: R.palette.mediumBlack,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      GenericButton(
                        onPressed: () {
                          // final orderId =
                          //     sl<QuoteDetailViewModel>().order.orderId;
                          // sl<Navigation>().pushWithArgs(
                          //   context,
                          //   Routes.paymentsRoute,
                          //   args: orderId,
                          // );
                          sl<Navigation>().push(
                            context,
                            Routes.paymentsRoute,
                          );
                        },
                        text: AppLocalizations.of(context).btn_proceed_to_payment,
                        isEnable: viewModel.isButtonEnabled(),
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 30.h,
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

  List<Widget> _policyList(BuildContext context) => [
    PolicyDetailWidget(
      text: AppLocalizations.of(context).txt_policy_detail_one(coverQuoteViewModel.selectedCountry.name),
      iconWidth: 5,
      bottomPadding: 30,
      iconTextWidth: 1.w,
      fontSize: 16.sp,
      textDec: TextDecoration.underline,
    ),
    PolicyDetailWidget(
      text: AppLocalizations.of(context).txt_policy_detail_two,
      iconWidth: 5,
      bottomPadding: 30,
      fontSize: 16.sp,
      iconTextWidth: 1.w,
    ),
    PolicyDetailWidget(
      text: AppLocalizations.of(context).txt_policy_detail_three,
      iconWidth: 5,
      bottomPadding: 30,
      fontSize: 16.sp,
      iconTextWidth: 1.w,
    )
  ];

  Widget readTermsPrivacy(String imageUrl, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 18.w,
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: SubHeading(
            text,
            fontSize: 16,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w400,
            color: R.palette.dullBlack,
          ),
        )
      ],
    );
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
}
