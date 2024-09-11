import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericText extends StatelessWidget {
  final String text;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? style;
  final TextDirection? textDirection;
  final String? fontFamily;
  final Locale? locale;
  final String? semantics;
  final Color? selectionColor;
  final EdgeInsets? wholePadding;
  final double? fontSize;
  final Color? color;
  final double? height;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;
  final bool multiLineText;

  const GenericText(this.text,
      {Key? key,
      this.overflow,
      this.maxLines = 1,
      this.style,
      this.semantics,
      this.textDirection,
      this.height,
      this.fontStyle,
      this.color,
      this.fontSize = 40,
      this.fontWeight = FontWeight.w400,
      this.strutStyle,
      this.textWidthBasis,
      this.fontFamily,
      this.textScaleFactor,
      this.textHeightBehavior,
      this.textAlign,
      this.locale,
      this.selectionColor,
      this.wholePadding,
      this.semanticsLabel,
      this.multiLineText = false,
      this.softWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: wholePadding ?? EdgeInsets.symmetric(horizontal: 8.0),
      child: Semantics(
        value: semantics,
        child: AutoSizeText(
          text,
          style: TextStyle(
            height: height,
            color: color,
            fontFamily: fontFamily ?? "Coolwonder",
            fontSize: fontSize,
            fontStyle: fontStyle ?? FontStyle.normal,
            fontWeight: fontWeight,
          ),
          overflow: overflow,
          maxLines: maxLines,
          textDirection: textDirection,
          locale: locale,
          semanticsLabel: semanticsLabel,
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textScaleFactor: textScaleFactor,
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String text;
  final Color? color;
  final double? height;
  final TextOverflow? overflow;
  final String fontFamily;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;

  const Heading(
    this.text, {
    Key? key,
    this.color = const Color(0xffFBFAFD),
    this.fontFamily = "larken-bold.ttf",
    this.height,
    this.fontStyle,
    this.maxLines = 4,
    this.overflow,
    this.fontWeight = FontWeight.w700,
    this.textAlign,
    this.fontSize = 66,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight,
      ),
    );
  }
}

class SubHeading extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final double? height;
  final TextAlign? textAlign;
  final double fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight fontWeight;
  final double? opacity;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final TextStyle? textStyle;
  final Color? decorationColor;
  final double? decorationThickness;
  final double? letterSpacing;

  const SubHeading(
    this.text, {
    Key? key,
    this.color = const Color(0xffFBFAFD),
    this.height,
    // this.fontFamily = "Inter-VariableFont_slnt,wght.ttf",
    this.fontFamily = "Inter",
    this.textAlign,
    this.fontSize = 24,
    this.opacity,
    this.maxLines = 2,
    this.overflow,
    this.fontWeight = FontWeight.w500,
    this.decoration,
    this.textStyle,
    this.fontStyle,
    this.decorationColor,
    this.decorationThickness,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          TextStyle(
            height: height,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationThickness: decorationThickness,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
          ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class SubHeading2 extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color color;
  final double? height;
  final TextAlign? textAlign;
  final double fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight fontWeight;
  final double opacity;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final TextStyle? textStyle;
  final double? letterSpacing;

  const SubHeading2(
    this.text, {
    Key? key,
    this.color = const Color(0xff000000),
    this.height,
    this.fontFamily = "Coolwonder",
    this.textAlign,
    this.fontSize = 18,
    this.opacity = 1.0,
    this.maxLines,
    this.overflow,
    this.fontWeight = FontWeight.w400,
    this.decoration,
    this.textStyle,
    this.fontStyle,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          TextStyle(
            height: height,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: decoration,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
          ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
