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

class VerifyYourMailScreenMobile extends StatefulWidget {
  const VerifyYourMailScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyYourMailScreenMobile> createState() =>
      _VerifyYourMailScreenMobileState();
}

class _VerifyYourMailScreenMobileState
    extends State<VerifyYourMailScreenMobile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<BasicInfoViewModel>(),
      builder: (context, child) {
        return VerifyYourMailContent(formKey: _formKey);
      },
    );
  }
}

class VerifyYourMailContent extends StatelessWidget {
  const VerifyYourMailContent({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

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
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GenericAppBarMobile(
                      leading: Padding(
                        padding: EdgeInsets.only(right: 9.w),
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
                      height: 27.h,
                    ),
                    Container(
                      width: 0.88.sw,
                      decoration: R.theme.genericCardDecoration,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 28, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeading(
                              AppLocalizations.of(context).check_mail,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: R.palette.black,
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            // SubHeading(
                            //   AppLocalizations.of(context)
                            //       .verify_your_mail_desc_1,
                            //   fontSize: 1.sp,
                            //   fontWeight: FontWeight.w400,
                            //   color: R.palette.textFieldHintGreyColor,
                            // ),
                            RichText(
                              text: TextSpan(
                                text: AppLocalizations.of(context)
                                    .verify_your_mail_desc_1,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.lightGray),
                                children: const <TextSpan>[],
                              ),
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            RichText(
                              text: TextSpan(
                                text: AppLocalizations.of(context)
                                    .verify_your_mail_desc_2,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.lightGray),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "help@withlyla.com",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: R.theme.interRegular,
                                        fontSize: 16,
                                        color: R.palette.appPrimaryBlue,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          EmailUtils.launchEmailSubmission(
                                              toEmail: 'help@withlyla.com',
                                              subject: 'Help',
                                              body: 'Your feedback below: \n');
                                        }),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            GenericButton(
                              radius: 10,
                              onPressed: () {
                                sl<Navigation>().push(
                                    context, Routes.verifyYourMailResultRoute);
                              },
                              text: AppLocalizations.of(context).open_mail,
                              fontSize: 16,
                              height: 47,
                              width: double.infinity,
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .did_not_receive,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: R.theme.interRegular,
                                  color: R.palette.appGreyTextColor,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: SubHeading(
                                    AppLocalizations.of(context).resend,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.primaryLightBlue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
