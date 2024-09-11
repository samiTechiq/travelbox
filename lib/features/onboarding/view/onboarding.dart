import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/viewmodel/change_language_viewmodel.dart';
import 'package:travelbox/features/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

import 'desktop/onboarding_desktop.dart';
import 'mobile/onboarding_mobile.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({
    Key? key,
  }) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void didChangeDependencies() {
    context.watch<ChangeLanguageViewModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final loginViewModel = context.watch<LoginViewmodel>();
    return ChangeNotifierProvider<OnboardingViewModel>(
      create: (_) => sl<OnboardingViewModel>(),
      child: Scaffold(
        backgroundColor: R.palette.white,
        // appBar: ResponsiveAppBar(
        //   isLoggedIn: loginViewModel.loginState,
        //   desktopLeadingWidth: loginViewModel.loginState ? 85  : 545,
        //   desktopLeading: SizedBox(width: loginViewModel.loginState ? 85  : 545,),
        //   centerTile: true,
        //   desktopActions: [
        //     if (!loginViewModel.loginState) ...[
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           TextButton(onPressed: (){
        //             sl<Navigation>().push(context, Routes.contactUsRoute);
        //           }, child: Center(
        //             child: Text(
        //               'Contact us'.hardcoded,
        //               style: TextStyle(
        //                 fontSize: 18,
        //                 color: R.palette.appHeadingTextBlackColor,
        //                 fontFamily: R.theme.interRegular,
        //                 fontWeight: FontWeight.w500,
        //               ),
        //             ),
        //           ),),
        //           const SizedBox(
        //             width: 26,
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(top: 45.0, bottom: 45),
        //             child: VerticalDivider(
        //               width: 1,
        //               color: R.palette.appHeadingTextBlackColor,
        //             ),
        //           ),
        //           const SizedBox(
        //             width: 26,
        //           ),
        //           TextButton(onPressed: (){
        //             sl<Navigation>().push(context, Routes.signUpRoute);
        //           }, child: Center(
        //             child: Text(
        //               'Sign up'.hardcoded,
        //               style: TextStyle(
        //                 fontSize: 18,
        //                 color: R.palette.appHeadingTextBlackColor,
        //                 fontFamily: R.theme.interRegular,
        //                 fontWeight: FontWeight.w500,
        //               ),
        //             ),
        //           ),),
        //           const SizedBox(
        //             width: 49,
        //           ),
        //           AppButton.generic(
        //             onPressed: () {
        //               sl<Navigation>().push(context, Routes.loginRoute);
        //             },
        //             width: 135,
        //             height: 50,
        //             color: R.palette.appPrimaryBlue,
        //             text: 'Sign in'.hardcoded,
        //             fontSize: 18,
        //             fontWeightT: FontWeight.w500,
        //             textColor: R.palette.white,
        //             fontFamily: R.theme.interRegular,
        //           ),
        //           const SizedBox(
        //             width: 7,
        //           ),
        //         ],
        //       )
        //     ]
        //   ],
        //   mobileLeading: InkWell(
        //     onTap: () {
        //       sl<Navigation>().push(context, Routes.drawerMenu);
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 25),
        //       child: SvgPicture.asset(
        //         R.assets.graphics.icDrawer.path,
        //         height: 30,
        //         width: 30,
        //       ),
        //     ),
        //   ),
        // ),
        body: const ResponsiveLayout(
          mobileLayout: OnBoardingMobile(),
          desktopLayout: OnBoardingDesktop(),
        ),
      ),
    );
  }
}
