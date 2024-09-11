import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/enum/phone_state.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/otp/view_model/otp_viewmodel.dart';
import 'package:travelbox/features/personal_detail/viewmodel/personal_detail_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/core/validator/validator.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/otp_field/otp_text_field.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class OtpCard extends StatelessWidget {
  final String phoneNumber;
  const OtpCard({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: OtpCardMobile(phoneNumber: phoneNumber),
      desktopLayout: OtpCardDesktop(phoneNumber: phoneNumber),
    );
  }
}

List<TextStyle?> otpTextStyles = [
  R.theme.otpNumberTextStyle,
  R.theme.otpNumberTextStyle,
  R.theme.otpNumberTextStyle,
  R.theme.otpNumberTextStyle,
];

class OtpCardMobile extends StatelessWidget {
  final String phoneNumber;

  const OtpCardMobile({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OtpViewmodel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.maxFinite,
          decoration: R.theme.genericCardDecoration,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                SvgPicture.asset(
                  R.assets.graphics.otp.path,
                  width: 190.w,
                  height: 199.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).otp_verification,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: R.palette.mediumBlack,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SubHeading(
                        "${AppLocalizations.of(context).enter_the_otp_sent_to} ",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: R.palette.mediumBlack,
                      ),
                      SubHeading(
                        phoneNumber,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: R.palette.mediumBlack,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                OtpTextField(
                  cursorColor: R.palette.appPrimaryBlue,
                  numberOfFields: 4,
                  borderColor: R.palette.appPrimaryBlue,
                  focusedBorderColor: R.palette.appPrimaryBlue,
                  enabledBorderColor: R.palette.checkBoxGreyColor,
                  styles: otpTextStyles,
                  showFieldAsBox: false,
                  borderWidth: 1.1,
                  fieldWidth: 52,
                  onCodeChanged: (String code) {
                    viewModel.setVerify(false);
                  },
                  onSubmit: (String verificationCode) {
                    viewModel.setOtpCode(verificationCode);
                    viewModel.setVerify(true);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        ValidationPattern.otp.pattern),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        "${AppLocalizations.of(context).didnt_you_receive_the_otp} ",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: R.theme.interRegular,
                      color: R.palette.textFieldHintGreyColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppLocalizations.of(context).resend_otp,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.interRegular,
                          color: R.palette.appPrimaryBlue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle tap event here
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('You tapped the text!'),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class OtpCardDesktop extends StatelessWidget {
  final String phoneNumber;
  final personalViewModel = sl<PersonalDetailViewmodel>();

  OtpCardDesktop({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OtpViewmodel>();
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 0.45.sw,
            child: Container(
              width: double.maxFinite,
              decoration: R.theme.genericCardDecoration,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 8.w,
                  right: 8.w,
                  top: 15.h,
                  bottom: 15.h,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    SvgPicture.asset(
                      R.assets.graphics.otp.path,
                      width: 190.w,
                      height: 199.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SubHeading(
                      AppLocalizations.of(context).otp_verification,
                      fontSize: 6,
                      fontWeight: FontWeight.w700,
                      color: R.palette.mediumBlack,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text:
                            "${AppLocalizations.of(context).enter_the_otp_sent_to} ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.interRegular,
                          color: R.palette.mediumBlack,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: phoneNumber,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: R.theme.interRegular,
                              color: R.palette.mediumBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    OtpTextField(
                      cursorColor: R.palette.appPrimaryBlue,
                      numberOfFields: 4,
                      borderColor: R.palette.appPrimaryBlue,
                      focusedBorderColor: R.palette.appPrimaryBlue,
                      enabledBorderColor: R.palette.checkBoxGreyColor,
                      styles: otpTextStyles,
                      showFieldAsBox: false,
                      borderWidth: 1.1,
                      fieldWidth: 52,
                      onCodeChanged: (String code) {
                        viewModel.setVerify(false);
                      },
                      onSubmit: (String verificationCode) {
                        viewModel.setOtpCode(verificationCode);
                        viewModel.setVerify(true);
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            ValidationPattern.otp.pattern),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text:
                            "${AppLocalizations.of(context).didnt_you_receive_the_otp} ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.interRegular,
                          color: R.palette.textFieldHintGreyColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: AppLocalizations.of(context).resend_otp,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: R.theme.interRegular,
                              color: R.palette.appPrimaryBlue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle tap event here
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('You tapped the text!'),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GenericButton(
                      onPressed: () {
                        personalViewModel.setPhoneState(PhoneState.verify);
                        sl<Navigation>().goBack(context);
                      },
                      text: AppLocalizations.of(context).verify,
                      fontWeightT: FontWeight.w500,
                      fontFamily: R.theme.interRegular,
                      textSize: 18,
                      fontSize: 18,
                      isEnable: viewModel.verify,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
