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

class SignUpScreenMobile extends StatefulWidget {
  const SignUpScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreenMobile> createState() => _SignUpScreenMobileState();
}

class _SignUpScreenMobileState extends State<SignUpScreenMobile> {
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
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GenericAppBarMobile(
                          leading: SizedBox(
                            height: 41.h,
                            width: 41.w,
                          ),
                          trailing: Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: Icon(
                              Icons.close,
                              color: R.palette.mediumBlack,
                            ),
                          ),
                          onTrailingPressed: () {
                            if(context.canPop()){
                              sl<Navigation>().goBack(context);
                            }
                            else{
                              sl<Navigation>().go(context, Routes.onBoardingRoute);
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          decoration: R.theme.genericCardDecoration,
                          child: Column(
                            children: [
                              const SignUpFieldCard(),
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            viewModel.toggleAcceptPolicy();
                                          },
                                          child: SquareBox(
                                            checkValue: viewModel.acceptPolicy,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          child: TermsAndCondtions(
                                            color: R.palette.lightGray,
                                            title: AppLocalizations.of(context)
                                                .agree_to,
                                            fontSize: 14.5,
                                            link: AppLocalizations.of(context)
                                                .login_term_business,
                                            subTitle:
                                                AppLocalizations.of(context)
                                                    .login_term_privacy_policy,
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
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            viewModel.toggleNotReceiveMail();
                                          },
                                          child: SquareBox(
                                            checkValue:
                                                viewModel.notReceiveMail,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          child: SubHeading(
                                            AppLocalizations.of(context)
                                                .dont_want_receive_email,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                            color: R.palette.lightGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25.h,
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
                                      fontSize: 18,
                                      isEnable: viewModel.acceptPolicy,
                                    ),
                                    SizedBox(
                                      height: 32.h,
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SubHeading(
                                      AppLocalizations.of(context).have_account,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                      color: R.palette.lightGray,
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
                                      child: SubHeading(
                                        AppLocalizations.of(context).sign_in,
                                        color: R.palette.appPrimaryBlue,
                                        fontFamily: R.theme.interRegular,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
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
