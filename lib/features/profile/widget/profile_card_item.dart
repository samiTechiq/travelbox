import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class ProfileCardItem extends StatelessWidget {
  final String icon;
  final String title;
  final double? fontSize;
  final double? spaceSize;
  final double? iconSize;
  final VoidCallback? onPressed;

  const ProfileCardItem({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
    this.fontSize,
    this.spaceSize,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: iconSize ?? 25.h,
          ),
          SizedBox(
            width: spaceSize ?? 14.w,
          ),
          Expanded(
            child: SubHeading(
              title,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
              fontSize: fontSize ?? 5,
            ),
          ),
        ],
      ),
    );
  }
}
