import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/validator/validator.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';
import 'package:travelbox/utils/widgets/text_fields/app_generic_text_field.dart';

class LoginFieldCard extends StatelessWidget {
  const LoginFieldCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: LoginFieldCardMobile(),
        desktopLayout: LoginFieldCardDesktop(),
    );
  }
}

class LoginFieldCardMobile extends StatelessWidget {
  const LoginFieldCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicInfoViewModel>();
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(
            AppLocalizations.of(context).sign_in_or_create_account,
            fontWeight: FontWeight.w600,
            color: R.palette.darkBlack,
            fontFamily: R.theme.interRegular,
          ),
          SizedBox(
            height: 28,
          ),
          SubHeading(
            AppLocalizations.of(context).email_address,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: R.palette.lightGray,
            fontFamily: R.theme.interRegular,
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            child: AppGenericTextFieldMobile(
              hintText: AppLocalizations.of(context).enter_email_address,
              key: ValueKey(AppLocalizations.of(context).enter_email_address),
              controller: viewModel.emailController,
              hintStyle: TextStyle(
                fontSize: 15,
                fontFamily: R.theme.interRegular,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: R.palette.mediumBlack,
              ),
              textStyle: TextStyle(
                fontSize: 15,
                fontFamily: R.theme.interRegular,
                fontWeight: FontWeight.w500,
                color: R.palette.mediumBlack,
              ),
              useBottomPadding: false,
              validator: (value) {
                final pattern = ValidationPattern.email.pattern;
                final result = sl.get<Validator>().validateInput(
                      value!,
                      pattern: pattern,
                    );
                if (result != ValidationResult.valid) {
                  return AppLocalizations.of(context).incorrect_email_address;
                }
                return null;
              },
              onChange: (value) {
                viewModel.setEmail(value);
              },
              verticalContentPadding: 16,

            ),
          ),
          SizedBox(
            height: 25,
          ),
          SubHeading(
            AppLocalizations.of(context).password,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: R.palette.lightGray,
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            child: AppGenericTextFieldMobile(
              hintText: AppLocalizations.of(context).enter_password,
              key: ValueKey(AppLocalizations.of(context).enter_password),
              controller: viewModel.passwordNameController,
              hintStyle: TextStyle(
                fontSize: 15,
                fontFamily: R.theme.interRegular,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: R.palette.mediumBlack,
              ),
              textStyle: TextStyle(
                fontSize: 15,
                fontFamily: R.theme.interRegular,
                fontWeight: FontWeight.w500,
                color: R.palette.mediumBlack,
              ),
              useBottomPadding: false,
              validator: (value) {
                final pattern = ValidationPattern.password.pattern;
                final result = sl.get<Validator>().validateInput(
                      value!,
                      pattern: pattern,
                    );
                if (result != ValidationResult.valid) {
                  return AppLocalizations.of(context).incorrect_password;
                }
                return null;
              },
              onChange: (value) {
                viewModel.setPassword(value);
              },
              verticalContentPadding: 16,
              isObscure: !viewModel.isShowPassword,
              trailingIcon: InkWell(
                onTap: () {
                  viewModel.toggleIsShowPassword();
                },
                child: SvgPicture.asset(
                  viewModel.isShowPassword == true
                      ? R.assets.graphics.eyeOff.path
                      : R.assets.graphics.eyeOn.path,
                  width: 23,
                  height: 23,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}

class LoginFieldCardDesktop extends StatelessWidget {
  const LoginFieldCardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicInfoViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SubHeading(
          AppLocalizations.of(context).sign_in_or_create_account,
          fontWeight: FontWeight.w600,
          color: R.palette.darkBlack,
          fontSize: 22,
        ),
        SizedBox(
          height: 25,
        ),
        SubHeading(
          AppLocalizations.of(context).email_address,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: R.palette.lightGray,
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 47,
          child: AppGenericTextFieldDesktop(
            hintText: AppLocalizations.of(context).enter_email_address,
            key: ValueKey(AppLocalizations.of(context).enter_email_address),
            controller: viewModel.emailController,
            hintStyle: TextStyle(
              fontSize: 15,
              fontFamily: R.theme.interRegular,
              fontWeight: FontWeight.w500,
              height: 1.3,
              color: R.palette.mediumBlack,
            ),
            textStyle: TextStyle(
              fontSize: 15,
              fontFamily: R.theme.interRegular,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
            useBottomPadding: false,
            validator: (value) {
              final pattern = ValidationPattern.email.pattern;
              final result = sl.get<Validator>().validateInput(
                    value!,
                    pattern: pattern,
                  );
              if (result != ValidationResult.valid) {
                return AppLocalizations.of(context).incorrect_email_address;
              }
              return null;
            },
            onChange: (value) {
              viewModel.setEmail(value);
            },
            // verticalContentPadding: 15,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        SubHeading(
          AppLocalizations.of(context).password,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: R.palette.mediumBlack,
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 47,
          child: AppGenericTextFieldDesktop(
            hintText: AppLocalizations.of(context).enter_password,
            key: ValueKey(AppLocalizations.of(context).enter_password),
            controller: viewModel.passwordNameController,
            hintStyle: TextStyle(
              fontSize: 15,
              fontFamily: R.theme.interRegular,
              fontWeight: FontWeight.w500,
              height: 1.3,
              color: R.palette.mediumBlack,
            ),
            textStyle: TextStyle(
              fontSize: 15,
              fontFamily: R.theme.interRegular,
              fontWeight: FontWeight.w500,
              color: R.palette.mediumBlack,
            ),
            useBottomPadding: false,
            validator: (value) {
              final pattern = ValidationPattern.password.pattern;
              final result = sl.get<Validator>().validateInput(
                    value!,
                    pattern: pattern,
                  );
              if (result != ValidationResult.valid) {
                return AppLocalizations.of(context).incorrect_password;
              }
              return null;
            },
            onChange: (value) {
              viewModel.setPassword(value);
            },
            // verticalContentPadding: 15,
            isObscure: !viewModel.isShowPassword,
            trailingIcon: InkWell(
              onTap: () {
                viewModel.toggleIsShowPassword();
              },
              child: SvgPicture.asset(
                viewModel.isShowPassword == true
                    ? R.assets.graphics.eyeOff.path
                    : R.assets.graphics.eyeOn.path,
                width: 25,
                height: 25,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
