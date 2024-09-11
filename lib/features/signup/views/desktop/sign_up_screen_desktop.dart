import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/terms_and_policy_popup.dart';
import 'package:travelbox/features/signup/widget/sign_up_field_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/date_time_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_rich_text.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class SignUpScreenDesktop extends StatefulWidget {
  const SignUpScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreenDesktop> createState() => _SignUpScreenDesktopState();
}

class _SignUpScreenDesktopState extends State<SignUpScreenDesktop> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<BasicInfoViewModel>(),
      builder: (context, child) {
        return SignUpScreenContent(formKey: _formKey);
      },
    );
  }
}

class SignUpScreenContent extends StatelessWidget {
  const SignUpScreenContent({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicInfoViewModel>();
    return SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GenericAppBarDesktop(
                          trailing: InkWell(
                            onTap: (){
                              if(context.canPop()){
                                sl<Navigation>().goBack(context);
                              }
                              else{
                                sl<Navigation>().go(context, Routes.onBoardingRoute);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 25.w),
                              child: Icon(
                                Icons.close,
                                color: R.palette.mediumBlack,
                              ),
                            ),
                          ),
                          leading: const SizedBox(),
                          showLanguageIcon: false,
                        ),
                        SizedBox(
                          height: 37.h,
                        ),
                        Container(
                          width: 0.618.sw,
                          decoration: R.theme.genericCardDecoration,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 28.w, vertical: 35.h),
                            child: Column(
                              children: [
                                const SignUpFieldCardDesktop(),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        viewModel.toggleAcceptPolicy();
                                      },
                                      child: SquareBox(
                                        checkValue: viewModel.acceptPolicy,
                                        squareBoxSize: 20,
                                        iconSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Expanded(
                                      child: TermsAndCondtions(
                                        title: AppLocalizations.of(context)
                                            .agree_to,
                                        fontSize: 16,
                                        link: AppLocalizations.of(context)
                                            .login_term_business,
                                        subTitle: AppLocalizations.of(context)
                                            .login_term_privacy_policy,
                                        color:
                                            R.palette.textFieldHintGreyColor,
                                        onPrivacyPress: () {
                                          _showDialog(
                                            context,
                                            TermsAndPolicyPopup(
                                              title: AppLocalizations.of(context).txt_privacy_policy,
                                              subtitle:
                                                  AppLocalizations.of(context).txt_effective_date(DateTime(2024,1,1).formatToDoPattern),
                                              content: termsData,
                                            ),
                                          );
                                        },
                                        onTermPress: () {
                                          _showDialog(
                                            context,
                                            TermsAndPolicyPopup(
                                              title: AppLocalizations.of(context).txt_terms_of_business,
                                              subtitle:
                                              AppLocalizations.of(context).txt_effective_date(DateTime(2024,1,1).formatToDoPattern),
                                              content: termsData,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        viewModel.toggleNotReceiveMail();
                                      },
                                      child: SquareBox(
                                        checkValue: viewModel.notReceiveMail,
                                        squareBoxSize: 20,
                                        iconSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Expanded(
                                      child: SubHeading(
                                        AppLocalizations.of(context)
                                            .dont_want_receive_email,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            R.palette.textFieldHintGreyColor,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                GenericButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      sl<Navigation>().push(context,
                                          Routes.verifyYourMailRoute);
                                    }
                                  },
                                  text: AppLocalizations.of(context)
                                      .create_account,
                                  fontSize: 20,
                                  height: 65,
                                  width: 0.368.sw,
                                  isEnable: viewModel.acceptPolicy,
                                ),
                                SizedBox(
                                  height: 21.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      SubHeading(
                                        AppLocalizations.of(context)
                                            .have_account,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color:
                                            R.palette.textFieldHintGreyColor,
                                        maxLines: 5,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          final routeIsExist = sl<Navigation>().routeExists(Routes.loginRoute);

                                          if(routeIsExist){
                                            sl<Navigation>()
                                                .popUntil(context, Routes.loginRoute);
                                          }
                                          else{
                                            sl<Navigation>()
                                                .push(context, Routes.loginRoute);
                                          }
                                        },
                                        child: SubHeading2(
                                          AppLocalizations.of(context)
                                              .sign_in,
                                          color: R.palette.appPrimaryBlue,
                                          fontFamily: R.theme.interRegular,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        )
                      ],
                    ),
                  ),),
            ),
          ),
        ),);
  }

  Future<void> _showDialog(BuildContext context, Widget dialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
