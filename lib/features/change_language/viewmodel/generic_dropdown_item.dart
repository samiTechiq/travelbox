import 'package:circle_flags/circle_flags.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/viewmodel/change_language_viewmodel.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class GenericDropdownItem extends StatelessWidget {
  final String flag;
  final String name;
  final Widget? trailing;
  final String code;

  const GenericDropdownItem({
    super.key,
    required this.flag,
    required this.name,
    required this.code,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: GenericDropdownItemMobile(
        flag: flag,
        name: name,
        trailing: trailing,
        code: code,
      ),
      desktopLayout: GenericDropdownItemDesktop(
        flag: flag,
        name: name,
        trailing: trailing,
        code: code,
      ),
    );
  }
}

class GenericDropdownItemMobile extends StatelessWidget {
  final String flag;
  final String name;
  final Widget? trailing;
  final String code;

  const GenericDropdownItemMobile({
    super.key,
    required this.flag,
    required this.name,
    this.trailing,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChangeLanguageViewModel>();
    return Row(
      children: [
        // Text(
        //   textAlign: TextAlign.center,
        //   flag,
        //   style: TextStyle(fontSize: 31.sp),
        // ),
        CircleFlag(
          code,
          size: 25.w,
        ),
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(16.0.r),
        //   child: Image.asset(
        //     'assets/flags/us.png',
        //     package: 'intl_phone_field',
        //     width: kIsWeb ? 26 : 21.w,
        //     height: kIsWeb ? 26 : 21.w,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        SizedBox(width: 10.w),
        Text(
          name,
          style: TextStyle(fontSize: 14.sp),
        ),
        SizedBox(
          width: 15.w,
        ),
        trailing != null
            ? trailing!
            : viewModel.selectedFlag == flag
                ? SvgPicture.asset(
                    R.assets.graphics.checked.path,
                    height: 22.h,
                  )
                : const SizedBox(),
      ],
    );
  }
}

class GenericDropdownItemDesktop extends StatelessWidget {
  final String flag;
  final String name;
  final Widget? trailing;
  final String code;

  const GenericDropdownItemDesktop({
    super.key,
    required this.flag,
    required this.name,
    required this.code,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ChangeLanguageViewModel>();
    return Row(
      children: [
        // Text(
        //   textAlign: TextAlign.center,
        //   flag,
        //   style: TextStyle(fontSize: 8.sp),
        // ),
        CountryFlag.fromCountryCode(
          shape: const Circle(),
          code,
          width: 24,
          height: 24,
        ),
        SizedBox(width: 15.w),
        Text(
          name,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: R.palette.lightGray,
          ),
        ),
        const Spacer(),
        trailing != null
            ? trailing!
            : viewModel.selectedFlag == code
                ? SvgPicture.asset(
                    R.assets.graphics.checked.path,
                    height: 22.h,
                  )
                : const SizedBox(),
      ],
    );
  }
}
