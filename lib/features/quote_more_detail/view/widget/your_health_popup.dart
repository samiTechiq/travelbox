import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class YourHealthPopup extends StatelessWidget {
  final String? heading;
  final List<Widget>? widgets;

  const YourHealthPopup({
    super.key,
    this.widgets,
    this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: YourHealthPopupMobile(
          widgets: widgets,
          heading: heading,
        ),
        desktopLayout: YourHealthPopupDesktop(
          widgets: widgets,
          heading: heading,
        ));
  }
}

class YourHealthPopupMobile extends StatelessWidget {
  final List<Widget>? widgets;
  final String? heading;
  const YourHealthPopupMobile({
    super.key,
    this.widgets,
    this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundColor: R.palette.white,
      surfaceTintColor: R.palette.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.w),
          child: SizedBox(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
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
                      height: 13.h,
                      width: 13.w,
                    ),
                  ),
                ),
                SubHeading(
                  heading ?? "",
                  color: R.palette.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 15.h),
                Column(
                  children: widgets ?? [],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class YourHealthPopupDesktop extends StatelessWidget {
  final List<Widget>? widgets;
  final String? heading;
  const YourHealthPopupDesktop({
    super.key,
    this.widgets,
    this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: R.palette.white,
      surfaceTintColor: R.palette.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
          child: SizedBox(
            width: 0.4.sw,
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
                  heading ?? "",
                  color: R.palette.black,
                  fontSize: 6,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 15.h),
                Column(
                  children: widgets ?? [],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
