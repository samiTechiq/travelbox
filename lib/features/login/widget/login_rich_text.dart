import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';

class RichTextClass extends StatelessWidget {
  final String? title;
  final String? link;
  final String? orLink;
  final String? subTitle;
  final double fontSize;

  const RichTextClass({
    Key? key,
    this.title,
    this.orLink,
    this.subTitle,
    this.fontSize = 30,
    this.link,
  }) : super(key: key);

  TextStyle get defaultStyle => TextStyle(
    color: R.palette.appHeadingTextBlackColor,
    fontSize: fontSize.sp,
    fontWeight: FontWeight.w400,
    fontFamily: R.theme.larkenLightFontFamily,
  );
  TextStyle get  linkStyle => TextStyle(
    color: R.palette.appPrimaryBlue,
    fontSize: fontSize.sp,
    fontWeight: FontWeight.w400,
    fontFamily: R.theme.larkenLightFontFamily,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 0, right: 15),
      child: RichText(
        // textAlign: TextAlign.center,
        text: TextSpan(
          style: defaultStyle,
          children: <TextSpan>[
            TextSpan(text: title, style: defaultStyle),
            TextSpan(
                text: link ?? "Terms",
                style: linkStyle,
                recognizer: TapGestureRecognizer()..onTap = () {}),
            TextSpan(text: " or ", style: defaultStyle),
            TextSpan(
                text: orLink ?? "conditions",
                style: linkStyle,
                recognizer: TapGestureRecognizer()..onTap = () {}),
            TextSpan(
                text: subTitle ?? "Privacy Policy.",
                style: defaultStyle,
                recognizer: TapGestureRecognizer()..onTap = () {}),
          ],
        ),
      ),
    );
  }
}

//======================================Terms And Conditions=================================

class TermsAndCondtions extends StatelessWidget {
  final String? title;
  final String? link;
  final String? orLink;
  final String? subTitle;
  final double fontSize;

  const TermsAndCondtions({
    Key? key,
    this.title,
    this.orLink,
    this.subTitle,
    this.fontSize = 36,
    this.link,
  }) : super(key: key);

  TextStyle get defaultStyle => TextStyle(
    color: R.palette.appHeadingTextBlackColor,
    fontSize: fontSize.sp,
    fontWeight: FontWeight.w700,
    fontFamily: R.theme.larkenDemoRegular,
  );
  TextStyle get linkStyle => TextStyle(
    color: R.palette.appPrimaryBlue,
    fontSize: fontSize.sp,
    fontWeight: FontWeight.w700,
    fontFamily: R.theme.larkenDemoRegular,
  );

  @override
  Widget build(BuildContext context) {
    return RichText(
      // textAlign: TextAlign.center,
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(
              text: title,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: R.theme.interRegular,
                  fontSize: fontSize.sp,
                  color: R.palette.textFieldHintGreyColor)),
          TextSpan(
              text: link ?? "Terms of Business",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: R.theme.interRegular,
                fontSize: fontSize.sp,
                color: R.palette.appPrimaryBlue,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {}),
          TextSpan(
              text: " and ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: R.theme.interRegular,
                  fontSize: fontSize.sp,
                  color: R.palette.textFieldHintGreyColor)),
          TextSpan(
              text: subTitle ?? "Privacy Policy.",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: R.theme.interRegular,
                fontSize: fontSize.sp,
                color: R.palette.appPrimaryBlue,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ],
      ),
    );
  }
}
