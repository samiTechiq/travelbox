import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/validator/validator.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';
import 'package:travelbox/utils/widgets/text_fields/app_text_field.dart';

class SetNewPasswordFieldCard extends StatelessWidget {
  const SetNewPasswordFieldCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: SetNewPasswordFieldCardMobile(),
        desktopLayout: SetNewPasswordFieldCardDesktop());
  }
}

class SetNewPasswordFieldCardMobile extends StatelessWidget {
  const SetNewPasswordFieldCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicInfoViewModel>();
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(
              AppLocalizations.of(context).set_new_password,
              fontWeight: FontWeight.w600,
              color: R.palette.darkBlack,
              fontFamily: R.theme.interRegular,
              fontSize: 20,
            ),
            SizedBox(
              height: 30.h,
            ),
            SubHeading(
              AppLocalizations.of(context).password,
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
                hintText: AppLocalizations.of(context).enter_password,
                controller: viewModel.passwordNameController,
                key: ValueKey(AppLocalizations.of(context).enter_first_name),
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: R.theme.interRegular,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  color: R.palette.mediumBlack,
                ),
                textStyle: TextStyle(
                  fontSize: 15.sp,
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
                isObscure: !viewModel.isShowPassword,
                trailingIcon: InkWell(
                  onTap: () {
                    viewModel.toggleIsShowPassword();
                  },
                  child: SvgPicture.asset(
                    viewModel.isShowPassword == true
                        ? R.assets.graphics.eyeOff.path
                        : R.assets.graphics.eyeOn.path,
                    width: 27.w,
                    height: 27.h,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).confirm_password,
              fontSize: 16,
              fontFamily: R.theme.interRegular,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              child: GenericTextField(
                hintText: AppLocalizations.of(context).enter_confirm_password,
                controller: viewModel.confirmPasswordNameController,
                key: ValueKey(
                    AppLocalizations.of(context).enter_confirm_password),
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: R.theme.interRegular,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  color: R.palette.mediumBlack,
                ),
                textStyle: TextStyle(
                  fontSize: 15.sp,
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
                  } else if (value.trim() != viewModel.password?.trim()) {
                    return AppLocalizations.of(context).password_does_not_match;
                  }
                  return null;
                },
                onChange: (value) {
                  viewModel.setConfirmPassword(value);
                },
                isObscure: !viewModel.isShowConfirmPassword,
                trailingIcon: InkWell(
                  onTap: () {
                    viewModel.toggleIsShowConfirmPassword();
                  },
                  child: SvgPicture.asset(
                    viewModel.isShowConfirmPassword == true
                        ? R.assets.graphics.eyeOff.path
                        : R.assets.graphics.eyeOn.path,
                    width: 27.w,
                    height: 27.h,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}

class SetNewPasswordFieldCardDesktop extends StatelessWidget {
  const SetNewPasswordFieldCardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicInfoViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(
            AppLocalizations.of(context).set_new_password,
            fontWeight: FontWeight.w600,
            color: R.palette.darkBlack,
            fontSize: 22,
          ),
          SizedBox(
            height: 25.h,
          ),
          SubHeading(
            AppLocalizations.of(context).password,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: R.palette.lightGray,
            fontFamily: R.theme.interRegular,
          ),
          SizedBox(
            height: 12.h,
          ),
          GenericTextField(
            hintText: AppLocalizations.of(context).enter_password,
            controller: viewModel.passwordNameController,
            key: ValueKey(AppLocalizations.of(context).enter_first_name),
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
            isObscure: !viewModel.isShowPassword,
            trailingIcon: InkWell(
              onTap: () {
                viewModel.toggleIsShowPassword();
              },
              child: SvgPicture.asset(
                viewModel.isShowPassword == true
                    ? R.assets.graphics.eyeOff.path
                    : R.assets.graphics.eyeOn.path,
                width: 25.w,
                height: 25.h,
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          SubHeading(
            AppLocalizations.of(context).confirm_password,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: R.palette.lightGray,
          ),
          SizedBox(
            height: 12.h,
          ),
          GenericTextField(
            hintText: AppLocalizations.of(context).enter_confirm_password,
            controller: viewModel.confirmPasswordNameController,
            key: ValueKey(AppLocalizations.of(context).enter_confirm_password),
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
            useBottomPadding: false,
            validator: (value) {
              final pattern = ValidationPattern.password.pattern;
              final result = sl.get<Validator>().validateInput(
                    value!,
                    pattern: pattern,
                  );
              if (result != ValidationResult.valid) {
                return AppLocalizations.of(context).incorrect_password;
              } else if (value.trim() != viewModel.password?.trim()) {
                return AppLocalizations.of(context).password_does_not_match;
              }
              return null;
            },
            onChange: (value) {
              viewModel.setConfirmPassword(value);
            },
            isObscure: !viewModel.isShowConfirmPassword,
            trailingIcon: InkWell(
              onTap: () {
                viewModel.toggleIsShowConfirmPassword();
              },
              child: SvgPicture.asset(
                viewModel.isShowConfirmPassword == true
                    ? R.assets.graphics.eyeOff.path
                    : R.assets.graphics.eyeOn.path,
                width: 25.w,
                height: 25.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
