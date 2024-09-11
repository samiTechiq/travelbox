import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/terms_and_policy_popup.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class ContentBot extends StatelessWidget {
  final VoidCallback onPressed;
  const ContentBot({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: ContentBottomMobile(onPressed: onPressed),
      desktopLayout: ContentBottomDesktop(onPressed: onPressed),
    );
  }
}

class ContentBottomMobile extends StatelessWidget {
  final VoidCallback onPressed;
  const ContentBottomMobile({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    R.assets.graphics.mail.path,
                    height: 18.w,
                    width: 18.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: SubHeading(
                      AppLocalizations.of(context).we_will_email_you_your,
                      color: R.palette.lightGray,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    R.assets.graphics.arrowForward.path,
                    height: 18.w,
                    width: 18.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: SubHeading(
                      AppLocalizations.of(context).your_price_includes_the_HK,
                      color: R.palette.lightGray,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  child: GenericButton(
                    onPressed: () async {
                      sl<Navigation>()
                          .push(context, Routes.detailsPolicyConfirmRoute);
                    },
                    text: AppLocalizations.of(context).confirm_purchase,
                    fontWeightT: FontWeight.w500,
                    fontFamily: R.theme.interRegular,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    text:
                        '${AppLocalizations.of(context).not_ready_to_buy} ${AppLocalizations.of(context).click} ',
                    style: TextStyle(
                      color: R.palette.mediumBlack,
                      fontWeight: FontWeight.w500,
                      fontFamily: R.theme.interRegular,
                      fontSize: 16.sp,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                    ),
                    children: [
                      TextSpan(
                          text: '${AppLocalizations.of(context).here} ',
                          style: TextStyle(
                            color: R.palette.appPrimaryBlue,
                            fontWeight: FontWeight.w500,
                            fontFamily: R.theme.interRegular,
                            fontSize: 16.sp,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3,
                          )),
                      TextSpan(
                          text:
                              AppLocalizations.of(context).to_email_your_quote,
                          style: TextStyle(
                            color: R.palette.mediumBlack,
                            fontWeight: FontWeight.w500,
                            fontFamily: R.theme.interRegular,
                            fontSize: 16.sp,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
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
                              text: AppLocalizations.of(context).privacy_policy,
                              style: TextStyle(
                                color: R.palette.appPrimaryBlue,
                                fontWeight: FontWeight.w500,
                                fontFamily: R.theme.interRegular,
                                fontSize: 16.sp,
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
                                color: R.palette.textFieldHintGreyColor,
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
                          TextSpan(
                              text: AppLocalizations.of(context).are,
                              style: TextStyle(
                                color: R.palette.textFieldHintGreyColor,
                                fontWeight: FontWeight.w400,
                                fontFamily: R.theme.interRegular,
                                fontSize: 16.sp,
                              )),
                        ],
                      ),
                    ),
                    SubHeading(
                      AppLocalizations.of(context)
                          .available_for_you_to_read_here,
                      color: R.palette.textFieldHintGreyColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
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

class ContentBottomDesktop extends StatelessWidget {
  final VoidCallback onPressed;
  const ContentBottomDesktop({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      R.assets.graphics.mail.path,
                      height: 19.h,
                      width: 19.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SubHeading(
                      AppLocalizations.of(context).we_will_email_you_your,
                      color: R.palette.lightGray,
                      fontWeight: FontWeight.w400,
                      fontSize: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      R.assets.graphics.arrowForward.path,
                      height: 19.h,
                      width: 19.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SubHeading(
                      AppLocalizations.of(context).your_price_includes_the_HK,
                      color: R.palette.lightGray,
                      fontWeight: FontWeight.w400,
                      fontSize: 5,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 530,
            height: 58.h,
            child: GenericButton(
              onPressed: onPressed,
              text: AppLocalizations.of(context).confirm_purchase,
              fontWeightT: FontWeight.w500,
              fontFamily: R.theme.interRegular,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: 30.h),
        Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              text:
                  '${AppLocalizations.of(context).not_ready_to_buy} ${AppLocalizations.of(context).click} ',
              style: TextStyle(
                color: R.palette.mediumBlack,
                fontWeight: FontWeight.w500,
                fontFamily: R.theme.interRegular,
                fontSize: 18,
                decoration: TextDecoration.underline,
                decorationThickness: 3,
              ),
              children: [
                TextSpan(
                    text: '${AppLocalizations.of(context).here} ',
                    style: TextStyle(
                      color: R.palette.appPrimaryBlue,
                      fontWeight: FontWeight.w500,
                      fontFamily: R.theme.interRegular,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    )),
                TextSpan(
                    text: AppLocalizations.of(context).to_email_your_quote,
                    style: TextStyle(
                      color: R.palette.mediumBlack,
                      fontWeight: FontWeight.w500,
                      fontFamily: R.theme.interRegular,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: '${AppLocalizations.of(context).our} ',
                  style: TextStyle(
                    color: R.palette.textFieldHintGreyColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: R.theme.interRegular,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                        text: AppLocalizations.of(context).privacy_policy,
                        style: TextStyle(
                          color: R.palette.appPrimaryBlue,
                          fontWeight: FontWeight.w500,
                          fontFamily: R.theme.interRegular,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _showDialog(
                              context,
                              const TermsAndPolicyPopup(
                                title: 'Privacy Policy',
                                subtitle: 'Effective Date: 1 st January 2024',
                                content: termsData,
                              ),
                            );
                          }),
                    TextSpan(
                        text: AppLocalizations.of(context).and,
                        style: TextStyle(
                          color: R.palette.textFieldHintGreyColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.interRegular,
                          fontSize: 16,
                        )),
                    TextSpan(
                        text:
                            '${AppLocalizations.of(context).terms_of_business} ',
                        style: TextStyle(
                          color: R.palette.appPrimaryBlue,
                          fontWeight: FontWeight.w500,
                          fontFamily: R.theme.interRegular,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _showDialog(
                              context,
                              const TermsAndPolicyPopup(
                                title: 'Terms of Business',
                                subtitle: 'Effective Date: 1 st January 2024',
                                content: termsData,
                              ),
                            );
                          }),
                    TextSpan(
                        text: AppLocalizations.of(context).are,
                        style: TextStyle(
                          color: R.palette.textFieldHintGreyColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.interRegular,
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
              SubHeading(
                AppLocalizations.of(context).available_for_you_to_read_here,
                color: R.palette.textFieldHintGreyColor,
                fontWeight: FontWeight.w400,
                fontSize: 4.5,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
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
