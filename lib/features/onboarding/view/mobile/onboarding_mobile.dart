import 'package:boxy/boxy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/home/widgets/cheaper_travel_insurance_box.dart';
import 'package:travelbox/features/home/widgets/check_pricing_box.dart';
import 'package:travelbox/features/home/widgets/covered_box.dart';
import 'package:travelbox/features/home/widgets/offer_box.dart';
import 'package:travelbox/features/home/widgets/policy_right_for_you_box.dart';
import 'package:travelbox/features/home/widgets/travel_insurance_need_box.dart';
import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/copyright_bottom.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class OnBoardingMobile extends StatelessWidget {
  const OnBoardingMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.watch<LoginViewmodel>();
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: R.palette.white,
        body: DecoratedBox(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(R.assets.graphics.onboarding.path),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ResponsiveAppBar(
                      isLoggedIn: loginViewModel.loginState,
                      desktopLeadingWidth: loginViewModel.loginState ? 85 : 545,
                      desktopLeading: SizedBox(
                        width: loginViewModel.loginState ? 85 : 545,
                      ),
                      centerTile: true,
                      desktopActions: [
                        if (!loginViewModel.loginState) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  sl<Navigation>()
                                      .push(context, Routes.contactUsRoute);
                                },
                                child: Center(
                                  child: Text(
                                    'Contact us'.hardcoded,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: R.palette.appHeadingTextBlackColor,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 26,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 45.0, bottom: 45),
                                child: VerticalDivider(
                                  width: 1,
                                  color: R.palette.appHeadingTextBlackColor,
                                ),
                              ),
                              const SizedBox(
                                width: 26,
                              ),
                              TextButton(
                                onPressed: () {
                                  sl<Navigation>()
                                      .push(context, Routes.signUpRoute);
                                },
                                child: Center(
                                  child: Text(
                                    'Sign up'.hardcoded,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: R.palette.appHeadingTextBlackColor,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 49,
                              ),
                              AppButton.generic(
                                onPressed: () {
                                  sl<Navigation>()
                                      .push(context, Routes.loginRoute);
                                },
                                width: 135,
                                height: 50,
                                color: R.palette.appPrimaryBlue,
                                text: 'Sign in'.hardcoded,
                                fontSize: 18,
                                fontWeightT: FontWeight.w500,
                                textColor: R.palette.white,
                                fontFamily: R.theme.interRegular,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                            ],
                          )
                        ]
                      ],
                      mobileLeading: InkWell(
                        onTap: () {
                          sl<Navigation>().push(context, Routes.drawerMenu);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: SvgPicture.asset(
                            R.assets.graphics.icDrawer.path,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                    CustomBoxy(
                      delegate: MyMobileBoxy(),
                      children: [
                        BoxyId(id: #top, child: CheckPricingBox()),
                        BoxyId(id: #bot, child: TravelInsuranceNeedBox()),
                        BoxyId(
                            id: #imageHat,
                            child: SizedBox(
                              width: 0.7.sw,
                              child:
                                  Image.asset(R.assets.graphics.travelHat.path),
                            )),
                        BoxyId(
                            id: #imageShield,
                            child: SizedBox(
                              width: 0.57.sw,
                              child: Image.asset(
                                  R.assets.graphics.travelShield.path),
                            )),
                        BoxyId(
                            id: #imageSuitcase,
                            child: SizedBox(
                              width: 0.55.sw,
                              child: Image.asset(
                                  R.assets.graphics.travelSuitcase.path),
                            )),
                      ],
                    ),
                    CoveredBox(),
                    PolicyRightForYouBox(),
                    CheaperTravelInsurance(),
                    OfferBox(),
                    CopyRightBottom(),
                  ],
                ),
              )
            ],
          ),
          // child: Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 25.w),
          //   child: Column(
          //     // mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       GenericAppBarMobile(
          //         isClickable: false,
          //         leading: Padding(
          //           padding: EdgeInsets.only(right: 9.w),
          //           child: SizedBox(
          //             height: 45.h,
          //             width: 45.w,
          //           ),
          //         ),
          //         showLanguageIcon: false,
          //         trailing: Padding(
          //           padding: EdgeInsets.only(left: 9.w),
          //           child: SvgPicture.asset(
          //             loginViewModel.loginState
          //                 ? R.assets.graphics.person2.path
          //                 : R.assets.graphics.webIcon.path,
          //             height: 45.h,
          //             width: 45.w,
          //           ),
          //         ),
          //         onTrailingPressed: () {
          //           loginViewModel.loginState
          //               ? sl<Navigation>().push(context, Routes.profileRoute)
          //               : _showMyDialog(context, const LanguageDialog());
          //         },
          //       ),
          //       SizedBox(
          //         height: 35.h,
          //       ),
          //       SizedBox(
          //         child: SubHeading(
          //           AppLocalizations.of(context).onboarding_1,
          //           fontWeight: FontWeight.w500,
          //           color: R.palette.appHeadingTextBlackColor,
          //           fontFamily: R.theme.larkenLightFontFamily,
          //           fontSize: 45,
          //           textAlign: TextAlign.center,
          //           height: 1.1,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 20.h,
          //       ),
          //       SizedBox(
          //         child: SubHeading(
          //           AppLocalizations.of(context).onboarding_2,
          //           color: R.palette.appHeadingTextBlackColor,
          //           fontFamily: R.theme.interRegular,
          //           fontSize: 24,
          //           fontWeight: FontWeight.w400,
          //           textAlign: TextAlign.center,
          //           height: 1.2,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 45.h,
          //       ),
          //       Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 45.w),
          //         child: GenericButton(
          //           onPressed: () async {
          //             if (!await sl<NetworkInfo>().isConnected) {
          //               Future.delayed(Duration.zero, () {
          //                 EasyLoading.showError(
          //                     AppLocalizations.of(context).msg_error_no_internet_connection);
          //               });
          //               return;
          //             }
          //
          //             Future.delayed(Duration.zero, () {
          //               // ignore: use_build_context_synchronously
          //               sl<Navigation>().push(context, Routes.coverQuoteRoute);
          //             });
          //           },
          //           text: AppLocalizations.of(context).check_pricing,
          //           fontWeightT: FontWeight.w600,
          //           color: R.palette.appPrimaryBlue,
          //           width: 249,
          //           radius: 5,
          //           fontSize: 18,
          //           buttonTextColor: R.palette.white,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

class MyMobileBoxy extends BoxyDelegate {
  @override
  Size layout() {
    //Get handles
    final top = (getChild(#top));
    final bot = (getChild(#bot));
    final imageHat = (getChild(#imageHat));
    final imageSuitcase = (getChild(#imageSuitcase));
    final imageShield = (getChild(#imageShield));

    top.layout(constraints);
    bot.layout(constraints);
    bot.position(top.rect.bottomLeft);
    //Center horizontal
    imageShield.layout(constraints);
    // final middleShield = top.size.height - imageShield.size.height / 3;
    final yShield = top.size.height - (imageShield.size.height) - 30;
    imageShield.position(
        Offset((top.size.width / 2) - (imageShield.size.width / 2), yShield));
    //
    imageHat.layout(constraints);
    final yHat = top.size.height / 2.5;
    imageHat.position(Offset((top.size.width / 2), yHat));
    //
    imageSuitcase.layout(constraints);
    final ySuitcase = (top.size.height / 2);
    imageSuitcase.position(Offset((-imageSuitcase.size.width / 3), ySuitcase));

    return top.size + Offset(0, bot.size.height);
  }
}
