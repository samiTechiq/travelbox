import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class AddOnItemWidget extends StatelessWidget {
  final String? headTitle;
  final String? contents;
  final bool apply;

  const AddOnItemWidget({
    super.key,
    this.headTitle,
    this.contents,
    this.apply = true,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: const AddOnItemWidgetMobile(),
        desktopLayout: AddOnItemWidgetDesktop(
          headTitle: headTitle,
          contents: contents,
          apply: apply,
        ));
  }
}

class AddOnItemWidgetMobile extends StatelessWidget {
  const AddOnItemWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class AddOnItemWidgetDesktop extends StatelessWidget {
  final String? headTitle;
  final String? contents;
  final bool apply;

  const AddOnItemWidgetDesktop({
    super.key,
    this.headTitle,
    this.contents,
    required this.apply,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(
            headTitle ?? "",
            color: R.palette.mediumBlack,
            fontSize: 5,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  apply
                      ? SvgPicture.asset(
                          R.assets.graphics.apply.path,
                          height: 15.h,
                          width: 15.w,
                        )
                      : Container(
                          height: 5.h,
                          width: 5.w,
                          color: R.palette.black,
                        ),
                  SizedBox(
                    width: 3.w,
                  ),
                ],
              ),
              Expanded(
                child: SubHeading(
                  contents ?? "",
                  fontSize: 4,
                  fontWeight: FontWeight.w400,
                  color: R.palette.textFieldHintGreyColor,
                  maxLines: 2,
                ),
              ),
              SubHeading(
                apply ? "Included" : "Excluded",
                fontSize: 4,
                fontWeight: FontWeight.w600,
                color: apply
                    ? R.palette.mediumBlack
                    : R.palette.textFieldHintGreyColor,
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
