import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class TermsAndPolicyPopup extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;

  const TermsAndPolicyPopup({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: TermsAndPolicyPopupMobile(
        title: title,
        subtitle: subtitle,
        content: content,
      ),
      desktopLayout: TermsAndPolicyPopupDesktop(
        title: title,
        subtitle: subtitle,
        content: content,
      ),
    );
  }
}

class TermsAndPolicyPopupMobile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;

  const TermsAndPolicyPopupMobile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      insetPadding:
          EdgeInsets.only(left: 12.w, right: 12.w, bottom: 17.h, top: 17.h),
      backgroundColor: R.palette.appWhiteColor,
      surfaceTintColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              color: R.palette.appPrimaryBlue,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 17.h, bottom: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      SubHeading(
                        title,
                        color: R.palette.appWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: R.theme.interRegular,
                      ),
                      SizedBox(height: 5.h),
                      SubHeading(
                        subtitle,
                        color: R.palette.appWhiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: R.theme.interRegular,
                        letterSpacing: 0.3,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    R.assets.graphics.termsPolicy.path,
                    height: 90.h,
                    width: 60.w,
                    fit: BoxFit.cover,
                  ),
                  InkWell(
                    onTap: () {
                      sl<Navigation>().goBack(context);
                    },
                    child: Image.asset(
                      color: R.palette.appWhiteColor,
                      R.assets.graphics.cross.path,
                      height: 15.w,
                      width: 15.w,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: SingleChildScrollView(
                child: HtmlWidget(content),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TermsAndPolicyPopupDesktop extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;

  const TermsAndPolicyPopupDesktop({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: R.palette.appWhiteColor,
      surfaceTintColor: R.palette.appWhiteColor,
      child: SizedBox(
        width: 0.88 .sw,
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  color: R.palette.appPrimaryBlue,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 30.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubHeading(
                            title,
                            color: R.palette.appWhiteColor,
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 10.h),
                          SubHeading(
                            subtitle,
                            color: R.palette.appWhiteColor,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        R.assets.graphics.termsPolicy.path,
                        height: 122.h,
                        width: 112.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                        onTap: () {
                          sl<Navigation>().goBack(context);
                        },
                        child: Image.asset(
                          color: R.palette.appWhiteColor,
                          R.assets.graphics.cross.path,
                          height: 21.h,
                          width: 21.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 39.w, vertical: 39.w),
                  child: SingleChildScrollView(
                    child: HtmlWidget(
                      content,
                      textStyle: TextStyle(
                          fontSize: 18, fontFamily: R.theme.interRegular),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
