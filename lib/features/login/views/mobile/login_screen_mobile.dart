import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/login/model/user.dart';
import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart';
import 'package:travelbox/features/login/widget/login_field_card.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/terms_and_policy_popup.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/date_time_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_rich_text.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreenMobile> createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<LoginScreenMobile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<BasicInfoViewModel>(),
      builder: (context, child) {
        return LoginScreenContent(formKey: _formKey);
      },
    );
  }
}

class LoginScreenContent extends StatelessWidget {
  const LoginScreenContent({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicInfoViewModel>();
    final loginViewModel = context.watch<LoginViewmodel>();
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: R.palette.appBackgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GenericAppBarMobile(
                  leading: SizedBox(
                    width: 50,
                  ),
                  trailing: Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Icon(
                      Icons.close,
                      color: R.palette.mediumBlack,
                    ),
                  ),
                  onTrailingPressed: () {
                    if (context.canPop()) {
                      sl<Navigation>().goBack(context);
                    } else {
                      sl<Navigation>().go(context, Routes.onBoardingRoute);
                    }
                  },
                ),
                SizedBox(
                  height: 27,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: DecoratedBox(
                    decoration: R.theme.genericCardDecoration,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          const LoginFieldCard(),
                          InkWell(
                            onTap: () {
                              viewModel.toggleKeepSignedIn();
                            },
                            child: Row(
                              children: [
                                SquareBox(
                                  checkValue: viewModel.isKeepSignedIn,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: SubHeading(
                                    AppLocalizations.of(context)
                                        .keep_me_signed_in,
                                    fontSize: 16,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.lightGray,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SubHeading(
                            AppLocalizations.of(context).keep_me_signed_in_note,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: R.palette.lightGray,
                            fontFamily: R.theme.interRegular,
                            maxLines: 5,
                          ),
                          SizedBox(
                            height: 29,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                width: 12,
                              ),
                              Expanded(
                                child: TermsAndCondtions(
                                  color: R.palette.lightGray,
                                  fontFamily: R.theme.interRegular,
                                  title:
                                      AppLocalizations.of(context).login_term,
                                  fontSize: 14.5,
                                  link: AppLocalizations.of(context)
                                      .login_term_business,
                                  subTitle: AppLocalizations.of(context)
                                      .login_term_privacy_policy,
                                  onPrivacyPress: () {
                                    _showDialog(
                                      context,
                                      TermsAndPolicyPopup(
                                        title: AppLocalizations.of(context)
                                            .txt_privacy_policy,
                                        subtitle: AppLocalizations.of(context)
                                            .txt_effective_date(
                                          DateTime(2024, 1, 1)
                                              .formatToDoPattern,
                                        ),
                                        content: termsData,
                                      ),
                                    );
                                  },
                                  onTermPress: () {
                                    _showDialog(
                                      context,
                                      TermsAndPolicyPopup(
                                        title: AppLocalizations.of(context)
                                            .txt_terms_of_business,
                                        subtitle: AppLocalizations.of(context)
                                            .txt_effective_date(
                                          DateTime(2024, 1, 1)
                                              .formatToDoPattern,
                                        ),
                                        content: termsData,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 31,
                          ),
                          AppButton.generic(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                loginViewModel
                                    .setLoginState(viewModel.isKeepSignedIn);
                                User user = User(email: viewModel.email);
                                loginViewModel.setUser(user);
                                sl<Navigation>()
                                    .replace(context, Routes.onBoardingRoute);
                              }
                            },
                            text: AppLocalizations.of(context).sign_in,
                            fontSize: 18,
                            height: 50,
                            isEnable: viewModel.acceptPolicy,
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Future.delayed(Duration.zero, () {
                                  sl<Navigation>()
                                      // ignore: use_build_context_synchronously
                                      .push(
                                          context, Routes.forgotPasswordRoute);
                                });
                              },
                              child: SubHeading(
                                AppLocalizations.of(context).forget_password,
                                color: R.palette.appPrimaryBlue,
                                fontFamily: R.theme.interRegular,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .dont_have_account,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  fontFamily: R.theme.interRegular,
                                  color: R.palette.lightGray,
                                  maxLines: 5,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    final routeIsExist = sl<Navigation>()
                                        .routeExists(Routes.signUpRoute);

                                    if (routeIsExist) {
                                      sl<Navigation>().popUntil(
                                          context, Routes.signUpRoute);
                                    } else {
                                      sl<Navigation>()
                                          .push(context, Routes.signUpRoute);
                                    }
                                  },
                                  child: SubHeading(
                                    AppLocalizations.of(context).create_account,
                                    color: R.palette.appPrimaryBlue,
                                    fontFamily: R.theme.interRegular,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 57,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
