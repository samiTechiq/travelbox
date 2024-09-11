import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class AddOnItemWidget extends StatelessWidget {
  final String? headTitle;
  final String? contents;
  final String? subTitle;
  final String? price;
  final VoidCallback? onPressed;
  final bool isAdded;
  final VoidCallback? onSelectAdd;
  final bool? isIncluded;
  final bool? isFromConfirmPurchased;
  final bool? icon;

  const AddOnItemWidget({
    super.key,
    this.headTitle,
    this.contents,
    this.subTitle,
    this.price,
    this.onPressed,
    this.isAdded = false,
    this.onSelectAdd,
    this.isIncluded,
    this.isFromConfirmPurchased,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: AddOnItemWidgetMobile(
          headTitle: headTitle,
          contents: contents,
          subTitle: subTitle,
          price: price,
          onPressed: onPressed,
          isAdded: isAdded,
          onSelectAdd: onSelectAdd,
        ),
        desktopLayout: AddOnItemWidgetDesktop(
          headTitle: headTitle,
          contents: contents,
          subTitle: subTitle,
          price: price,
          onPressed: onPressed,
          isAdded: isAdded,
          onSelectAdd: onSelectAdd,
          isIncluded: isIncluded,
          isFromConfirmPurchased: isFromConfirmPurchased,
          icon: icon,
        ));
  }
}

class AddOnItemWidgetMobile extends StatelessWidget {
  final String? headTitle;
  final String? contents;
  final String? subTitle;
  final String? price;
  final VoidCallback? onPressed;
  final bool isAdded;
  final VoidCallback? onSelectAdd;

  const AddOnItemWidgetMobile({
    super.key,
    this.headTitle,
    this.contents,
    this.subTitle,
    this.price,
    this.onPressed,
    this.onSelectAdd,
    required this.isAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appWhiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
        child: Container(
          decoration: R.theme.cardDecoration,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeading(
                  headTitle ?? "",
                  color: R.palette.appHeadingTextBlackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      SubHeading(
                        contents ?? "",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: R.palette.textFieldHintGreyColor,
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: RichText(
                            text: TextSpan(
                              // style: ,
                              children: <TextSpan>[
                                TextSpan(
                                    text: subTitle,
                                    style: TextStyle(
                                      color: R.palette.appPrimaryBlue,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: R.theme.larkenLightFontFamily,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = onPressed),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubHeading(
                      'HK\$$price',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: R.palette.appHeadingTextBlackColor,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                      onTap: onSelectAdd,
                      child: SvgPicture.asset(
                        isAdded
                            ? R.assets.graphics.blackMinus.path
                            : R.assets.graphics.bluePlus.path,
                        width: 24.w,
                        height: 24.w,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddOnItemWidgetDesktop extends StatelessWidget {
  final String? headTitle;
  final String? contents;
  final String? subTitle;
  final String? price;
  final VoidCallback? onPressed;
  final bool isAdded;
  final VoidCallback? onSelectAdd;
  final bool? isIncluded;
  final bool? isFromConfirmPurchased;
  final bool? icon;

  const AddOnItemWidgetDesktop({
    super.key,
    this.headTitle,
    this.contents,
    this.subTitle,
    this.price,
    this.onPressed,
    this.onSelectAdd,
    required this.isAdded,
    this.isIncluded,
    this.isFromConfirmPurchased,
    this.icon,
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
            color: R.palette.appHeadingTextBlackColor,
            fontSize: 6,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 40,
                child: Row(
                  children: [
                    icon == true
                        ? isIncluded == true
                            ? SvgPicture.asset(
                                R.assets.graphics.apply.path,
                                height: 15.h,
                                width: 15.h,
                                fit: BoxFit.cover,
                              )
                            : SvgPicture.asset(
                                R.assets.graphics.line.path,
                                height: 4.h,
                                width: 4.h,
                                fit: BoxFit.cover,
                              )
                        : const SizedBox(),
                    icon == true ? SizedBox(width: 5.w) : const SizedBox(),
                    Expanded(
                      child: Column(
                        children: [
                          SubHeading(
                            contents ?? "",
                            fontSize: 5,
                            fontWeight: FontWeight.w400,
                            color: R.palette.lightGray,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                child: RichText(
                                  text: TextSpan(
                                    // style: ,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: subTitle,
                                          style: TextStyle(
                                            color: R.palette.appPrimaryBlue,
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                R.theme.larkenLightFontFamily,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = onPressed),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              isFromConfirmPurchased == true
                  ? Expanded(
                      flex: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SubHeading(
                            isIncluded == true ? "Included" : "Excluded",
                            fontSize: 5,
                            fontWeight: FontWeight.w500,
                            color: isIncluded == true
                                ? R.palette.mediumBlack
                                : R.palette.lightGray,
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      flex: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SubHeading(
                            'HK\$$price',
                            fontSize: 5,
                            fontWeight: FontWeight.w500,
                            color: R.palette.appHeadingTextBlackColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                            onTap: onSelectAdd,
                            child: SvgPicture.asset(
                              isAdded
                                  ? R.assets.graphics.blackMinus.path
                                  : R.assets.graphics.bluePlus.path,
                              width: 41,
                              height: 41,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
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
