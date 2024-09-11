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

class VerifyYourMailResultScreenDesktop extends StatefulWidget {
  final bool isSuccess;
  const VerifyYourMailResultScreenDesktop({super.key, required this.isSuccess});

  @override
  State<VerifyYourMailResultScreenDesktop> createState() =>
      _VerifyYourMailResultScreenDesktopState();
}

class _VerifyYourMailResultScreenDesktopState
    extends State<VerifyYourMailResultScreenDesktop> {
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
  const VerifyYourMailSuccessContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          appBar: GenericAppBarDesktop(
            onLeadingPressed: (){
              sl<Navigation>().goBack(context);
            },
            leading: Icon(
              Icons.arrow_back_ios,
              color: R.palette.mediumBlack,
            ),
            trailing: const SizedBox(),
            showLanguageIcon: false,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 37),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 0.368.sw,
                decoration: R.theme.genericCardDecoration,
                child: Padding(
                  padding: EdgeInsets.only(left: 28, right: 28, top: 29, bottom: 37,),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            R.assets.graphics.success.path,
                            height: 171,
                            width: 159,
                          ),
                        ),
                        SizedBox(
                          height: 37,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).verification_success,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: R.palette.black,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        SubHeading(
                          AppLocalizations.of(context)
                              .verification_success_desc,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: R.palette.textFieldHintGreyColor,
                        ),
                        SizedBox(
                          height: 37,
                        ),
                        GenericButton(
                          onPressed: () {
                            sl<Navigation>().go(context, Routes.loginRoute);
                          },
                          text: AppLocalizations.of(context).login,
                          fontSize: 18,
                          height: 58,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyYourMailFailContent extends StatelessWidget {
  const VerifyYourMailFailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      // width: 0.5.sw,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          appBar: GenericAppBarDesktop(
            leading: InkWell(
              onTap: () {
                sl<Navigation>().go(context, Routes.signUpRoute);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: R.palette.mediumBlack,
              ),
            ),
            trailing: const SizedBox(),
            showLanguageIcon: false,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 0.35.sw,
                decoration: R.theme.genericCardDecoration,
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(22, 27, 22, 39),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            R.assets.graphics.fail.path,
                            height: 171.h,
                            width: 159.w,
                          ),
                        ),
                        SizedBox(
                          height: 37.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).verification_fail,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: R.palette.black,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: AppLocalizations.of(context)
                                .verification_fail_desc,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: R.theme.interRegular,
                                height: 1.3,
                                color: R.palette.textFieldHintGreyColor),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
