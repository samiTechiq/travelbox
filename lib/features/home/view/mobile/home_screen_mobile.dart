import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/network/network.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(R.assets.graphics.onboarding.path),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GenericAppBarMobile(
                showLanguageIcon: true,
                leading: SizedBox(
                  height: 41.h,
                  width: 41.w,
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: SvgPicture.asset(
                    R.assets.graphics.person2.path,
                    height: 41.h,
                    width: 41.w,
                  ),
                ),
                onTrailingPressed: () {
                  sl<Navigation>().push(context, Routes.profileRoute);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SizedBox(
                  child: Heading(
                    AppLocalizations.of(context).onboarding_1,
                    fontWeight: FontWeight.w400,
                    color: R.palette.appHeadingTextBlackColor,
                    fontFamily: R.theme.larkenLightFontFamily,
                    fontSize: 36.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SizedBox(
                  child: SubHeading2(
                    AppLocalizations.of(context).onboarding_2,
                    color: R.palette.appHeadingTextBlackColor,
                    fontFamily: R.theme.interRegular,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: GenericButton(
                  onPressed: () async {
                    if (!await sl<NetworkInfo>().isConnected) {
                      Future.delayed(Duration.zero, () {
                        EasyLoading.showError(
                            AppLocalizations.of(context).msg_error_no_internet_connection);
                      });
                      return;
                    }

                    Future.delayed(Duration.zero, () {
                      // ignore: use_build_context_synchronously
                      sl<Navigation>().push(context, Routes.coverQuoteRoute);
                    });
                  },
                  text: AppLocalizations.of(context).check_pricing,
                  fontSize: 15,
                  fontWeightT: FontWeight.w600,
                  color: R.palette.appPrimaryBlue,
                  height: 61,
                  radius: 5,
                  buttonTextColor: R.palette.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
