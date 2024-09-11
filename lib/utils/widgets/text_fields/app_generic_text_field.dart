import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class AppGenericTextField extends StatelessWidget {
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
  final BorderRadius? borderRadius;
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
  final double? width;
  final VoidCallback? onPressTrailingIcon;

  const AppGenericTextField({
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
    this.width,
    this.onPressTrailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: AppGenericTextFieldMobile(
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
        width: width,
      ),
      desktopLayout: AppGenericTextFieldDesktop(
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
        width: width,
        onPressTrailingIcon: onPressTrailingIcon,
      ),
    );
  }
}

class AppGenericTextFieldMobile extends StatelessWidget {
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
  final BorderRadius? borderRadius;
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
  final double? width;

  const AppGenericTextFieldMobile({
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
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: wholePadding ?? EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        height: height,
        width: width,
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
                height: spaceBetweenLabelAndField ?? 12,
              )
            ],
            TextFormField(
              onChanged: onChange,
              controller: controller,
              readOnly: onlyRead ?? false,
              cursorColor: cursorColor ?? R.palette.appHeadingTextBlackColor,
              cursorWidth: 1.5,
              textAlignVertical: TextAlignVertical.center,
              cursorHeight: 15,
              obscureText: isObscure ?? false,
              maxLines: maxLines ?? 1,
              enabled: enable ?? true,
              maxLength: maxLength,
              textAlign: textAlign,
              style: textStyle ??
                  TextStyle(
                    fontSize: 14,
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
                    errorStyle: TextStyle(
                      color: Colors.red, // or any other color
                      fontSize: 15,
                      fontFamily: R.theme.interRegular,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                    counterText: "",
                    disabledBorder: UnderlineInputBorder(
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 0,
                        )),
                    contentPadding: contentPadding ??
                        ((maxLines == null)
                            ? EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: verticalContentPadding ?? 15)
                            : EdgeInsets.symmetric(
                                horizontal: 5, vertical: 15)),
                    hintText: hintText ?? '',
                    hintMaxLines: 1,
                    filled: filled,
                    fillColor: fillColor,
                    hintStyle: hintStyle ??
                        TextStyle(
                            fontSize: 15,
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
                            borderRadius:
                                borderRadius ?? BorderRadius.circular(10),
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
                            borderRadius:
                                borderRadius ?? BorderRadius.circular(10),
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
                            borderRadius:
                                borderRadius ?? BorderRadius.circular(10),
                          ),
                    suffixIcon: trailingIcon != null
                        ? Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 13, start: 5),
                            child: trailingIcon,
                          )
                        : null,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: useZeroPrefixPadding ? 0 : 15,
                        end: useZeroPrefixPadding ? 5 : 0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (leadingIcon != null) ...[
                            leadingIcon!,
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ],
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      minHeight: 0,
                      minWidth: 0,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: 0,
                      minWidth: 0,
                    ),
                  ),
              inputFormatters: inputFormatters,
              validator: validator,
            ),
            if (useBottomPadding)
              SizedBox(
                height: 20,
              )
          ],
        ),
      ),
    );
  }
}

class AppGenericTextFieldDesktop extends StatelessWidget {
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
  final BorderRadius? borderRadius;
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
  final double? width;
  final VoidCallback? onPressTrailingIcon;

  const AppGenericTextFieldDesktop({
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
    this.width,
    this.onPressTrailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: wholePadding ?? EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        height: height,
        width: width,
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
                height: spaceBetweenLabelAndField ?? 12,
              )
            ],
            TextFormField(
              onChanged: onChange,
              controller: controller,
              readOnly: onlyRead ?? false,
              cursorColor: cursorColor ?? R.palette.appHeadingTextBlackColor,
              cursorWidth: 1.5,
              textAlignVertical: TextAlignVertical.center,
              cursorHeight: 15,
              obscureText: isObscure ?? false,
              maxLines: maxLines ?? 1,
              enabled: enable ?? true,
              maxLength: maxLength,
              textAlign: textAlign,
              style: textStyle ??
                  TextStyle(
                    fontSize: 14,
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
                    errorStyle: TextStyle(
                      color: Colors.red, // or any othe
                      fontSize: 15,
                      fontFamily: R.theme.interRegular,
                      fontWeight: FontWeight.w500,
                      height: 1.4, // r color
                    ),
                    counterText: "",
                    disabledBorder: UnderlineInputBorder(
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 0,
                        )),
                    contentPadding: contentPadding ??
                        ((maxLines == null)
                            ? EdgeInsets.only(
                                right: 15,
                                left: 15,
                                top: verticalContentPadding ?? 15,
                                bottom: verticalContentPadding ?? 15)
                            : EdgeInsets.only(
                                right: 15,
                                left: 15,
                                top: verticalContentPadding ?? 15,
                                bottom: 15)),
                    hintText: hintText ?? '',
                    hintMaxLines: 1,
                    filled: filled,
                    fillColor: fillColor,
                    hintStyle: hintStyle ??
                        TextStyle(
                            fontSize: 15,
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
                            borderRadius:
                                borderRadius ?? BorderRadius.circular(10),
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
                            borderRadius:
                                borderRadius ?? BorderRadius.circular(10),
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
                            borderRadius:
                                borderRadius ?? BorderRadius.circular(10),
                          ),
                    suffixIcon: trailingIcon != null
                        ? Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: 15, start: 15),
                            child: trailingIcon,
                          )
                        : null,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: useZeroPrefixPadding ? 0 : 15,
                        end: useZeroPrefixPadding ? 15 : 0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (leadingIcon != null) ...[
                            leadingIcon!,
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ],
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      minHeight: 0,
                      minWidth: 0,
                    ),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: 0,
                      minWidth: 0,
                    ),
                  ),
              inputFormatters: inputFormatters,
              validator: validator,
            ),
            if (useBottomPadding)
              SizedBox(
                height: 20,
              )
          ],
        ),
      ),
    );
  }
}
