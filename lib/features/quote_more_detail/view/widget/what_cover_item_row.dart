import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class WhatCoverItemRow extends StatelessWidget {
  final String? title;
  final String? price;
  final bool? apply;
  final bool? icon;
  final bool? isPopup;

  const WhatCoverItemRow({
    super.key,
    this.title,
    this.price,
    this.apply = true,
    this.icon = false,
    this.isPopup,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: WhatCoverItemRowMobile(
        title: title,
        price: price,
        apply: apply,
        isPopup: isPopup,
        icon: icon,
      ),
      desktopLayout: WhatCoverItemRowDesktop(
        title: title,
        price: price,
        icon: icon,
        apply: apply,
      ),
    );
  }
}

class WhatCoverItemRowMobile extends StatelessWidget {
  final String? title;
  final String? price;
  final bool? apply;
  final bool? icon;
  final bool? isPopup;

  const WhatCoverItemRowMobile({
    super.key,
    this.title,
    this.price,
    this.apply,
    this.isPopup,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: isPopup == true
              ? EdgeInsets.symmetric(horizontal: 5.w)
              : const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon == true
                  ? Row(
                      children: [
                        SvgPicture.asset(
                          apply == true
                              ? R.assets.graphics.apply.path
                              : R.assets.graphics.notApply.path,
                          height: 14.w,
                          width: 14 .w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    )
                  : const SizedBox(),
              Expanded(
                child: SubHeading(
                  title ?? "",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: R.palette.lightGray,
                  maxLines: 2,
                ),
              ),
              price != null
                  ? SubHeading(
                      'HK\$$price',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                      textAlign: TextAlign.end,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}

class WhatCoverItemRowDesktop extends StatelessWidget {
  final String? title;
  final String? price;
  final bool? icon;
  final bool? apply;

  const WhatCoverItemRowDesktop({
    super.key,
    this.title,
    this.price,
    this.icon,
    this.apply,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // SubHeading(
            //   title ?? "",
            //   fontSize: 4,
            //   fontWeight: FontWeight.w400,
            //   color: R.palette.appHeadingTextBlackColor,
            // ),
            // SubHeading(
            //   price!.isNotEmpty ? 'HK\$$price' : "",
            //   fontSize: 4,
            //   fontWeight: FontWeight.w400,
            //   color: R.palette.appHeadingTextBlackColor,
            //   textAlign: TextAlign.end,
            // ),
            icon == true
                ? Row(
                    children: [
                      SvgPicture.asset(
                        apply == true
                            ? R.assets.graphics.apply.path
                            : R.assets.graphics.notApply.path,
                        height: 15.h,
                        width: 15.h,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                    ],
                  )
                : const SizedBox(),
            Expanded(
              child: SubHeading(
                title ?? "",
                fontSize: 5,
                fontWeight: FontWeight.w400,
                color: R.palette.lightGray,
              ),
            ),
            price != null
                ? SubHeading(
                    'HK\$$price',
                    fontSize: 5,
                    fontWeight: FontWeight.w400,
                    color: R.palette.lightGray,
                  )
                : const SizedBox(),
          ],
        ),
        SizedBox(
          height: 13.h,
        ),
      ],
    );
  }
}
