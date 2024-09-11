import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class GenericDOB extends StatelessWidget {
  final Color? borderColor,
      focusedBorder,
      fillColor,
      requiredSpanColor,
      labelColor,
      textColor,
      hintColor;
  final TextStyle? textStyle, fieldLabelStyle;
  final String? hintText, errorText, fieldLabel, semantics;
  final Widget? leadingIcon, trailingIcon;
  final TextInputType? textInputType;
  final EdgeInsets? wholePadding;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool? isObscure, enableSuggestion, autoCorrection, filled, onlyRead;
  final InputDecoration? decoration;
  final bool isRequired;
  final bool useBottomPadding;
  final TextStyle? hintStyle;
  final Color? textStyleColor;
  final bool isNumberField;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmit;
  final Function(dynamic)? onChange;
  final Function()? onTap;
  final double? verticalContentPadding;
  final double? borderRadius;
  final int? maxLength;
  final bool? enable;
  final bool? enableInteractiveSelection;
  final bool useUnderLinedInputBorder;
  final bool useZeroPrefixPadding;
  final List<TextInputFormatter> inputFormatters;
  final int? errorMaxLines;
  final TextAlign textAlign;
  final double? spaceBetweenLabelAndField;
  final String? Function(String?)? validator;
  final double? height;

  const GenericDOB({
    super.key,
    this.controller,
    this.hintStyle,
    this.hintText,
    this.borderColor,
    this.isObscure,
    this.labelColor,
    this.verticalContentPadding,
    this.onlyRead,
    this.textColor,
    this.semantics,
    this.hintColor,
    this.cursorColor,
    this.focusNode,
    this.leadingIcon,
    this.textStyleColor,
    this.enableInteractiveSelection,
    this.maxLines,
    this.textInputType,
    this.useBottomPadding = true,
    this.fieldLabel,
    this.useUnderLinedInputBorder = false,
    this.requiredSpanColor,
    this.isRequired = false,
    this.textInputAction,
    this.wholePadding,
    this.textStyle,
    this.decoration,
    this.fillColor,
    this.fieldLabelStyle,
    this.filled,
    this.spaceBetweenLabelAndField,
    this.contentPadding,
    this.focusedBorder,
    this.enableSuggestion,
    this.autoCorrection,
    this.errorText,
    this.errorMaxLines,
    this.trailingIcon,
    this.isNumberField = false,
    this.useZeroPrefixPadding = false,
    this.borderRadius,
    this.maxLength,
    this.enable,
    this.onFieldSubmit,
    this.onTap,
    this.inputFormatters = const [],
    this.textAlign = TextAlign.start,
    this.onChange,
    this.validator,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: GenericDOBMobile(
        borderColor: borderColor,
        focusedBorder: focusedBorder,
        fillColor: fillColor,
        requiredSpanColor: requiredSpanColor,
        labelColor: labelColor,
        textColor: textColor,
        hintColor: hintColor,
        textStyle: textStyle,
        fieldLabelStyle: fieldLabelStyle,
        hintText: hintText,
        errorText: errorText,
        fieldLabel: fieldLabel,
        semantics: semantics,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        textInputType: textInputType,
        wholePadding: wholePadding,
        textInputAction: textInputAction,
        contentPadding: contentPadding,
        cursorColor: cursorColor,
        focusNode: focusNode,
        maxLines: maxLines,
        isObscure: isObscure,
        enableSuggestion: enableSuggestion,
        autoCorrection: autoCorrection,
        filled: filled,
        onlyRead: onlyRead,
        decoration: decoration,
        isRequired: isRequired,
        useBottomPadding: useBottomPadding,
        hintStyle: hintStyle,
        textStyleColor: textStyleColor,
        isNumberField: isNumberField,
        controller: controller,
        onFieldSubmit: onFieldSubmit,
        onChange: onChange,
        onTap: onTap,
        verticalContentPadding: verticalContentPadding,
        borderRadius: borderRadius,
        maxLength: maxLength,
        enable: enable,
        enableInteractiveSelection: enableInteractiveSelection,
        useUnderLinedInputBorder: useUnderLinedInputBorder,
        useZeroPrefixPadding: useZeroPrefixPadding,
        inputFormatters: inputFormatters,
        errorMaxLines: errorMaxLines,
        textAlign: textAlign,
        spaceBetweenLabelAndField: spaceBetweenLabelAndField,
        validator: validator,
        height: height,
      ),
      desktopLayout: GenericDOBDesktop(
        borderColor: borderColor,
        focusedBorder: focusedBorder,
        fillColor: fillColor,
        requiredSpanColor: requiredSpanColor,
        labelColor: labelColor,
        textColor: textColor,
        hintColor: hintColor,
        textStyle: textStyle,
        fieldLabelStyle: fieldLabelStyle,
        hintText: hintText,
        errorText: errorText,
        fieldLabel: fieldLabel,
        semantics: semantics,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        textInputType: textInputType,
        wholePadding: wholePadding,
        textInputAction: textInputAction,
        contentPadding: contentPadding,
        cursorColor: cursorColor,
        focusNode: focusNode,
        maxLines: maxLines,
        isObscure: isObscure,
        enableSuggestion: enableSuggestion,
        autoCorrection: autoCorrection,
        filled: filled,
        onlyRead: onlyRead,
        decoration: decoration,
        isRequired: isRequired,
        useBottomPadding: useBottomPadding,
        hintStyle: hintStyle,
        textStyleColor: textStyleColor,
        isNumberField: isNumberField,
        controller: controller,
        onFieldSubmit: onFieldSubmit,
        onChange: onChange,
        onTap: onTap,
        verticalContentPadding: verticalContentPadding,
        borderRadius: borderRadius,
        maxLength: maxLength,
        enable: enable,
        enableInteractiveSelection: enableInteractiveSelection,
        useUnderLinedInputBorder: useUnderLinedInputBorder,
        useZeroPrefixPadding: useZeroPrefixPadding,
        inputFormatters: inputFormatters,
        errorMaxLines: errorMaxLines,
        textAlign: textAlign,
        spaceBetweenLabelAndField: spaceBetweenLabelAndField,
        validator: validator,
        height: height,
      ),
    );
  }
}

