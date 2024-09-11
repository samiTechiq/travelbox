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

class OnBoardingDesktop extends StatelessWidget {
  const OnBoardingDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.watch<LoginViewmodel>();
    return Scaffold(
      backgroundColor: R.palette.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                ResponsiveAppBar(
                  isLoggedIn: loginViewModel.loginState,
                  desktopLeadingWidth: loginViewModel.loginState ? 85  : 545,
                  desktopLeading: SizedBox(width: loginViewModel.loginState ? 85  : 545,),
                  centerTile: true,
                  desktopActions: [
                    if (!loginViewModel.loginState) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(onPressed: (){
                            sl<Navigation>().push(context, Routes.contactUsRoute);
                          }, child: Center(
                            child: Text(
                              'Contact us'.hardcoded,
                              style: TextStyle(
                                fontSize: 18,
                                color: R.palette.appHeadingTextBlackColor,
                                fontFamily: R.theme.interRegular,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),),
                          const SizedBox(
                            width: 26,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 45.0, bottom: 45),
                            child: VerticalDivider(
                              width: 1,
                              color: R.palette.appHeadingTextBlackColor,
                            ),
                          ),
                          const SizedBox(
                            width: 26,
                          ),
                          TextButton(onPressed: (){
                            sl<Navigation>().push(context, Routes.signUpRoute);
                          }, child: Center(
                            child: Text(
                              'Sign up'.hardcoded,
                              style: TextStyle(
                                fontSize: 18,
                                color: R.palette.appHeadingTextBlackColor,
                                fontFamily: R.theme.interRegular,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),),
                          const SizedBox(
                            width: 49,
                          ),
                          AppButton.generic(
                            onPressed: () {
                              sl<Navigation>().push(context, Routes.loginRoute);
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
                  delegate: MyBoxy(),
                  children: [
                    BoxyId(id: #top, child: CheckPricingBox()),
                    BoxyId(id: #bot, child: TravelInsuranceNeedBox()),
                    BoxyId(
                        id: #imagePlane,
                        child: SizedBox(
                          width: 0.36.sw,
                          child: Image.asset(R.assets.graphics.airPlane.path),
                        )),
                    BoxyId(
                        id: #imageShield,
                        child: SizedBox(
                          width: 0.2.sw,
                          child:
                              Image.asset(R.assets.graphics.travelShield.path),
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
          ),
        ],
      ),
    );
  }
}

class MyBoxy extends BoxyDelegate {
  @override
  Size layout() {
    //Get handles
    final top = (getChild(#top));
    final bot = (getChild(#bot));
    final imagePlane = (getChild(#imagePlane));
    final imageShield = (getChild(#imageShield));
    top.layout(constraints);
    bot.layout(constraints);
    bot.position(top.rect.bottomLeft);
    //Calc position
    imageShield.layout(constraints);
    final middleShield = top.size.height - imageShield.size.height / 1.5;
    imageShield.position(Offset(180.w, middleShield));
    //
    imagePlane.layout(constraints);
    final middlePlane = top.size.height - imagePlane.size.height / 1.5;
    imagePlane.position(Offset(900.w, middlePlane));

    return top.size + Offset(0, bot.size.height);
  }
}
