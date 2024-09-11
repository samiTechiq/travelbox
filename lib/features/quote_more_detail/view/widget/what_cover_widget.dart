import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/what_cover_item_row.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class WhatCoverItem extends StatelessWidget {
  final String? headTitle;
  final List? contents;
  final String? subTitle;
  final VoidCallback? onClickSubTitle;
  final bool apply;
  final bool icon;
  final bool? isPopup;

  const WhatCoverItem({
    super.key,
    this.headTitle,
    this.contents,
    this.subTitle,
    this.onClickSubTitle,
    this.apply = true,
    this.icon = false,
    this.isPopup,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: WhatCoverItemMobile(
          headTitle: headTitle,
          contents: contents,
          subTitle: subTitle,
          onClickSubTitle: onClickSubTitle,
          icon: icon,
          apply: apply,
          isPopup: isPopup,
        ),
        desktopLayout: WhatCoverItemDesktop(
          headTitle: headTitle,
          contents: contents,
          subTitle: subTitle,
          onClickSubTitle: onClickSubTitle,
          icon: icon,
          apply: apply,
          isPopup: isPopup,
        ));
  }
}

class WhatCoverItemMobile extends StatelessWidget {
  final String? headTitle;
  final List? contents;
  final String? subTitle;
  final VoidCallback? onClickSubTitle;
  final bool? apply;
  final bool? icon;
  final bool? isPopup;

  const WhatCoverItemMobile({
    super.key,
    this.headTitle,
    this.contents,
    this.subTitle,
    this.onClickSubTitle,
    this.apply,
    this.icon,
    this.isPopup,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color:
              isPopup == true ? R.palette.mediumBlue : R.palette.appWhiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: isPopup == true
                    ? EdgeInsets.only(top: 8.h, bottom: 8.h, left: 5.w)
                    : const EdgeInsets.all(0),
                child: SubHeading(
                  headTitle ?? "",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: R.palette.mediumBlack,
                ),
              ),
              isPopup == true
                  ? const SizedBox()
                  : SvgPicture.asset(
                      R.assets.graphics.line.path,
                      width: 16,
                      height: 3,
                      fit: BoxFit.cover,
                    )
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Column(
            children: (contents ?? []).map((item) {
          return WhatCoverItemRow(
            title: item['name'],
            price: item['price'],
            apply: apply,
            isPopup: isPopup,
            icon: icon,
          );
        }).toList()),
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.larkenLightFontFamily,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = onClickSubTitle),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WhatCoverItemDesktop extends StatelessWidget {
  final String? headTitle;
  final List? contents;
  final String? subTitle;
  final VoidCallback? onClickSubTitle;
  final bool apply;
  final bool icon;
  final bool? isPopup;

  const WhatCoverItemDesktop({
    super.key,
    this.headTitle,
    this.contents,
    this.subTitle,
    this.onClickSubTitle,
    required this.icon,
    required this.apply,
    this.isPopup,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color:
              isPopup == true ? R.palette.mediumBlue : R.palette.appWhiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: isPopup == true
                    ? EdgeInsets.only(top: 5.h, bottom: 5.h,)
                    : const EdgeInsets.all(0),
                child: SubHeading(
                  headTitle ?? "",
                  fontSize: 6,
                  fontWeight: FontWeight.w700,
                  color: R.palette.appHeadingTextBlackColor,
                ),
              ),
              isPopup == true
                  ? const SizedBox()
                  : SvgPicture.asset(
                      R.assets.graphics.line.path,
                      width: 16,
                      height: 3,
                      fit: BoxFit.cover,
                    ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Column(
            children: (contents ?? []).map((item) {
          return WhatCoverItemRow(
            title: item['name'],
            price: item['price'],
            icon: icon,
            apply: apply,
            isPopup: isPopup,
          );
        }).toList()),
        SizedBox(
          height: 10.h,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: RichText(
              text: TextSpan(
                // style: ,
                children: <TextSpan>[
                  TextSpan(
                      text: subTitle,
                      style: TextStyle(
                        color: R.palette.appPrimaryBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: R.theme.larkenLightFontFamily,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = onClickSubTitle),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
