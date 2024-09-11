import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/email_utils.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class VerifyYourMailResultScreenMobile extends StatefulWidget {
  final bool isSuccess;
  const VerifyYourMailResultScreenMobile({super.key, required this.isSuccess});

  @override
  State<VerifyYourMailResultScreenMobile> createState() =>
      _VerifyYourMailResultScreenMobileState();
}

class _VerifyYourMailResultScreenMobileState
    extends State<VerifyYourMailResultScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<BasicInfoViewModel>(),
      builder: (context, child) {
        return widget.isSuccess
            ? const VerifyYourMailSuccessContent()
            : const VerifyYourMailFailContent();
      },
    );
  }
}

class VerifyYourMailSuccessContent extends StatelessWidget {
  const VerifyYourMailSuccessContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                GenericAppBar(
                  leading: Padding(
                    padding: EdgeInsets.only(right: 25.w),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: R.palette.mediumBlack,
                    ),
                  ),
                  onLeadingPressed: () {
                    sl<Navigation>().goBack(context);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 0.88.sw,
                  decoration: R.theme.genericCardDecoration,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 28, right: 28, top: 30, bottom: 39),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubHeading(
                          AppLocalizations.of(context).verification_success,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: R.palette.black,
                          fontFamily: R.theme.interRegular,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        SubHeading(
                          AppLocalizations.of(context)
                              .verification_success_desc,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: R.palette.lightGray,
                          fontFamily: R.theme.interRegular,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            R.assets.graphics.success.path,
                            height: 171,
                            width: 159,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        GenericButton(
                          onPressed: () {
                            sl<Navigation>()
                                .go(context, Routes.loginRoute);
                          },
                          text: AppLocalizations.of(context).login,
                          fontSize: 16,
                          height: 47,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyYourMailFailContent extends StatelessWidget {
  const VerifyYourMailFailContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
            child: Column(
              children: [
                GenericAppBarMobile(
                  trailing: SizedBox(
                    height: 41.h,
                    width: 41.w,
                  ),
                  leading: InkWell(
                    onTap: () {
                      sl<Navigation>().go(context, Routes.signUpRoute);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: R.palette.mediumBlack,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: R.theme.genericCardDecoration,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 14.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).verification_fail,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: R.palette.black,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: AppLocalizations.of(context)
                                .verification_fail_desc,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: R.theme.interRegular,
                                height: 1.5,
                                color: R.palette.lightGray),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "help@withlyla.com",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    fontSize: 16.sp,
                                    color: R.palette.appPrimaryBlue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      EmailUtils.launchEmailSubmission(
                                          toEmail: 'help@withlyla.com',
                                          subject: 'Help',
                                          body: 'Your feedback below: \n');
                                    }),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            R.assets.graphics.fail.path,
                            height: 171.h,
                            width: 159.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
