import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/network/network.dart';
import 'package:travelbox/features/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/core/validator/validator.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';
import 'package:travelbox/utils/widgets/text_fields/app_text_field.dart';

class ForgotPasswordCard extends StatelessWidget {
  final bool disableEmailValidator;
  final _formKey = GlobalKey<FormState>();
  final viewModel = sl.get<ForgotPasswordViewModel>();

  ForgotPasswordCard({super.key, required this.disableEmailValidator});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: ForgotPasswordCardMobile(
        disableEmailValidator: disableEmailValidator,
        formKey: _formKey,
        viewModel: viewModel,
      ),
      desktopLayout: ForgotPasswordCardDesktop(
        disableEmailValidator: disableEmailValidator,
        formKey: _formKey,
        viewModel: viewModel,
      ),
    );
  }
}

class ForgotPasswordCardMobile extends StatelessWidget {
  final bool disableEmailValidator;
  final GlobalKey<FormState> formKey;
  final ForgotPasswordViewModel viewModel;

  const ForgotPasswordCardMobile({
    super.key,
    required this.disableEmailValidator,
    required this.formKey,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: double.infinity,
        child: SizedBox(
          width: 0.88.sw,
          child: Container(
            decoration: R.theme.genericCardDecoration,
            child: Padding(
              padding: EdgeInsets.only(
                left: 28.w,
                right: 28.w,
                top: 30.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubHeading(
                    AppLocalizations.of(context).forgot_password,
                    fontWeight: FontWeight.w600,
                    color: R.palette.black,
                    fontFamily: R.theme.interRegular,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  SubHeading(
                    AppLocalizations.of(context).email,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: R.palette.lightGray,
                    fontFamily: R.theme.interRegular,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GenericTextField(
                    key: ValueKey(AppLocalizations.of(context).email),
                    hintText: AppLocalizations.of(context).enter_email_address,
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: R.theme.interRegular,
                      fontWeight: FontWeight.w500,
                      color: R.palette.mediumBlack,
                    ),
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: R.theme.interRegular,
                      fontWeight: FontWeight.w500,
                      color: R.palette.mediumBlack,
                    ),
                    controller: viewModel.emailController,
                    validator: disableEmailValidator
                        ? null
                        : (value) {
                            final pattern = ValidationPattern.email.pattern;
                            final result = sl.get<Validator>().validateInput(
                                  value!,
                                  pattern: pattern,
                                );
                            if (result != ValidationResult.valid) {
                              return AppLocalizations.of(context)
                                  .please_enter_a_valid_email;
                            }
                            return null;
                          },
                    onChange: (value) {
                      viewModel.setEmail(value);
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 47.h,
                    child: GenericButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (!await sl<NetworkInfo>().isConnected) {
                            Future.delayed(Duration.zero, () {
                              EasyLoading.showError(
                                  AppLocalizations.of(context).msg_error_no_internet_connection);
                            });
                            return;
                          }
                          Future.delayed(Duration.zero, () {
                            sl<Navigation>().pushWithArgs(
                              // ignore: use_build_context_synchronously
                              context,
                              Routes.checkYouEmailRoute,
                              args: viewModel.email,
                            );
                          });
                        }
                      },
                      text: AppLocalizations.of(context).reset_password,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                      child: SubHeading(
                        AppLocalizations.of(context).back_to_sign_in,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: R.palette.lightGray,
                        fontFamily: R.theme.interRegular,
                      ),
                      onTap: () {
                        sl<Navigation>().goBack(context);
                      }),
                  SizedBox(
                    height: 41.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordCardDesktop extends StatelessWidget {
  final bool disableEmailValidator;
  final GlobalKey<FormState> formKey;
  final ForgotPasswordViewModel viewModel;

  const ForgotPasswordCardDesktop({
    super.key,
    required,
    required this.disableEmailValidator,
    required this.viewModel,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.368.sw,
              child: Container(
                width: double.maxFinite,
                decoration: R.theme.genericCardDecoration,
                child: Padding(
                  padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 35.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeading2(
                        AppLocalizations.of(context).forgot_password,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: R.palette.black,
                        fontFamily: R.theme.interRegular,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SubHeading2(
                        AppLocalizations.of(context).email,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: R.palette.lightGray,
                        fontFamily: R.theme.interRegular,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        child: GenericTextField(
                          key: ValueKey(AppLocalizations.of(context).email),
                          hintText:
                              AppLocalizations.of(context).enter_email_address,
                          hintStyle: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                            color: R.palette.mediumBlack,
                          ),
                          textStyle: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w500,
                            color: R.palette.mediumBlack,
                          ),
                          controller: viewModel.emailController,
                          validator: disableEmailValidator
                              ? null
                              : (value) {
                                  final pattern =
                                      ValidationPattern.email.pattern;
                                  final result =
                                      sl.get<Validator>().validateInput(
                                            value!,
                                            pattern: pattern,
                                          );
                                  if (result != ValidationResult.valid) {
                                    return AppLocalizations.of(context)
                                        .please_enter_a_valid_email;
                                  }
                                  return null;
                                },
                          onChange: (value) {
                            viewModel.setEmail(value);
                          },
                          // contentPadding: const EdgeInsets.symmetric(vertical: 13),
                        ),
                      ),
                      SizedBox(
                        height: 39.h,
                      ),
                      SizedBox(
                        width: 0.368.sw,
                        child: GenericButton(
                          height: 65,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (!await sl<NetworkInfo>().isConnected) {
                                Future.delayed(Duration.zero, () {
                                  EasyLoading.showError(
                                      AppLocalizations.of(context).msg_error_no_internet_connection);
                                });
                                return;
                              }
                              Future.delayed(Duration.zero, () {
                                sl<Navigation>().pushWithArgs(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  Routes.checkYouEmailRoute,
                                  args: viewModel.email,
                                );
                              });
                            }
                          },
                          text: AppLocalizations.of(context).reset_password,
                          textSize: 18.h,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      InkWell(
                          child: SubHeading(
                            AppLocalizations.of(context).back_to_sign_in,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: R.palette.textFieldHintGreyColor,
                          ),
                          onTap: () {
                            sl<Navigation>().goBack(context);
                          }),
                      SizedBox(
                        height: 32.h,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
