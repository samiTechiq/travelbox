import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class OptionalExtrasDialog extends StatelessWidget {
  const OptionalExtrasDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: OptionalExtrasDialogMobile(),
      desktopLayout: OptionalExtrasDialogDesktop(),
    );
  }
}

class OptionalExtrasDialogDesktop extends StatelessWidget {
  const OptionalExtrasDialogDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: R.palette.white,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
        child: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                sl<Navigation>().goBack(context);
              },
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Image.asset(
                  R.assets.graphics.cross.path,
                  height: 15.h,
                  width: 15.w,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 0.35.sw,
            height: 0.33.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).optional_extras,
                  fontWeight: FontWeight.w600,
                  fontSize: 7,
                  color: R.palette.appHeadingTextBlackColor,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context).cruise_cover,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context)
                              .rental_vehicle_excess_cover,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context)
                              .vacation_rental_protection,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context).golf_cover,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context)
                              .adventure_and_extreme_sports,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OptionalExtrasItem(
                          optionName:
                              AppLocalizations.of(context).winter_sports,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context)
                              .personal_liability_option,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context).gadget_cover,
                        ),
                        OptionalExtrasItem(
                          optionName:
                              AppLocalizations.of(context).pet_care_cover,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class OptionalExtrasDialogMobile extends StatelessWidget {
  const OptionalExtrasDialogMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: R.palette.white,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Stack(children: [
          Positioned(
            top: 5,
            right: 0,
            child: InkWell(
              onTap: () {
                sl<Navigation>().goBack(context);
              },
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Image.asset(
                  R.assets.graphics.cross.path,
                  height: 15.h,
                  width: 15.w,
                ),
              ),
            ),
          ),
          SizedBox(
            // width: 0.5.sw,
            // height: 0.58.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).optional_extras,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: R.palette.appHeadingTextBlackColor,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context).cruise_cover,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context)
                              .rental_vehicle_excess_cover,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context)
                              .vacation_rental_protection,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context).golf_cover,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context)
                              .adventure_and_extreme_sports,
                        ),
                        OptionalExtrasItem(
                          optionName:
                              AppLocalizations.of(context).winter_sports,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context)
                              .personal_liability_option,
                        ),
                        OptionalExtrasItem(
                          optionName: AppLocalizations.of(context).gadget_cover,
                        ),
                        OptionalExtrasItem(
                          optionName:
                              AppLocalizations.of(context).pet_care_cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class OptionalExtrasItem extends StatelessWidget {
  final String optionName;

  const OptionalExtrasItem({
    super.key,
    required this.optionName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Row(
        children: [
          SvgPicture.asset(
            R.assets.graphics.checkedGreen.path,
            height: MediaQuery.of(context).size.width < 520 ? 20.h : 15.h,
            width: MediaQuery.of(context).size.width < 520 ? 20.h : 15.w,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            width: kIsWeb
                ? MediaQuery.of(context).size.width < 520
                    ? 9.w
                    : 5.w
                : 10.w,
          ),
          SubHeading(
            optionName,
            color: R.palette.mediumBlack,
            fontSize: kIsWeb
                ? MediaQuery.of(context).size.width < 520
                    ? 18
                    : 5
                : 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