class GenericDOBMobile extends StatelessWidget {
  final Color? borderColor,
      focusedBorder,
      fillColor,
      requiredSpanColor,
      labelColor,
      textColor,
      hintColor;
  final TextStyle? textStyle, fieldLabelStyle;
  final String? hintText, errorText, fieldLabel, semantics;
  final Widget? leadingIcon, trailingIcon;
  final TextInputType? textInputType;
  final EdgeInsets? wholePadding;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool? isObscure, enableSuggestion, autoCorrection, filled, onlyRead;
  final InputDecoration? decoration;
  final bool isRequired;
  final bool useBottomPadding;
  final TextStyle? hintStyle;
  final Color? textStyleColor;
  final bool isNumberField;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmit;
  final Function(dynamic)? onChange;
  final Function()? onTap;
  final double? verticalContentPadding;
  final double? borderRadius;
  final int? maxLength;
  final bool? enable;
  final bool? enableInteractiveSelection;
  final bool useUnderLinedInputBorder;
  final bool useZeroPrefixPadding;
  final List<TextInputFormatter> inputFormatters;
  final int? errorMaxLines;
  final TextAlign textAlign;
  final double? spaceBetweenLabelAndField;
  final String? Function(String?)? validator;
  final double? height;

  const GenericDOBMobile({
    Key? key,
    this.controller,
    this.hintStyle,
    this.hintText,
    this.borderColor,
    this.isObscure,
    this.labelColor,
    this.verticalContentPadding,
    this.onlyRead,
    this.textColor,
    this.semantics,
    this.hintColor,
    this.cursorColor,
    this.focusNode,
    this.leadingIcon,
    this.textStyleColor,
    this.enableInteractiveSelection,
    this.maxLines,
    this.textInputType,
    this.useBottomPadding = true,
    this.fieldLabel,
    this.useUnderLinedInputBorder = false,
    this.requiredSpanColor,
    this.isRequired = false,
    this.textInputAction,
    this.wholePadding,
    this.textStyle,
    this.decoration,
    this.fillColor,
    this.fieldLabelStyle,
    this.filled,
    this.spaceBetweenLabelAndField,
    this.contentPadding,
    this.focusedBorder,
    this.enableSuggestion,
    this.autoCorrection,
    this.errorText,
    this.errorMaxLines,
    this.trailingIcon,
    this.isNumberField = false,
    this.useZeroPrefixPadding = false,
    this.borderRadius,
    this.maxLength,
    this.enable,
    this.onFieldSubmit,
    this.onTap,
    this.inputFormatters = const [],
    this.textAlign = TextAlign.start,
    this.onChange,
    this.validator,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: wholePadding ?? EdgeInsets.symmetric(horizontal: 0.0.h),
      child: SizedBox(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (fieldLabel != null) ...[
              RichText(
                  text: TextSpan(
                      text: fieldLabel,
                      style: fieldLabelStyle ??
                          const TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.red),
                      children: [
                    if (isRequired)
                      const TextSpan(
                        text: "Text",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.red),
                      )
                  ])),
              SizedBox(
                height: spaceBetweenLabelAndField ?? 12.h,
              )
            ],
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                
              ),
              child: const Row(
                children: [
                  Text("dshjdsdakjdhakdsds"),
                ],
              ),
            ),
            TextFormField(
              onChanged: onChange,
              controller: controller,
              readOnly: onlyRead ?? false,
              cursorColor: cursorColor ?? R.palette.appHeadingTextBlackColor,
              cursorWidth: 1.5,
              textAlignVertical: TextAlignVertical.center,
              cursorHeight: 20.h,
              obscureText: isObscure ?? false,
              maxLines: maxLines ?? 1,
              enabled: enable ?? true,
              maxLength: maxLength,
              textAlign: textAlign,
              style: textStyle ??
                  TextStyle(
                    fontSize: 14.sp,
                    fontFamily: R.theme.interRegular,
                    fontWeight: FontWeight.w400,
                    color: textColor ?? R.palette.textFieldHintGreyColor,
                  ),
              enableSuggestions: enableSuggestion ?? true,
              keyboardType: isNumberField ? TextInputType.phone : textInputType,
              onTap: onTap,
              autocorrect: autoCorrection ?? true,
              enableInteractiveSelection: enableInteractiveSelection,
              focusNode: focusNode,
              onFieldSubmitted: onFieldSubmit,
              decoration: decoration ??
                  InputDecoration(
                    isDense: true,
                    errorStyle: const TextStyle(
                      color: Colors.red, // or any other color
                    ),
                    counterText: "",
                    disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 0,
                        )),
                    contentPadding: contentPadding ??
                        ((maxLines == null)
                            ? EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: verticalContentPadding?.h ?? 15.h)
                            : EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 15.h)),
                    hintText: hintText ?? '',
                    hintMaxLines: 1,
                    filled: filled,
                    fillColor: fillColor,
                    hintStyle: hintStyle ??
                        TextStyle(
                            fontSize: 14.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            color:
                                hintColor ?? R.palette.textFieldHintGreyColor),
                    errorText: errorText,
                    errorMaxLines: errorMaxLines,
                    border: useUnderLinedInputBorder
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: borderColor ??
                                    fillColor ??
                                    R.palette.appHeadingTextBlackColor))
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                                color: borderColor ?? fillColor ?? Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                    enabledBorder: useUnderLinedInputBorder
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    borderColor ?? fillColor ?? Colors.green))
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                                color: borderColor ??
                                    fillColor ??
                                    R.palette.textFieldBorderGreyColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                    focusedBorder: useUnderLinedInputBorder
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    borderColor ?? fillColor ?? Colors.green))
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                                color: focusedBorder ??
                                    fillColor ??
                                    borderColor ??
                                    R.palette.textFieldBorderGreyColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                    suffixIcon: trailingIcon != null
                        ? Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 13.w, start: 5.w),
                            child: trailingIcon,
                          )
                        : null,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: useZeroPrefixPadding ? 0.w : 23.w,
                        end: useZeroPrefixPadding ? 5.w : 0.w,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (leadingIcon != null) ...[
                            leadingIcon!,
                            SizedBox(
                              width: 5.w,
                            ),
                          ],
                        ],
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      minHeight: 0.h,
                      minWidth: 0.h,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: 0.h,
                      minWidth: 0.h,
                    ),
                  ),
              inputFormatters: inputFormatters,
              validator: validator,
            ),
            if (useBottomPadding)
              SizedBox(
                height: 20.h,
              )
          ],
        ),
      ),
    );
  }
}

