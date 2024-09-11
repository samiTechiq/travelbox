import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';

typedef OnDropDownItemChanged<T> = Function(T);
typedef MapDropDownText<T> = Widget Function(T);

class GenericDropDown<T> extends StatelessWidget {
  final OnDropDownItemChanged<T?> onDropDownItemChanged;
  final MapDropDownText<T> mapDropDownText;
  final List<T> items;
  final T? value;
  final Widget? icon;
  final Color? iconColor;
  final Color? dropDownColor;
  final String? hintText;
  final String? dropdownLabel;
  final Color? dropdownLabelColor;
  final TextStyle? hintTextStyle;
  final TextStyle? dropdownLabelStyle;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? hintColor;
  final bool isRequired;
  final bool useTransparentBorder;
  final bool useBottomPadding;
  final InputDecoration? decoration;
  final EdgeInsets? contentPadding;
  final bool filled;
  final Color? fillColor;
  final Widget? leading;
  final Color? dropdownPopupBgColor;
  final double? paddingBetweenLabelAndDropdown;
  final double? widthButtonStyleData;
  final Color? borderColor;
  final Color? hoverColor;
  final Widget? hint;

  const GenericDropDown({
    Key? key,
    required this.items,
    required this.mapDropDownText,
    required this.onDropDownItemChanged,
    this.contentPadding,
    this.value,
    this.dropDownColor,
    this.dropdownLabel,
    this.dropdownLabelStyle,
    this.dropdownLabelColor,
    this.hint,
    this.hintText,
    this.hintTextStyle,
    this.textStyle,
    this.textColor,
    this.leading,
    this.hintColor,
    this.dropdownPopupBgColor,
    this.paddingBetweenLabelAndDropdown,
    this.fillColor,
    this.filled = true,
    this.useBottomPadding = true,
    this.useTransparentBorder = false,
    this.isRequired = false,
    this.icon,
    this.iconColor,
    this.decoration,
    this.widthButtonStyleData,
    this.borderColor,
    this.hoverColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        decoration: BoxDecoration(
          color: borderColor ?? R.palette.white,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          border: Border.all(color: borderColor ?? R.palette.white),
        ),
        child: DropdownButton2<T>(
          isDense: true,
          isExpanded: true,
          hint: hint ??
              Text(
                hintText ?? '',
                style: hintTextStyle ??
                    TextStyle(
                      fontFamily: R.theme.interRegular,
                      fontSize: 5.sp,
                      color: R.palette.mediumBlack,
                      fontWeight: FontWeight.w400,
                    ),
              ),
          style: textStyle ??
              TextStyle(
                fontFamily: R.theme.interRegular,
                color: R.palette.textFieldHintGreyColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
          menuItemStyleData: MenuItemStyleData(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.hovered)) {
                  return hoverColor ?? R.palette.lightGreen;
                }
                if (states.contains(WidgetState.focused) ||
                    states.contains(WidgetState.pressed)) {
                  return hoverColor ?? R.palette.lightGreen;
                }
                return null;
              },
            ),
          ),
          buttonStyleData: ButtonStyleData(
            height: 50.h,
            padding: EdgeInsets.only(right: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.r,
              ),
              color: fillColor ?? R.palette.textFieldBorderGreyColor,
            ),
            elevation: 0,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10.r,
              ),
            ),
            //elevation: 0,
          ),
          alignment: AlignmentDirectional.centerStart,
          value: (value != null)
              ? value
              : (hintText == null)
                  ? items.first
                  : null,
          items: items
              .map((e) => DropdownMenuItem<T>(
                    value: e,
                    child: mapDropDownText(e),
                  ))
              .toList(),
          onChanged: (value) {
            onDropDownItemChanged(value);
          },
          iconStyleData: IconStyleData(
            icon: icon ??
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: iconColor ?? R.palette.textFieldHintGreyColor,
                ),
          ),
        ),
      ),
    );
  }
}
