import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class BaseQuotePopup extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget content;
  final String titleButton;
  final bool isEnableButton;

  const BaseQuotePopup({
    super.key,
    required this.title,
    required this.onPressed,
    required this.content,
    required this.titleButton,
    required this.isEnableButton,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: BaseQuotePopupMobile(
        title: title,
        content: content,
        onPressed: onPressed,
        titleButton: titleButton,
        isEnableButton: isEnableButton,
      ),
      desktopLayout: BaseQuotePopupDesktop(
        title: title,
        content: content,
        onPressed: onPressed,
        titleButton: titleButton,
        isEnableButton: isEnableButton,
      ),
    );
  }
}

class BaseQuotePopupMobile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget content;
  final String titleButton;
  final bool isEnableButton;

  const BaseQuotePopupMobile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.content,
    required this.titleButton,
    required this.isEnableButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.w),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    decoration: R.theme.genericCardDecoration,
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              sl<Navigation>().goBack(context);
                            },
                            child: Image.asset(
                              R.assets.graphics.cross.path,
                              height: 16.w,
                              width: 16.w,
                            ),
                          ),
                        ),
                        SubHeading(
                          title,
                          color: R.palette.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 20.h),
                        content,
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
                SizedBox(
                  height: 58.h,
                  child: GenericButton(
                    onPressed: onPressed,
                    text: titleButton,
                    isEnable: isEnableButton,
                    fontSize: 18.sp,
                    fontWeightT: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BaseQuotePopupDesktop extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget content;
  final String titleButton;
  final bool isEnableButton;

  const BaseQuotePopupDesktop({
    super.key,
    required this.title,
    required this.onPressed,
    required this.content,
    required this.titleButton,
    required this.isEnableButton,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: R.palette.appWhiteColor,
      surfaceTintColor: R.palette.appWhiteColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 6.w),
          child: SizedBox(
            width: 0.32.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      sl<Navigation>().goBack(context);
                    },
                    child: Image.asset(
                      R.assets.graphics.cross.path,
                      height: 20.h,
                    ),
                  ),
                ),
                SubHeading(
                  title,
                  color: R.palette.black,
                  fontSize: 6,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(height: 30.h),
                content,
                SizedBox(height: 35.h),
                Align(
                  alignment: Alignment.center,
                  child: GenericButton(
                    width: 100,
                    height: 65,
                    onPressed: onPressed,
                    text: titleButton,
                    isEnable: isEnableButton,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
