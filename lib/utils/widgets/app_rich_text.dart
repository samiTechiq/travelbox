import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';

class RichTextClass extends StatelessWidget {
  final String? title;
  final String? link;
  final String? orLink;
  final String? subTitle;
  final double fontSize;
  final Function()? onTapLink;
  final Function()? onTapOrLink;

  const RichTextClass({
    Key? key,
    this.title,
    this.orLink,
    this.subTitle,
    this.fontSize = 30,
    this.link,
    this.onTapLink,
    this.onTapOrLink,
  }) : super(key: key);

  TextStyle get defaultStyle => TextStyle(
        color: R.palette.appHeadingTextBlackColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: R.theme.larkenLightFontFamily,
        height: 1.1,
      );

  TextStyle get linkStyle => TextStyle(
        color: R.palette.appPrimaryBlue,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: R.theme.larkenLightFontFamily,
        height: 1.1,
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
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onTapLink!();
                  }),
            TextSpan(text: " or ", style: defaultStyle),
            TextSpan(
                text: orLink ?? "conditions",
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onTapOrLink!();
                  }),
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
  final VoidCallback? onTermPress;
  final VoidCallback? onPrivacyPress;
  final String? fontFamily;
  final Color? color;
  final TextSpan? endTextSpan;
  final FontWeight? fontWeight;

  const TermsAndCondtions({
    Key? key,
    this.title,
    this.orLink,
    this.subTitle,
    this.fontSize = 36,
    this.link,
    this.onTermPress,
    this.onPrivacyPress,
    this.fontFamily,
    this.color,
    this.endTextSpan,
    this.fontWeight,
  }) : super(key: key);

  TextStyle get defaultStyle => TextStyle(
        color: color ?? R.palette.textFieldHintGreyColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily ?? R.theme.larkenDemoRegular,
      );

  TextStyle get linkStyle => TextStyle(
        color: color ?? R.palette.appPrimaryBlue,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily ?? R.theme.larkenDemoRegular,
      );

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamily: fontFamily ?? R.theme.larkenDemoRegular,
      fontSize: fontSize,
      color: color ?? R.palette.lightGray,
    );
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: title, style: style),
          TextSpan(
              text: link ?? "Terms of Business",
              style: style.copyWith(
                color: R.palette.appPrimaryBlue,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTermPress),
          TextSpan(
            text: AppLocalizations.of(context).and,
            style: style,
          ),
          TextSpan(
              text: subTitle ?? "Privacy Policy.",
              style: style.copyWith(
                color: R.palette.appPrimaryBlue,
              ),
              recognizer: TapGestureRecognizer()..onTap = onPrivacyPress),
          if (endTextSpan != null) endTextSpan!,
        ],
      ),
    );
  }
}
