import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
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

class LoginScreenDesktop extends StatefulWidget {
  const LoginScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreenDesktop> createState() => _LoginScreenDesktopState();
}

class _LoginScreenDesktopState extends State<LoginScreenDesktop> {
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
        appBar: GenericAppBarDesktop(
          leading: SizedBox.shrink(),
          trailing: InkWell(
            onTap: () {
              if (context.canPop()) {
                sl<Navigation>().goBack(context);
              } else {
                sl<Navigation>().go(context, Routes.onBoardingRoute);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(right: 67),
              child: Icon(
                Icons.close,
                color: R.palette.mediumBlack,
              ),
            ),
          ),
          showLanguageIcon: false,
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 37.0),
                child: Row(
                  children: [
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: DecoratedBox(
                        decoration: R.theme.genericCardDecoration,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 28),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const LoginFieldCard(),
                                InkWell(
                                  onTap: () {
                                    viewModel.toggleKeepSignedIn();
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SquareBox(
                                        checkValue: viewModel.isKeepSignedIn,
                                        squareBoxSize: 20,
                                        iconSize: 15,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: SubHeading2(
                                          AppLocalizations.of(context)
                                              .keep_me_signed_in,
                                          fontSize: 16,
                                          color:
                                              R.palette.textFieldHintGreyColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: R.theme.interRegular,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .keep_me_signed_in_note,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: R.palette.textFieldHintGreyColor,
                                  maxLines: 5,
                                ),
                                SizedBox(
                                  height: 19,
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
                                        squareBoxSize: 20,
                                        iconSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: TermsAndCondtions(
                                        fontFamily: R.theme.interRegular,
                                        title: AppLocalizations.of(context)
                                            .login_term,
                                        fontSize: 16,
                                        link: AppLocalizations.of(context)
                                            .login_term_business,
                                        subTitle: AppLocalizations.of(context)
                                            .login_term_privacy_policy,
                                        onPrivacyPress: () {
                                          _showDialog(
                                            context,
                                            TermsAndPolicyPopup(
                                              title:
                                                  AppLocalizations.of(context)
                                                      .txt_privacy_policy,
                                              subtitle:
                                                  AppLocalizations.of(context)
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
                                              title:
                                                  AppLocalizations.of(context)
                                                      .txt_terms_of_business,
                                              subtitle:
                                                  AppLocalizations.of(context)
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
                                  height: 25,
                                ),
                                Center(
                                  child: AppButton.generic(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        // KeyValueStorageServiceImpl.instance.setKeyValue(isLoggedIn, true);]
                                        loginViewModel.setLoginState(
                                            viewModel.isKeepSignedIn);
                                        sl<Navigation>().replace(
                                            context, Routes.onBoardingRoute);
                                      }
                                    },
                                    text: AppLocalizations.of(context).sign_in,
                                    fontSize: 20,
                                    height: 65,
                                    isEnable: viewModel.acceptPolicy,
                                  ),
                                ),
                                SizedBox(
                                  height: 21,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      Future.delayed(Duration.zero, () {
                                        sl<Navigation>().push(
                                            // ignore: use_build_context_synchronously
                                            context,
                                            Routes.forgotPasswordRoute);
                                      });
                                    },
                                    child: SubHeading2(
                                      AppLocalizations.of(context)
                                          .forget_password,
                                      color: R.palette.appPrimaryBlue,
                                      fontFamily: R.theme.interRegular,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Wrap(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      SubHeading(
                                        AppLocalizations.of(context)
                                            .dont_have_account,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: R.palette.textFieldHintGreyColor,
                                        maxLines: 5,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          final routeIsExist = sl<Navigation>()
                                              .routeExists(Routes.signUpRoute);

                                          if (routeIsExist) {
                                            sl<Navigation>().popUntil(
                                                context, Routes.signUpRoute);
                                          } else {
                                            sl<Navigation>().push(
                                                context, Routes.signUpRoute);
                                          }
                                        },
                                        child: SubHeading2(
                                          AppLocalizations.of(context)
                                              .create_account,
                                          color: R.palette.appPrimaryBlue,
                                          fontFamily: R.theme.interRegular,
                                          fontSize: 16,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
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
