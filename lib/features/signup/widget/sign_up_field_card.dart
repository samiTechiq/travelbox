import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/validator/validator.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/drop_down/app_dropdown.dart';
import 'package:travelbox/utils/widgets/phone_field/country_picker_dialog.dart';
import 'package:travelbox/utils/widgets/phone_field/intl_phone_field.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';
import 'package:travelbox/utils/widgets/text_fields/app_text_field.dart';

class SignUpFieldCard extends StatelessWidget {
  const SignUpFieldCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: SignUpFieldCardMobile(),
        desktopLayout: SignUpFieldCardDesktop());
  }
}

class SignUpFieldCardMobile extends StatelessWidget {
  const SignUpFieldCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicInfoViewModel>();
    return SizedBox(
      width: double.maxFinite,
      // decoration: R.theme.genericCardDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            SubHeading(
              AppLocalizations.of(context).create_account,
              fontWeight: FontWeight.w600,
              color: R.palette.darkBlack,
              fontFamily: R.theme.interRegular,
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).txt_title_mandatory,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              child: GenericDropDown(
                fillColor: Colors.white,
                borderColor: R.palette.textFieldBorderGreyColor,
                items: [
                  R.stringRes.registerScreen.dropDownMr.hardcoded,
                  R.stringRes.registerScreen.dropDownMis.hardcoded,
                  R.stringRes.registerScreen.dropDownMs.hardcoded,
                  R.stringRes.registerScreen.dropDownMrs.hardcoded,
                  R.stringRes.registerScreen.dropDownDr.hardcoded,
                  R.stringRes.registerScreen.dropDownMaster.hardcoded
                ],
                textStyle: TextStyle(
                  fontFamily: R.theme.interRegular,
                  color: R.palette.mediumBlack,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
                hintTextStyle: TextStyle(
                  fontFamily: R.theme.interRegular,
                  fontSize: 15.sp,
                  color: R.palette.mediumBlack,
                  fontWeight: FontWeight.w500,
                ),
                hintText: R.stringRes.registerScreen.dropDownMr.hardcoded,
                filled: false,
                mapDropDownText: (value) {
                  return Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: R.palette.mediumBlack,
                      fontFamily: R.theme.interRegular,
                      fontSize: 15.sp,
                    ),
                  );
                },
                onDropDownItemChanged: (value) {
                  if (value == null) return;
                  viewModel.setTitle(value);
                },
                dropDownColor: R.palette.white,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).first_name_require,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
              fontFamily: R.theme.interRegular,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              child: GenericTextField(
                hintText: AppLocalizations.of(context).enter_first_name,
                controller: viewModel.firstNameController,
                key: ValueKey(R.stringRes.registerScreen.firstNameHint),
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
                  final pattern = ValidationPattern.name.pattern;
                  final result = sl.get<Validator>().validateInput(
                        value!,
                        pattern: pattern,
                      );
                  if (result != ValidationResult.valid) {
                    return AppLocalizations.of(context).please_enter_a_valid_name;
                  }
                  return null;
                },
                onChange: (value) {
                  viewModel.setFirstName(value);
                },
                verticalContentPadding: 17,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).last_name_require,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
              fontFamily: R.theme.interRegular,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              child: GenericTextField(
                hintText: AppLocalizations.of(context).enter_last_name,
                controller: viewModel.surnameNameController,
                key: ValueKey(R.stringRes.registerScreen.surNameHint),
                verticalContentPadding: 17,
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
                  final pattern = ValidationPattern.name.pattern;
                  final result = sl.get<Validator>().validateInput(
                        value!,
                        pattern: pattern,
                      );
                  if (result != ValidationResult.valid) {
                    return AppLocalizations.of(context).please_enter_a_valid_name;
                  }
                  return null;
                },
                onChange: (value) {
                  viewModel.setSurname(value);
                },
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).email_address,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              child: GenericTextField(
                hintText: AppLocalizations.of(context).enter_email_address,
                controller: viewModel.emailController,
                key: ValueKey(R.stringRes.registerScreen.emailHint),
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
                verticalContentPadding: 17,
                useBottomPadding: false,
                validator: (value) {
                  final pattern = ValidationPattern.email.pattern;
                  final result = sl.get<Validator>().validateInput(
                        value!,
                        pattern: pattern,
                      );
                  if (result != ValidationResult.valid) {
                    return AppLocalizations.of(context).please_enter_a_valid_email;
                  }
                  return null;
                },
                onChange: (value) {
                  viewModel.setEmail(value);
                },
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).mobile_number,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              child: IntlPhoneField(
                height: 55.h,
                searchTextStyle: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: R.theme.interRegular,
                ),
                pickerDialogStyle: PickerDialogStyle(
                  backgroundColor: R.palette.appWhiteColor,
                  countryNameStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: R.theme.interRegular,
                    color: R.palette.black,
                  ),
                ),
                controller: viewModel.mobileController,
                showCursor: true,
                cursorWidth: 1,
                style: TextStyle(
                  color: R.palette.mediumBlack,
                  fontSize: 15.sp,
                  fontFamily: R.theme.interRegular,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: R.palette.textFieldHintGreyColor,
                dropdownIconPosition: IconPosition.trailing,
                flagsButtonPadding: const EdgeInsets.symmetric(vertical: 0),
                disableLengthCheck: true,
                dropdownIcon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: R.palette.textFieldHintGreyColor,
                ),
                dropdownTextStyle: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: R.theme.interRegular,
                  fontWeight: FontWeight.w500,
                  color: R.palette.mediumBlack,
                ),
                flagsButtonMargin: EdgeInsets.only(left: 2.w),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).txt_enter_number_hint,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isDense: true,
                  labelStyle: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: R.theme.interRegular,
                    fontWeight: FontWeight.w500,
                    color: R.palette.mediumBlack,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: R.palette.textFieldBorderGreyColor),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: R.palette.textFieldBorderGreyColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(12),
                ],
                initialCountryCode: 'HK'.hardcoded,
                onChanged: (phone) {
                  if (phone.number.length < 10) {
                    viewModel.setPhoneNumberError(
                        AppLocalizations.of(context).msg_error_please_enter_a_mobile_number);
                  }
                  final pattern = ValidationPattern.phone.pattern;
                  final result = sl.get<Validator>().validateInput(
                        phone.number,
                        pattern: pattern,
                      );
                  if (result != ValidationResult.valid) {
                    viewModel.setPhoneNumberError(
                        AppLocalizations.of(context).msg_error_please_enter_a_mobile_number);
                  } else {
                    viewModel.setPhoneNumberError(null);
                  }

                  viewModel.setMobile(phone.completeNumber);
                },
              ),
            ),
            if (viewModel.phoneNumberError != null) ...[
              SizedBox(
                height: 4.h,
              ),
              Text(
                viewModel.phoneNumberError!,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: R.theme.interRegular,
                  fontWeight: FontWeight.w500,
                  color: R.palette.errorRed,
                ),
              ),
            ],
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).password,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
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
                verticalContentPadding: 17,
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
              height: 10.h,
            ),
            SizedBox(
              child: GenericTextField(
                hintText: AppLocalizations.of(context).enter_confirm_password,
                controller: viewModel.confirmPasswordNameController,
                key: ValueKey(
                    AppLocalizations.of(context).enter_confirm_password),
                verticalContentPadding: 17,
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
                  viewModel.setConfirmPassword(value);
                },
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

class SignUpFieldCardDesktop extends StatelessWidget {
  const SignUpFieldCardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicInfoViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(
            AppLocalizations.of(context).create_account,
            fontWeight: FontWeight.w600,
            color: R.palette.darkBlack,
            fontSize: 22,
          ),
          SizedBox(
            height: 25.h,
          ),
          SubHeading(
            AppLocalizations.of(context).txt_title_mandatory,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: R.palette.lightGray,
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            height: 47.h,
            child: GenericDropDown(
              fillColor: Colors.white,
              borderColor: R.palette.textFieldBorderGreyColor,
              items: [
                R.stringRes.registerScreen.dropDownMr.hardcoded,
                R.stringRes.registerScreen.dropDownMis.hardcoded,
                R.stringRes.registerScreen.dropDownMs.hardcoded,
                R.stringRes.registerScreen.dropDownMrs.hardcoded,
                R.stringRes.registerScreen.dropDownDr.hardcoded,
                R.stringRes.registerScreen.dropDownMaster.hardcoded,
              ],
              textStyle: TextStyle(
                fontFamily: R.theme.interRegular,
                color: R.palette.mediumBlack,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              hintTextStyle: TextStyle(
                fontFamily: R.theme.interRegular,
                fontSize: 15.sp,
                color: R.palette.mediumBlack,
                fontWeight: FontWeight.w600,
              ),
              hintText: R.stringRes.registerScreen.dropDownMr.hardcoded,
              filled: false,
              mapDropDownText: (value) {
                return Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: R.palette.mediumBlack,
                    fontSize: 15.sp,
                  ),
                );
              },
              onDropDownItemChanged: (value) {
                if (value == null) return;
                viewModel.setTitle(value);
              },
              dropDownColor: R.palette.white,
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).first_name_require,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      // height: 47.h,
                      child: GenericTextField(
                        hintText: AppLocalizations.of(context).enter_first_name,
                        controller: viewModel.firstNameController,
                        key: ValueKey(R.stringRes.registerScreen.firstNameHint),
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                          color: R.palette.mediumBlack,
                        ),
                        textStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w600,
                          color: R.palette.mediumBlack,
                        ),
                        useBottomPadding: false,
                        validator: (value) {
                          final pattern = ValidationPattern.name.pattern;
                          final result = sl.get<Validator>().validateInput(
                                value!,
                                pattern: pattern,
                              );
                          if (result != ValidationResult.valid) {
                            return AppLocalizations.of(context).please_enter_a_valid_name;
                          }
                          return null;
                        },
                        onChange: (value) {
                          viewModel.setFirstName(value);
                        },
                        // verticalContentPadding: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).last_name_require,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: R.palette.mediumBlack,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      // height: 47.h,
                      child: GenericTextField(
                        hintText: AppLocalizations.of(context).enter_last_name,
                        controller: viewModel.surnameNameController,
                        key: ValueKey(R.stringRes.registerScreen.firstNameHint),
                        // verticalContentPadding: 15,
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                          color: R.palette.mediumBlack,
                        ),
                        textStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w600,
                          color: R.palette.mediumBlack,
                        ),
                        useBottomPadding: false,
                        validator: (value) {
                          final pattern = ValidationPattern.name.pattern;
                          final result = sl.get<Validator>().validateInput(
                                value!,
                                pattern: pattern,
                              );
                          if (result != ValidationResult.valid) {
                            return AppLocalizations.of(context).please_enter_a_valid_name;
                          }
                          return null;
                        },
                        onChange: (value) {
                          viewModel.setSurname(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).email_address,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      // height: 47.h,
                      child: GenericTextField(
                        hintText:
                            AppLocalizations.of(context).enter_email_address,
                        controller: viewModel.emailController,
                        key: ValueKey(R.stringRes.registerScreen.emailHint),
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                          color: R.palette.mediumBlack,
                        ),
                        textStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w600,
                          color: R.palette.mediumBlack,
                        ),
                        // verticalContentPadding: 15,
                        useBottomPadding: false,
                        validator: (value) {
                          final pattern = ValidationPattern.email.pattern;
                          final result = sl.get<Validator>().validateInput(
                                value!,
                                pattern: pattern,
                              );
                          if (result != ValidationResult.valid) {
                            return AppLocalizations.of(context).please_enter_a_valid_email;
                          }
                          return null;
                        },
                        onChange: (value) {
                          viewModel.setEmail(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).mobile_number,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      // height: 47.h,
                      child: IntlPhoneField(
                        searchTextStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.interRegular,
                        ),
                        pickerDialogStyle: PickerDialogStyle(
                          backgroundColor: R.palette.appWhiteColor,
                          countryNameStyle: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: R.theme.interRegular,
                            color: R.palette.textFieldHintGreyColor,
                          ),
                        ),
                        controller: viewModel.mobileController,
                        showCursor: true,
                        cursorWidth: 1,
                        style: TextStyle(
                          color: R.palette.mediumBlack,
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w500,
                        ),
                        cursorColor: R.palette.textFieldHintGreyColor,
                        dropdownIconPosition: IconPosition.trailing,
                        flagsButtonPadding: EdgeInsets.symmetric(vertical: 12.h),
                        disableLengthCheck: true,
                        dropdownIcon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: R.palette.textFieldHintGreyColor,
                        ),
                        dropdownTextStyle: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w500,
                          color: R.palette.mediumBlack,
                        ),
                        flagsButtonMargin: EdgeInsets.only(left: 1.w),
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).txt_enter_number_hint,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                          isDense: true,
                          labelStyle: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w500,
                            color: R.palette.mediumBlack,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: R.palette.textFieldBorderGreyColor),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: R.palette.textFieldBorderGreyColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(12),
                        ],
                        initialCountryCode: 'HK'.hardcoded,
                        onChanged: (phone) {
                          if (phone.number.length < 10) {
                            viewModel.setPhoneNumberError(AppLocalizations.of(context).msg_error_please_enter_a_mobile_number);
                          }
                          final pattern = ValidationPattern.phone.pattern;
                          final result = sl.get<Validator>().validateInput(
                                phone.number,
                                pattern: pattern,
                              );
                          if (result != ValidationResult.valid) {
                            viewModel.setPhoneNumberError(AppLocalizations.of(context).msg_error_please_enter_a_mobile_number);
                          } else {
                            viewModel.setPhoneNumberError(null);
                          }

                          viewModel.setMobile(phone.completeNumber);
                        },
                      ),
                    ),
                    if (viewModel.phoneNumberError != null) ...[
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        viewModel.phoneNumberError!,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w500,
                          color: R.palette.errorRed,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).password,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      // height: 47.h,
                      child: GenericTextField(
                        hintText: AppLocalizations.of(context).enter_password,
                        controller: viewModel.passwordNameController,
                        key: ValueKey(
                            AppLocalizations.of(context).enter_first_name),
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
                            return AppLocalizations.of(context)
                                .incorrect_password;
                          }
                          return null;
                        },
                        onChange: (value) {
                          viewModel.setPassword(value);
                        },
                        // verticalContentPadding: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).confirm_password,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      // height: 47.h,
                      child: GenericTextField(
                        hintText:
                            AppLocalizations.of(context).enter_confirm_password,
                        controller: viewModel.confirmPasswordNameController,
                        key: ValueKey(AppLocalizations.of(context)
                            .enter_confirm_password),
                        verticalContentPadding: 15,
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
                            return AppLocalizations.of(context)
                                .incorrect_password;
                          }
                          return null;
                        },
                        onChange: (value) {
                          viewModel.setConfirmPassword(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
