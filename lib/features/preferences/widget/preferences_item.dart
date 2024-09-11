import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/viewmodel/generic_dropdown_item.dart';
import 'package:travelbox/features/cover_quote/model/country_data.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/drop_down/app_dropdown.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class PreferencesItem extends StatelessWidget {
  final String flag;
  final String title;
  final String titleDropdown;
  final bool isCurrency;
  final List<CountryData> data;
  final void Function(String) function;

  const PreferencesItem({
    super.key,
    required this.flag,
    required this.data,
    required this.title,
    required this.titleDropdown,
    required this.isCurrency,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: PreferencesItemMobile(
        flag: flag,
        data: data,
        title: title,
        isCurrency: isCurrency,
        function: function,
        titleDropdown: titleDropdown,
      ),
      desktopLayout: PreferencesItemDesktop(
        flag: flag,
        data: data,
        title: title,
        isCurrency: isCurrency,
        function: function,
        titleDropdown: titleDropdown,
      ),
    );
  }
}

class PreferencesItemMobile extends StatelessWidget {
  final String flag;
  final String title;
  final String titleDropdown;
  final bool isCurrency;
  final List<CountryData> data;
  final void Function(String) function;

  const PreferencesItemMobile({
    super.key,
    required this.flag,
    required this.data,
    required this.title,
    required this.titleDropdown,
    required this.isCurrency,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        SubHeading(
          title,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: R.palette.lightGray,
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 50.h,
          child: GenericDropDown<Widget>(
            borderColor: R.palette.textFieldBorderGreyColor,
            hintColor: R.palette.mediumBlack,
            fillColor: R.palette.appWhiteColor,
            hintText: '',
            hint: Row(
              children: [
                CircleFlag(
                  flag,
                  size: 22,
                ),
                SizedBox(
                  width: 15.w,
                ),
                SubHeading(
                  titleDropdown,
                  fontSize: 15,
                  color: R.palette.mediumBlack,
                ),
              ],
            ),
            dropDownColor: R.palette.white,
            textColor: R.palette.appPrimaryBlue,
            iconColor: R.palette.textFieldHintGreyColor,
            items: data.asMap().entries.map((entry) {
              return GenericDropdownItem(
                flag: entry.value.flag,
                name: isCurrency
                    ? (entry.value.currency ?? '')
                    : entry.value.name,
                code: entry.value.code,
              );
            }).toList(),
            textStyle: TextStyle(
              fontFamily: R.theme.interRegular,
              color: R.palette.mediumBlack,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            mapDropDownText: (value) {
              if (value is GenericDropdownItem) {
                return GenericDropdownItem(
                  flag: value.flag,
                  name: value.name,
                  trailing: flag == value.flag
                      ? SvgPicture.asset(
                          R.assets.graphics.checked.path,
                          height: 24.h,
                        )
                      : null,
                  code: value.code,
                );
              }
              return const SizedBox();
            },
            onDropDownItemChanged: (value) {
              if (value is GenericDropdownItem) {
                function(value.code);
              }
            },
          ),
        ),
      ],
    );
  }
}

class PreferencesItemDesktop extends StatelessWidget {
  final String flag;
  final String title;
  final String titleDropdown;
  final bool isCurrency;
  final List<CountryData> data;
  final void Function(String) function;

  const PreferencesItemDesktop({
    super.key,
    required this.flag,
    required this.data,
    required this.title,
    required this.titleDropdown,
    required this.function,
    required this.isCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 35.h),
        SubHeading(
          title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: R.palette.mediumBlack,
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 47.h,
          child: GenericDropDown<Widget>(
            borderColor: R.palette.textFieldBorderGreyColor,
            hintColor: R.palette.mediumBlack,
            fillColor: R.palette.appWhiteColor,
            hint: Row(
              children: [
                CircleFlag(
                  flag,
                  size: 22,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(titleDropdown),
              ],
            ),
            hintText: '',
            dropDownColor: R.palette.white,
            textColor: R.palette.appPrimaryBlue,
            iconColor: R.palette.textFieldHintGreyColor,
            items: data.asMap().entries.map((entry) {
              return GenericDropdownItem(
                flag: entry.value.flag,
                name: isCurrency
                    ? (entry.value.currency ?? '')
                    : entry.value.name,
                code: entry.value.code,
              );
            }).toList(),
            textStyle: TextStyle(
              fontFamily: R.theme.interRegular,
              color: R.palette.mediumBlack,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            mapDropDownText: (value) {
              return ListTile(
                title: value,
              );
            },
            onDropDownItemChanged: (value) {
              if (value is GenericDropdownItem) {
                function(value.code);
              }
            },
          ),
        ),
      ],
    );
  }
}
