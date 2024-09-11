import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class TextBulletItem extends StatelessWidget {
  final String? content;

  const TextBulletItem({
    super.key,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: TextBulletItemMobile(
          content: content,
        ),
        desktopLayout: TextBulletItemDesktop(
          content: content,
        ));
  }
}

class TextBulletItemMobile extends StatelessWidget {
  final String? content;

  const TextBulletItemMobile({
    super.key,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 5.w,
                height: 5.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(2.5.w),
                  ),
                  color: R.palette.textFieldHintGreyColor,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: SubHeading(
                  content ?? "",
                  color: R.palette.textFieldHintGreyColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  maxLines: 10,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

class TextBulletItemDesktop extends StatelessWidget {
  final String? content;

  const TextBulletItemDesktop({
    super.key,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 1.w,
                height: 1.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0.5.w),
                  ),
                  color: R.palette.textFieldHintGreyColor,
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: SubHeading(
                  content ?? "",
                  color: R.palette.textFieldHintGreyColor,
                  fontSize: 4,
                  fontWeight: FontWeight.w400,
                  maxLines: 10,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
