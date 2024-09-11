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

class VerifyYourMailScreenDesktop extends StatefulWidget {
  const VerifyYourMailScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyYourMailScreenDesktop> createState() =>
      _VerifyYourMailScreenDesktopState();
}

class _VerifyYourMailScreenDesktopState
    extends State<VerifyYourMailScreenDesktop> {
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
      // width: 0.368.sw,
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
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 35.h),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 0.368.sw,
                decoration: R.theme.genericCardDecoration,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 35.w, vertical: 28.h),
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubHeading(
                            AppLocalizations.of(context).check_mail,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: R.palette.black,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SubHeading(
                            AppLocalizations.of(context)
                                .verify_your_mail_desc_1,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: R.palette.lightGray,
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          RichText(
                            text: TextSpan(
                              text: AppLocalizations.of(context)
                                  .verify_your_mail_desc_2,
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
                            height: 21.h,
                          ),
                          GenericButton(
                            onPressed: () {
                              sl<Navigation>().push(
                                  context, Routes.verifyYourMailResultRoute);
                            },
                            text: AppLocalizations.of(context).open_mail,
                            fontSize: 20,
                            height: 65,
                            width: 0.368.sw,
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SubHeading(
                                  AppLocalizations.of(context).did_not_receive,
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
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.primaryLightBlue,
                                  ),
                                ),
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
      ),
    );
  }
}
