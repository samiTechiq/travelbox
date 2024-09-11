import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/home/widgets/cheaper_travel_insurance_box.dart';
import 'package:travelbox/features/home/widgets/check_pricing_box.dart';
import 'package:travelbox/features/home/widgets/covered_box.dart';
import 'package:travelbox/features/home/widgets/offer_box.dart';
import 'package:travelbox/features/home/widgets/policy_right_for_you_box.dart';
import 'package:travelbox/features/home/widgets/travel_insurance_need_box.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/copyright_bottom.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.white,
      appBar: GenericAppBarDesktop(
        leading: const SizedBox(),
        trailing: Padding(
          padding: EdgeInsets.only(right: 5.0.w),
          child: Row(
            children: [
              GenericButton(
                text: 'Contact us'.hardcoded,
                textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: R.theme.interRegular,
                    fontSize: 18.sp,
                    color: R.palette.appHeadingTextBlackColor),
                onPressed: () {
                  sl<Navigation>().push(context, Routes.contactUsRoute);
                },
              ),
              SizedBox(
                width: 27.w,
              ),
              GestureDetector(
                child: SvgPicture.asset(
                  R.assets.graphics.person2.path,
                  height: 60.h,
                  width: 60.w,
                ),
                onTap: () {
                  sl<Navigation>().push(context, Routes.profileRoute);
                },
              ),
            ],
          ),
        ),
        isClickable: false,
        showLanguageIcon: false,
        // onPressed: () {
        //   _showMyDialog(context);
        // },
      ),
      // body: Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(R.assets.graphics.onboardingDesktop.path),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: SizedBox(
      //     width: double.infinity,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           height: 60.h,
      //         ),
      //         SizedBox(
      //           width: 0.5.sw,
      //           child: SubHeading2(
      //             AppLocalizations.of(context).onboarding_1,
      //             fontWeight: FontWeight.w500,
      //             color: R.palette.appHeadingTextBlackColor,
      //             fontFamily: R.theme.larkenLightFontFamily,
      //             textAlign: TextAlign.center,
      //             fontSize: 85,
      //             height: 1.1,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 25.h,
      //         ),
      //         SizedBox(
      //           width: 0.4.sw,
      //           child: SubHeading2(
      //             AppLocalizations.of(context).onboarding_2,
      //             color: R.palette.appGreyTextColor,
      //             fontFamily: R.theme.interRegular,
      //             fontSize: 30,
      //             textAlign: TextAlign.center,
      //             fontWeight: FontWeight.w300,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 32.h,
      //         ),
      //         GenericButton(
      //           onPressed: () async {
      //             sl<Navigation>().push(context, Routes.coverQuoteRoute);
      //           },
      //           text: AppLocalizations.of(context).check_pricing,
      //           fontSize: 20,
      //           fontWeightT: FontWeight.bold,
      //           color: R.palette.appPrimaryBlue,
      //           height: 65,
      //           width: 80,
      //           radius: 6,
      //           buttonTextColor: R.palette.white,
      //         ),
      //         SizedBox(
      //           height: 10.h,
      //         ),
      //         // Expanded(
      //         //   child: SvgPicture.asset(
      //         //     R.assets.graphics.onBoardingDesktop.path,
      //         //     fit: BoxFit.contain,
      //         //   ),
      //         // )
      //       ],
      //     ),
      //   ),
      // ),
      body: CustomScrollView(
        slivers: const [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CheckPricingBox(),
                TravelInsuranceNeedBox(),
                CoveredBox(),
                PolicyRightForYouBox(),
                CheaperTravelInsurance(),
                OfferBox(),
                CopyRightBottom(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