class GenericDOBDesktop extends StatelessWidget {
  final Color? borderColor,
      focusedBorder,
      fillColor,
      requiredSpanColor,
      labelColor,
      textColor,
      hintColor;
  final TextStyle? textStyle, fieldLabelStyle;
  final String? hintText, errorText, fieldLabel, semantics;
  final Widget? leadingIcon, trailingIcon;
  final TextInputType? textInputType;
  final EdgeInsets? wholePadding;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool? isObscure, enableSuggestion, autoCorrection, filled, onlyRead;
  final InputDecoration? decoration;
  final bool isRequired;
  final bool useBottomPadding;
  final TextStyle? hintStyle;
  final Color? textStyleColor;
  final bool isNumberField;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmit;
  final Function(dynamic)? onChange;
  final Function()? onTap;
  final double? verticalContentPadding;
  final double? borderRadius;
  final int? maxLength;
  final bool? enable;
  final bool? enableInteractiveSelection;
  final bool useUnderLinedInputBorder;
  final bool useZeroPrefixPadding;
  final List<TextInputFormatter> inputFormatters;
  final int? errorMaxLines;
  final TextAlign textAlign;
  final double? spaceBetweenLabelAndField;
  final String? Function(String?)? validator;
  final double? height;

  const GenericDOBDesktop({
    Key? key,
    this.controller,
    this.hintStyle,
    this.hintText,
    this.borderColor,
    this.isObscure,
    this.labelColor,
    this.verticalContentPadding,
    this.onlyRead,
    this.textColor,
    this.semantics,
    this.hintColor,
    this.cursorColor,
    this.focusNode,
    this.leadingIcon,
    this.textStyleColor,
    this.enableInteractiveSelection,
    this.maxLines,
    this.textInputType,
    this.useBottomPadding = true,
    this.fieldLabel,
    this.useUnderLinedInputBorder = false,
    this.requiredSpanColor,
    this.isRequired = false,
    this.textInputAction,
    this.wholePadding,
    this.textStyle,
    this.decoration,
    this.fillColor,
    this.fieldLabelStyle,
    this.filled,
    this.spaceBetweenLabelAndField,
    this.contentPadding,
    this.focusedBorder,
    this.enableSuggestion,
    this.autoCorrection,
    this.errorText,
    this.errorMaxLines,
    this.trailingIcon,
    this.isNumberField = false,
    this.useZeroPrefixPadding = false,
    this.borderRadius,
    this.maxLength,
    this.enable,
    this.onFieldSubmit,
    this.onTap,
    this.inputFormatters = const [],
    this.textAlign = TextAlign.start,
    this.onChange,
    this.validator,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: wholePadding ?? EdgeInsets.symmetric(horizontal: 0.0.h),
      child: SizedBox(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (fieldLabel != null) ...[
              RichText(
                  text: TextSpan(
                      text: fieldLabel,
                      style: fieldLabelStyle ??
                          const TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.red),
                      children: [
                    if (isRequired)
                      const TextSpan(
                        text: "Text",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.red),
                      )
                  ])),
              SizedBox(
                height: spaceBetweenLabelAndField ?? 12.h,
              )
            ],
            TextFormField(
              onChanged: onChange,
              controller: controller,
              readOnly: onlyRead ?? false,
              cursorColor: cursorColor ?? R.palette.appHeadingTextBlackColor,
              cursorWidth: 1.5,
              textAlignVertical: TextAlignVertical.center,
              cursorHeight: 20.h,
              obscureText: isObscure ?? false,
              maxLines: maxLines ?? 1,
              enabled: enable ?? true,
              maxLength: maxLength,
              textAlign: textAlign,
              style: textStyle ??
                  TextStyle(
                    fontSize: 14.sp,
                    fontFamily: R.theme.interRegular,
                    fontWeight: FontWeight.w400,
                    color: textColor ?? R.palette.textFieldHintGreyColor,
                  ),
              enableSuggestions: enableSuggestion ?? true,
              keyboardType: isNumberField ? TextInputType.phone : textInputType,
              onTap: onTap,
              autocorrect: autoCorrection ?? true,
              enableInteractiveSelection: enableInteractiveSelection,
              focusNode: focusNode,
              onFieldSubmitted: onFieldSubmit,
              decoration: decoration ??
                  InputDecoration(
                    isDense: true,
                    errorStyle: const TextStyle(
                      color: Colors.red, // or any other color
                    ),
                    counterText: "",
                    disabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 0,
                        )),
                    // contentPadding: contentPadding ??
                    //     ((maxLines == null)
                    //         ? EdgeInsets.symmetric(
                    //             horizontal: 5.w,
                    //             vertical: verticalContentPadding?.h ?? 15.h)
                    //         : EdgeInsets.symmetric(
                    //             horizontal: 5.w, vertical: 15.h)),
                    contentPadding: contentPadding ??
                        ((maxLines == null)
                            ? EdgeInsets.only(
                                right: 5.w,
                                top: verticalContentPadding?.h ?? 15.h,
                                bottom: verticalContentPadding?.h ?? 15.h)
                            : EdgeInsets.only(
                                right: 5.w,
                                top: verticalContentPadding?.h ?? 15.h,
                                bottom: 15.h)),
                    // prefix: const Padding(padding: EdgeInsets.only(left: 20.0)),

                    hintText: hintText ?? '',
                    hintMaxLines: 1,
                    filled: filled,
                    fillColor: fillColor,
                    hintStyle: hintStyle ??
                        TextStyle(
                            fontSize: 14.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            color:
                                hintColor ?? R.palette.textFieldHintGreyColor),
                    errorText: errorText,
                    errorMaxLines: errorMaxLines,
                    border: useUnderLinedInputBorder
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: borderColor ??
                                    fillColor ??
                                    R.palette.appHeadingTextBlackColor))
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                                color: borderColor ?? fillColor ?? Colors.red),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                    enabledBorder: useUnderLinedInputBorder
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    borderColor ?? fillColor ?? Colors.green))
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                                color: borderColor ??
                                    fillColor ??
                                    R.palette.textFieldBorderGreyColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                    focusedBorder: useUnderLinedInputBorder
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    borderColor ?? fillColor ?? Colors.green))
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                                color: focusedBorder ??
                                    fillColor ??
                                    borderColor ??
                                    R.palette.textFieldBorderGreyColor),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                    suffixIcon: trailingIcon != null
                        ? Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 5.w, start: 5.w),
                            child: trailingIcon,
                          )
                        : null,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 0.w,
                        end: 5.w,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (leadingIcon != null) ...[
                            leadingIcon!,
                            SizedBox(
                              width: 5.w,
                            ),
                          ],
                        ],
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      minHeight: 0.h,
                      minWidth: 0.h,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: 0.h,
                      minWidth: 0.h,
                    ),
                  ),
              inputFormatters: inputFormatters,
              validator: validator,
            ),
            if (useBottomPadding)
              SizedBox(
                height: 20.h,
              )
          ],
        ),
      ),
    );
  }
}
