import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class GenericButton extends StatelessWidget {
  final double? width, height, radius, textSize;
  final Color? color, textColor;
  final EdgeInsets? margin, padding;
  final VoidCallback onPressed;
  final String? text;
  final FontWeight fontWeightT;
  final String? semantics;
  final bool enableShadow;
  final Widget? child;
  final Color? buttonTextColor;
  final double fontSize;
  final bool enableMarquee;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Widget? leading;
  final bool isEnable;
  final bool allowClickWhenDisabled;
  final String? fontFamily;
  final bool? isScaleFontSize;

  const GenericButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.height,
    this.allowClickWhenDisabled = false,
    this.enableShadow = false,
    this.width,
    this.textSize,
    this.color,
    this.textColor,
    this.semantics,
    this.fontWeightT = FontWeight.w600,
    this.fontSize = 18,
    this.radius,
    this.margin,
    this.padding,
    this.buttonTextColor,
    this.borderColor,
    this.textStyle,
    this.borderRadius,
    this.leading,
    this.child,
    this.enableMarquee = false,
    this.isEnable = true,
    this.fontFamily,
    this.isScaleFontSize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          key: const ValueKey("button_container"),
          onTap: allowClickWhenDisabled
              ? onPressed
              : isEnable
                  ? onPressed
                  : null,
          child: Semantics(
            value: semantics,
            button: true,
            child: Container(
              margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
              width: width?.w ?? 378.w,
              height: height?.h ?? 65.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: R.palette.appPrimaryBlue.withOpacity(0.3),
                      blurRadius: enableShadow ? 10.0 : 0.0,
                      // soften the shadow
                      spreadRadius: enableShadow ? 1.0 : 0.0,
                      //extend the shadow
                      offset: Offset(
                        enableShadow ? 0.2 : 0.0,
                        // Move to right 5  horizontally
                        enableShadow ? 0.1 : 0.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                  borderRadius:
                      borderRadius ?? BorderRadius.circular(radius ?? 10),
                  color: !isEnable
                      ? R.palette.boxGreyColor
                      : color ?? R.palette.appPrimaryBlue),
              child: Center(
                child: Padding(
                  padding:
                      padding ?? const EdgeInsets.symmetric(horizontal: 10),
                  child: child ??
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          leading ?? Container(),
                          SizedBox(
                            width: leading != null ? 10 : 0,
                          ),
                          Expanded(
                            child: SubHeading2(
                              text ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              fontSize: fontSize,
                              fontWeight: fontWeightT,
                              color: !isEnable
                                  ? R.palette.appGreyTextColor
                                  : buttonTextColor ?? R.palette.white,
                              fontFamily: fontFamily,
                            ),
                          ),
                        ],
                      ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class OutlineButton extends StatelessWidget {
  final double? width, height, radius, textSize;
  final Color? color, textColor;
  final EdgeInsets? margin, padding;
  final VoidCallback onPressed;
  final String? text;
  final FontWeight fontWeightT;
  final String? semantics;
  final bool enableShadow;
  final Widget? child;
  final Color? buttonTextColor;
  final double fontSize;
  final bool enableMarquee;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Widget? leading;
  final bool isEnable;
  final bool allowClickWhenDisabled;
  final String? fontFamily;
  final bool? isScaleFontSize;

  const OutlineButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.height,
    this.allowClickWhenDisabled = false,
    this.enableShadow = false,
    this.width,
    this.textSize,
    this.color,
    this.textColor,
    this.semantics,
    this.fontWeightT = FontWeight.w600,
    this.fontSize = 18,
    this.radius,
    this.margin,
    this.padding,
    this.buttonTextColor,
    this.borderColor,
    this.textStyle,
    this.borderRadius,
    this.leading,
    this.child,
    this.enableMarquee = false,
    this.isEnable = true,
    this.fontFamily,
    this.isScaleFontSize = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          key: const ValueKey("outline_button_container"),
          onTap: allowClickWhenDisabled
              ? onPressed
              : isEnable
                  ? onPressed
                  : null,
          child: Semantics(
            value: semantics,
            button: true,
            child: Container(
              margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
              width: width?.w ?? 378.w,
              height: height?.h ?? 65.h,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: !isEnable
                        ? R.palette.boxGreyColor
                        : borderColor ?? R.palette.appPrimaryBlue),
                borderRadius:
                    borderRadius ?? BorderRadius.circular(radius ?? 10),
                color: color ?? Colors.white,
              ),
              child: Center(
                child: Padding(
                  padding:
                      padding ?? const EdgeInsets.symmetric(horizontal: 10),
                  child: child ??
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          leading ?? Container(),
                          SizedBox(
                            width: leading != null ? 10 : 0,
                          ),
                          Expanded(
                            child: SubHeading2(
                              text ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              fontSize: fontSize,
                              fontWeight: fontWeightT,
                              color: !isEnable
                                  ? R.palette.appGreyTextColor
                                  : buttonTextColor ?? R.palette.appPrimaryBlue,
                              fontFamily: fontFamily,
                            ),
                          ),
                        ],
                      ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

///
enum AppButtonStyle { generic, outline }

class AppButton extends StatelessWidget {
  final AppButtonStyle buttonStyle;
  final double? width, height, radius, textSize;
  final Color? color, textColor;
  final EdgeInsets? margin, padding;
  final VoidCallback onPressed;
  final String? text;
  final FontWeight fontWeightT;
  final String? semantics;
  final bool enableShadow;
  final Widget? child;
  final Color? buttonTextColor;
  final double fontSize;
  final bool enableMarquee;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Widget? leading;
  final bool isEnable;
  final bool allowClickWhenDisabled;
  final String? fontFamily;
  final bool? isScaleFontSize;

  const AppButton({
    super.key,
    required this.buttonStyle,
    this.text,
    required this.onPressed,
    this.height,
    this.allowClickWhenDisabled = false,
    this.enableShadow = false,
    this.width,
    this.textSize,
    this.color,
    this.textColor,
    this.semantics,
    this.fontWeightT = FontWeight.w600,
    this.fontSize = 18,
    this.radius,
    this.margin,
    this.padding,
    this.buttonTextColor,
    this.borderColor,
    this.textStyle,
    this.borderRadius,
    this.leading,
    this.child,
    this.enableMarquee = false,
    this.isEnable = true,
    this.fontFamily,
    this.isScaleFontSize = false,
  });

  factory AppButton.generic({
    double? width,
    double? height,
    double? radius,
    double? textSize,
    Color? color,
    Color? textColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    required VoidCallback onPressed,
    String? text,
    FontWeight fontWeightT = FontWeight.w600,
    String? semantics,
    bool enableShadow = false,
    Widget? child,
    Color? buttonTextColor,
    double fontSize = 18,
    bool enableMarquee = false,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    Color? borderColor,
    Widget? leading,
    bool isEnable = true,
    bool allowClickWhenDisabled = false,
    String? fontFamily,
    bool? isScaleFontSize,
  }) =>
      AppButton(
        buttonStyle: AppButtonStyle.generic,
        onPressed: onPressed,
        height: height,
        width: width,
        allowClickWhenDisabled: allowClickWhenDisabled,
        enableShadow: enableShadow,
        textSize: textSize,
        color: color,
        textColor: textColor,
        semantics: semantics,
        fontWeightT: fontWeightT,
        fontSize: fontSize,
        radius: radius,
        margin: margin,
        padding: padding,
        buttonTextColor: buttonTextColor,
        borderColor: borderColor,
        textStyle: textStyle,
        borderRadius: borderRadius,
        leading: leading,
        enableMarquee: enableMarquee,
        isEnable: isEnable,
        fontFamily: fontFamily,
        isScaleFontSize: isScaleFontSize,
        text: text,
        child: child,
      );

  factory AppButton.outline({
    double? width,
    double? height,
    double? radius,
    double? textSize,
    Color? color,
    Color? textColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    required VoidCallback onPressed,
    String? text,
    FontWeight fontWeightT = FontWeight.w600,
    String? semantics,
    bool enableShadow = false,
    Widget? child,
    Color? buttonTextColor,
    double fontSize = 18,
    bool enableMarquee = false,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    Color? borderColor,
    Widget? leading,
    bool isEnable = true,
    bool allowClickWhenDisabled = false,
    String? fontFamily,
    bool? isScaleFontSize,
  }) =>
      AppButton(
        buttonStyle: AppButtonStyle.outline,
        onPressed: onPressed,
        height: height,
        width: width,
        allowClickWhenDisabled: allowClickWhenDisabled,
        enableShadow: enableShadow,
        textSize: textSize,
        color: color,
        textColor: textColor,
        semantics: semantics,
        fontWeightT: fontWeightT,
        fontSize: fontSize,
        radius: radius,
        margin: margin,
        padding: padding,
        buttonTextColor: buttonTextColor,
        borderColor: borderColor,
        textStyle: textStyle,
        borderRadius: borderRadius,
        leading: leading,
        enableMarquee: enableMarquee,
        isEnable: isEnable,
        fontFamily: fontFamily,
        isScaleFontSize: isScaleFontSize,
        text: text,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    switch (buttonStyle) {
      case AppButtonStyle.generic:
        return LayoutBuilder(
          builder: (context, constraints) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                key: const ValueKey("button_container"),
                onTap: allowClickWhenDisabled
                    ? onPressed
                    : isEnable
                        ? onPressed
                        : null,
                child: Semantics(
                  value: semantics,
                  button: true,
                  child: Container(
                    margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
                    width: width ?? 378,
                    height: height ?? 65,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: R.palette.appPrimaryBlue.withOpacity(0.3),
                            blurRadius: enableShadow ? 10.0 : 0.0,
                            // soften the shadow
                            spreadRadius: enableShadow ? 1.0 : 0.0,
                            //extend the shadow
                            offset: Offset(
                              enableShadow ? 0.2 : 0.0,
                              // Move to right 5  horizontally
                              enableShadow
                                  ? 0.1
                                  : 0.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(radius ?? 10),
                        color: !isEnable
                            ? R.palette.boxGreyColor
                            : color ?? R.palette.appPrimaryBlue),
                    child: Center(
                      child: Padding(
                        padding: padding ??
                            const EdgeInsets.symmetric(horizontal: 10),
                        child: child ??
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                leading ?? Container(),
                                SizedBox(
                                  width: leading != null ? 10 : 0,
                                ),
                                Expanded(
                                  child: SubHeading2(
                                    text ?? "",
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    fontSize: fontSize,
                                    fontWeight: fontWeightT,
                                    color: !isEnable
                                        ? R.palette.appGreyTextColor
                                        : buttonTextColor ?? R.palette.white,
                                    fontFamily: fontFamily,
                                  ),
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
      case AppButtonStyle.outline:
        return LayoutBuilder(
          builder: (context, constraints) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                key: const ValueKey("outline_button_container"),
                onTap: allowClickWhenDisabled
                    ? onPressed
                    : isEnable
                        ? onPressed
                        : null,
                child: Semantics(
                  value: semantics,
                  button: true,
                  child: Container(
                    margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
                    width: width ?? 378,
                    height: height ?? 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: !isEnable
                              ? R.palette.boxGreyColor
                              : borderColor ?? R.palette.appPrimaryBlue),
                      borderRadius:
                          borderRadius ?? BorderRadius.circular(radius ?? 10),
                      color: color ?? Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: padding ??
                            const EdgeInsets.symmetric(horizontal: 10),
                        child: child ??
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                leading ?? Container(),
                                SizedBox(
                                  width: leading != null ? 10 : 0,
                                ),
                                Expanded(
                                  child: SubHeading2(
                                    text ?? "",
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    fontSize: fontSize,
                                    fontWeight: fontWeightT,
                                    color: !isEnable
                                        ? R.palette.appGreyTextColor
                                        : buttonTextColor ??
                                            R.palette.appPrimaryBlue,
                                    fontFamily: fontFamily,
                                  ),
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
  }
}
