import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/enum/email_state.dart';
import 'package:travelbox/data/enum/phone_state.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/network/network.dart';
import 'package:travelbox/features/personal_detail/viewmodel/personal_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/widgets/custom_date_picker_dialog.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/core/validator/validator.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/drop_down/app_dropdown.dart';
import 'package:travelbox/utils/widgets/phone_field/country_picker_dialog.dart';
import 'package:travelbox/utils/widgets/phone_field/intl_phone_field.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';
import 'package:travelbox/utils/widgets/text_fields/app_text_field.dart';

class PersonalDetailCard extends StatelessWidget {
  final PersonalDetailViewmodel personalDetailViewmodel;

  const PersonalDetailCard({super.key, required this.personalDetailViewmodel});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: PersonalDetailCardMobile(
          personalDetailViewmodel: personalDetailViewmodel),
      desktopLayout: PersonalDetailCardDesktop(
          personalDetailViewmodel: personalDetailViewmodel),
    );
  }
}

class PersonalDetailCardMobile extends StatelessWidget {
  final PersonalDetailViewmodel personalDetailViewmodel;

  const PersonalDetailCardMobile(
      {super.key, required this.personalDetailViewmodel});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Container(
      width: double.maxFinite,
      decoration: R.theme.genericCardDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            SubHeading(
              AppLocalizations.of(context).personal_details,
              fontWeight: FontWeight.w600,
              color: R.palette.darkBlack,
              fontFamily: R.theme.interRegular,
              fontSize: 22,
            ),
            SizedBox(
              height: 5.h,
            ),
            SubHeading(
              AppLocalizations.of(context).personal_detail_desc,
              fontWeight: FontWeight.w400,
              fontFamily: R.theme.interRegular,
              color: R.palette.lightGray,
              fontSize: 18,
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).title,
              fontSize: 18,
              fontFamily: R.theme.interRegular,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              // height: 47,
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
                hintText: personalDetailViewmodel.title,
                filled: false,
                mapDropDownText: (value) {
                  return Text(
                    value,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: R.palette.mediumBlack,
                        fontFamily: R.theme.interRegular,
                        fontSize: 15.sp),
                  );
                },
                onDropDownItemChanged: (value) {
                  if (value == null) return;
                  personalDetailViewmodel.setTitle(value);
                },
                dropDownColor: R.palette.white,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).first_name,
              fontSize: 18,
              fontFamily: R.theme.interRegular,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
            ),
            GenericTextField(
              hintText: AppLocalizations.of(context).enter_first_name,
              controller: personalDetailViewmodel.firstNameController,
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
              onChange: (value) {
                final pattern = ValidationPattern.name.pattern;
                final result = sl.get<Validator>().validateInput(
                      value!,
                      pattern: pattern,
                    );
                if (result != ValidationResult.valid) {
                  personalDetailViewmodel.setFirstNameError(
                      AppLocalizations.of(context).please_enter_a_valid_name);
                } else {
                  personalDetailViewmodel.setFirstNameError(null);
                }
                personalDetailViewmodel.setFirstName(value);
              },
              verticalContentPadding: 15,
            ),
            if (personalDetailViewmodel.firstNameError != null) ...[
              SizedBox(
                height: 4.h,
              ),
              Text(
                personalDetailViewmodel.firstNameError!,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: R.theme.interRegular,
                  fontWeight: FontWeight.w400,
                  color: R.palette.errorRed,
                ),
              ),
            ],
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).last_name,
              fontSize: 18,
              fontFamily: R.theme.interRegular,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
            ),
            GenericTextField(
              hintText: AppLocalizations.of(context).enter_last_name,
              controller: personalDetailViewmodel.lastNameController,
              key: ValueKey(AppLocalizations.of(context).enter_last_name),
              verticalContentPadding: 15,
              hintStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                fontFamily: R.theme.interRegular,
                height: 1.4,
                color: R.palette.mediumBlack,
              ),
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                fontFamily: R.theme.interRegular,
                color: R.palette.mediumBlack,
              ),
              useBottomPadding: false,
              onChange: (value) {
                final pattern = ValidationPattern.name.pattern;
                final result = sl.get<Validator>().validateInput(
                      value!,
                      pattern: pattern,
                    );
                if (result != ValidationResult.valid) {
                  personalDetailViewmodel.setLastNameError(
                      AppLocalizations.of(context).please_enter_a_valid_name);
                } else {
                  personalDetailViewmodel.setLastNameError(null);
                }
                personalDetailViewmodel.setLastName(value);
              },
            ),
            if (personalDetailViewmodel.lastNameError != null) ...[
              SizedBox(
                height: 4.h,
              ),
              Text(
                personalDetailViewmodel.lastNameError!,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: R.theme.interRegular,
                  fontWeight: FontWeight.w400,
                  color: R.palette.errorRed,
                ),
              ),
            ],
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).date_of_birth,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: R.theme.interRegular,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
            ),
            GenericTextField(
              hintText: R.stringRes.coverPickerScreen.fieldHint,
              controller: personalDetailViewmodel.dateController,
              key: ValueKey(AppLocalizations.of(context).date_of_birth),
              verticalContentPadding: 15,
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                fontFamily: R.theme.interRegular,
                color: R.palette.mediumBlack,
              ),
              hintStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                fontFamily: R.theme.interRegular,
                height: 1.4,
                color: R.palette.mediumBlack,
              ),
              onlyRead: true,
              enableInteractiveSelection: false,
              onTap: () async {
                // DateTime? pickedDate = await showDatePicker(
                //     context: context,
                //     initialDate: DateTime.now(),
                //     firstDate: DateTime(1900),
                //     lastDate: DateTime.now());

                DateTime? pickedDate = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDatePickerDialog(
                      initialDate: selectedDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                  },
                );

                if (pickedDate != null) {
                  personalDetailViewmodel.setDateOfBirth(pickedDate);
                  String formattedDate = DateFormat(
                          R.stringRes.localeHelper.reversePickerDateFormatYYYY)
                      .format(pickedDate);
                  personalDetailViewmodel.dateController.text = formattedDate;
                }
              },
              trailingIcon: Icon(
                Icons.calendar_month_outlined,
                size: 24.h,
                color: R.palette.textFieldHintGreyColor,
              ),
              useBottomPadding: false,
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              AppLocalizations.of(context).contact_details,
              fontWeight: FontWeight.w500,
              color: R.palette.darkBlack,
              fontSize: 22,
            ),
            SizedBox(
              height: 25.h,
            ),
            personalDetailViewmodel.emailState == EmailState.none
                ? SubHeading(
                    AppLocalizations.of(context).email_address,
                    fontSize: 18,
                    fontFamily: R.theme.interRegular,
                    fontWeight: FontWeight.w400,
                    color: R.palette.lightGray,
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).email_address,
                        fontSize: 18,
                        fontFamily: R.theme.interRegular,
                        fontWeight: FontWeight.w400,
                        color: R.palette.lightGray,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                        onTap: () {
                          personalDetailViewmodel
                              .setEmailState(EmailState.none);
                        },
                        child: SvgPicture.asset(
                          R.assets.graphics.edit.path,
                          height: 20,
                        ),
                      )
                    ],
                  ),
            SizedBox(
              height: 10.h,
            ),
            LayoutBuilder(builder: (context, constraints) {
              return GenericTextField(
                hintText: AppLocalizations.of(context).enter_email_address,
                controller: personalDetailViewmodel.emailController,
                key: ValueKey(AppLocalizations.of(context).enter_email_address),
                enable: personalDetailViewmodel.emailState == EmailState.none
                    ? true
                    : false,
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
                filled: personalDetailViewmodel.emailState == EmailState.none
                    ? false
                    : true,
                fillColor: R.palette.textFieldBorderGreyColor,
                verticalContentPadding: 15,
                useBottomPadding: false,
                onChange: (value) {
                  final pattern = ValidationPattern.email.pattern;
                  final result = sl.get<Validator>().validateInput(
                        value!,
                        pattern: pattern,
                      );
                  if (result != ValidationResult.valid) {
                    personalDetailViewmodel.setEmailError(
                        AppLocalizations.of(context)
                            .please_enter_a_valid_email);
                  } else {
                    personalDetailViewmodel.setEmailError(null);
                  }
                  // personalDetailViewmodel.setEmail(value);
                  personalDetailViewmodel.setEmail("collins@gmail.com");
                },
              );
            }),
            SizedBox(
              height: 10.h,
            ),
            if (personalDetailViewmodel.emailError != null) ...[
              SizedBox(
                height: 4.h,
              ),
              Text(
                personalDetailViewmodel.emailError!,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: R.theme.interRegular,
                  fontWeight: FontWeight.w400,
                  color: R.palette.errorRed,
                ),
              ),
            ],
            SizedBox(
              height: 10.h,
            ),
            personalDetailViewmodel.emailState == EmailState.verify
                ? RichText(
                    text: TextSpan(
                      text: "${AppLocalizations.of(context).verified}. ",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: R.theme.interRegular,
                        color: R.palette.lightDarkGreen,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppLocalizations.of(context)
                              .the_email_address_you_use_to_sign,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: R.theme.interRegular,
                            color: R.palette.textFieldHintGreyColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : SubHeading(
                    AppLocalizations.of(context).contact_details_desc,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: R.theme.interRegular,
                    color: R.palette.textFieldHintGreyColor,
                  ),
            SizedBox(
              height: 25.h,
            ),
            personalDetailViewmodel.phoneState == PhoneState.none
                ? SubHeading(
                    AppLocalizations.of(context).mobile_number,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: R.theme.interRegular,
                    color: R.palette.lightGray,
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).mobile_number,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: R.theme.interRegular,
                        color: R.palette.lightGray,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      InkWell(
                        onTap: () {
                          personalDetailViewmodel
                              .setPhoneState(PhoneState.none);
                        },
                        child: SvgPicture.asset(
                          R.assets.graphics.edit.path,
                          height: 20,
                        ),
                      )
                    ],
                  ),
            SizedBox(
              height: 10.h,
            ),
            IntlPhoneField(
              height: 47.h,
              searchTextStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                fontFamily: R.theme.interRegular,
              ),
              pickerDialogStyle: PickerDialogStyle(
                backgroundColor: R.palette.appWhiteColor,
                countryNameStyle: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: R.theme.interRegular,
                  color: R.palette.lightGray,
                ),
              ),
              enabled: personalDetailViewmodel.phoneState == PhoneState.none
                  ? true
                  : false,
              controller: personalDetailViewmodel.mobileController,
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
                fontWeight: FontWeight.w500,
                fontFamily: R.theme.interRegular,
                color: R.palette.mediumBlack,
              ),
              flagsButtonMargin: EdgeInsets.only(left: 0.w),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).txt_enter_number_hint,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                isDense: true,
                filled: personalDetailViewmodel.phoneState == PhoneState.verify
                    ? true
                    : false,
                fillColor: R.palette.textFieldBorderGreyColor,
                labelStyle: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: R.theme.interRegular,
                  color: R.palette.mediumBlack,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: R.palette.textFieldBorderGreyColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: R.palette.textFieldBorderGreyColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: R.palette.textFieldBorderGreyColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(12),
              ],
              initialCountryCode: 'HK',
              onChanged: (phone) {
                if (phone.number.length < 10) {
                  personalDetailViewmodel.setPhoneNumberError(
                      AppLocalizations.of(context).msg_error_please_enter_a_mobile_number);
                }
                final pattern = ValidationPattern.phone.pattern;
                final result = sl.get<Validator>().validateInput(
                      phone.number,
                      pattern: pattern,
                    );
                if (result != ValidationResult.valid) {
                  personalDetailViewmodel.setPhoneNumberError(
                      AppLocalizations.of(context).msg_error_please_enter_a_mobile_number);
                } else {
                  personalDetailViewmodel.setPhoneNumberError(null);
                }

                personalDetailViewmodel.setMobile(phone.completeNumber);
              },
            ),
            if (personalDetailViewmodel.phoneNumberError != null) ...[
              SizedBox(
                height: 4.h,
              ),
              Text(
                personalDetailViewmodel.phoneNumberError!,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: R.theme.interRegular,
                  fontWeight: FontWeight.w400,
                  color: R.palette.errorRed,
                ),
              ),
            ],
            SizedBox(
              height: 14.h,
            ),
            personalDetailViewmodel.phoneState == PhoneState.verify
                ? RichText(
                    text: TextSpan(
                      text: "${AppLocalizations.of(context).verified}. ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: R.theme.interRegular,
                        color: R.palette.lightDarkGreen,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppLocalizations.of(context)
                              .the_mobile_number_is_where_we_will_send_messages_too,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: R.theme.interRegular,
                            color: R.palette.textFieldHintGreyColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context).contact_details_desc_2,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: R.theme.interRegular,
                        color: R.palette.textFieldHintGreyColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppLocalizations.of(context).resend_code,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: R.theme.interRegular,
                            color: R.palette.appPrimaryBlue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              if (personalDetailViewmodel.mobile != null &&
                                  personalDetailViewmodel.phoneNumberError ==
                                      null) {
                                Future.delayed(Duration.zero, () {
                                  sl<Navigation>().pushWithArgs(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    Routes.verifyOtpRoute,
                                    args: personalDetailViewmodel.mobile,
                                  );
                                });
                              }
                            },
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 30.h,
            ),
            SubHeading(
              AppLocalizations.of(context).address,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: R.theme.interRegular,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 14.h,
            ),
            GenericTextField(
              hintText: AppLocalizations.of(context).address_1,
              controller: personalDetailViewmodel.addressOneController,
              key: ValueKey(AppLocalizations.of(context).address_1),
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
              onChange: (value) {
                personalDetailViewmodel.setAddressOne(value);
              },
              verticalContentPadding: 20,
            ),
            SizedBox(
              height: 30.h,
            ),
            GenericTextField(
              hintText: AppLocalizations.of(context).address_2,
              controller: personalDetailViewmodel.addressTwoController,
              key: ValueKey(AppLocalizations.of(context).address_2),
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
              onChange: (value) {
                personalDetailViewmodel.setAddressTwo(value);
              },
              verticalContentPadding: 20,
            ),
            SizedBox(
              height: 30.h,
            ),
            GenericTextField(
              hintText: AppLocalizations.of(context).town_city,
              controller: personalDetailViewmodel.townCityController,
              key: ValueKey(AppLocalizations.of(context).town_city),
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
              onChange: (value) {
                personalDetailViewmodel.setTownCity(value);
              },
              verticalContentPadding: 20,
            ),
            SizedBox(
              height: 30.h,
            ),
            GenericTextField(
              hintText: AppLocalizations.of(context).state_country,
              controller: personalDetailViewmodel.stateCountryController,
              key: ValueKey(AppLocalizations.of(context).state_country),
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
              onChange: (value) {
                personalDetailViewmodel.setStateCountry(value);
              },
              verticalContentPadding: 20,
            ),
            SizedBox(
              height: 30.h,
            ),
            GenericTextField(
              hintText: AppLocalizations.of(context).postcode,
              controller: personalDetailViewmodel.postCodeController,
              key: ValueKey(AppLocalizations.of(context).postcode),
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
              onChange: (value) {
                final pattern = ValidationPattern.postCode.pattern;
                final result = sl.get<Validator>().validateInput(
                      value!,
                      pattern: pattern,
                    );
                if (result != ValidationResult.valid) {
                  personalDetailViewmodel.setPostcodeError(
                      AppLocalizations.of(context)
                          .please_enter_a_valid_postcode);
                } else {
                  personalDetailViewmodel.setPostcodeError(null);
                }
                personalDetailViewmodel.setPostcode(value);
              },
              verticalContentPadding: 20,
            ),
            if (personalDetailViewmodel.postCodeError != null) ...[
              SizedBox(
                height: 4.h,
              ),
              Text(
                personalDetailViewmodel.postCodeError!,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: R.theme.interRegular,
                  fontWeight: FontWeight.w500,
                  color: R.palette.errorRed,
                ),
              ),
            ],
            SizedBox(
              height: 30.h,
            ),
            GenericTextField(
              hintText: AppLocalizations.of(context).country,
              controller: personalDetailViewmodel.countryController,
              key: ValueKey(AppLocalizations.of(context).country),
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
              onChange: (value) {
                personalDetailViewmodel.setCountry(value);
              },
              verticalContentPadding: 20,
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalDetailCardDesktop extends StatelessWidget {
  final PersonalDetailViewmodel personalDetailViewmodel;

  const PersonalDetailCardDesktop(
      {super.key, required this.personalDetailViewmodel});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Container(
      width: 0.368.sw,
      decoration: R.theme.genericCardDecoration,
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 35.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(
            AppLocalizations.of(context).personal_details,
            fontWeight: FontWeight.w600,
            color: R.palette.mediumBlack,
            fontFamily: R.theme.interRegular,
            fontSize: 22,
          ),
          SizedBox(
            height: 5.h,
          ),
          SubHeading(
            AppLocalizations.of(context).personal_detail_desc,
            fontWeight: FontWeight.w400,
            fontFamily: R.theme.interRegular,
            color: R.palette.lightGray,
            fontSize: 16,
          ),
          SizedBox(
            height: 22.h,
          ),
          SubHeading(
            AppLocalizations.of(context).title,
            fontSize: 16,
            fontFamily: R.theme.interRegular,
            fontWeight: FontWeight.w400,
            color: R.palette.lightGray,
          ),
          SizedBox(
            height: 9.h,
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
              hintText: personalDetailViewmodel.title,
              filled: false,
              mapDropDownText: (value) {
                return Text(
                  value,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: R.palette.mediumBlack,
                      fontFamily: R.theme.interRegular,
                      fontSize: 13),
                );
              },
              onDropDownItemChanged: (value) {
                if (value == null) return;
                personalDetailViewmodel.setTitle(value);
              },
              dropDownColor: R.palette.white,
            ),
          ),
          SizedBox(
            height: 25.h,
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
                      AppLocalizations.of(context).first_name,
                      fontSize: 16,
                      fontFamily: R.theme.interRegular,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    GenericTextField(
                      hintText: AppLocalizations.of(context).enter_first_name,
                      controller: personalDetailViewmodel.firstNameController,
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
                      onChange: (value) {
                        final pattern = ValidationPattern.name.pattern;
                        final result = sl.get<Validator>().validateInput(
                              value!,
                              pattern: pattern,
                            );
                        if (result != ValidationResult.valid) {
                          personalDetailViewmodel.setFirstNameError(
                              AppLocalizations.of(context)
                                  .please_enter_a_valid_name);
                        } else {
                          personalDetailViewmodel.setFirstNameError(null);
                        }
                        personalDetailViewmodel.setFirstName(value);
                      },
                      verticalContentPadding: 15,
                    ),
                    if (personalDetailViewmodel.firstNameError != null) ...[
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        personalDetailViewmodel.firstNameError!,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w400,
                          color: R.palette.errorRed,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).last_name,
                      fontSize: 16,
                      fontFamily: R.theme.interRegular,
                      fontWeight: FontWeight.w400,
                      color: R.palette.lightGray,
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    GenericTextField(
                      hintText: AppLocalizations.of(context).enter_last_name,
                      controller: personalDetailViewmodel.lastNameController,
                      key: ValueKey(
                          AppLocalizations.of(context).enter_last_name),
                      verticalContentPadding: 15,
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: R.theme.interRegular,
                        height: 1.3,
                        color: R.palette.mediumBlack,
                      ),
                      textStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: R.theme.interRegular,
                        color: R.palette.mediumBlack,
                      ),
                      useBottomPadding: false,
                      onChange: (value) {
                        final pattern = ValidationPattern.name.pattern;
                        final result = sl.get<Validator>().validateInput(
                              value!,
                              pattern: pattern,
                            );
                        if (result != ValidationResult.valid) {
                          personalDetailViewmodel.setLastNameError(
                              AppLocalizations.of(context)
                                  .please_enter_a_valid_name);
                        } else {
                          personalDetailViewmodel.setLastNameError(null);
                        }
                        personalDetailViewmodel.setLastName(value);
                      },
                    ),
                    if (personalDetailViewmodel.lastNameError != null) ...[
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        personalDetailViewmodel.lastNameError!,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w400,
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
            height: 25.h,
          ),
          SubHeading(
            AppLocalizations.of(context).date_of_birth,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: R.theme.interRegular,
            color: R.palette.lightGray,
          ),
          SizedBox(
            height: 9.h,
          ),
          GenericTextField(
            hintText: R.stringRes.coverPickerScreen.fieldHint,
            controller: personalDetailViewmodel.dateController,
            key: ValueKey(AppLocalizations.of(context).date_of_birth),
            verticalContentPadding: 15,
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              fontFamily: R.theme.interRegular,
              color: R.palette.mediumBlack,
            ),
            hintStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              fontFamily: R.theme.interRegular,
              height: 1.3,
              color: R.palette.mediumBlack,
            ),
            onlyRead: true,
            enableInteractiveSelection: false,
            onTap: () async {
              // DateTime? pickedDate = await showDatePicker(
              //     context: context,
              //     initialDate: DateTime.now(),
              //     firstDate: DateTime(1900),
              //     lastDate: DateTime.now());

              DateTime? pickedDate = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDatePickerDialog(
                    initialDate: selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                },
              );

              if (pickedDate != null) {
                personalDetailViewmodel.setDateOfBirth(pickedDate);
                String formattedDate = DateFormat(
                        R.stringRes.localeHelper.reversePickerDateFormatYYYY)
                    .format(pickedDate);
                personalDetailViewmodel.dateController.text = formattedDate;
              }
            },
            trailingIcon: Icon(
              Icons.calendar_month_outlined,
              size: 22.h,
              color: R.palette.textFieldHintGreyColor,
            ),
            useBottomPadding: false,
          ),
          SizedBox(
            height: 25.h,
          ),
          SubHeading2(
            AppLocalizations.of(context).contact_details,
            fontWeight: FontWeight.w500,
            color: R.palette.mediumBlack,
            fontFamily: R.theme.interRegular,
            fontSize: 24.sp,
          ),
          SizedBox(
            height: 22.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    personalDetailViewmodel.emailState == EmailState.none
                        ? SubHeading(
                            AppLocalizations.of(context).email_address,
                            fontSize: 16,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w400,
                            color: R.palette.lightGray,
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SubHeading(
                                AppLocalizations.of(context).email_address,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: R.theme.interRegular,
                                color: R.palette.lightGray,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                onTap: () {
                                  personalDetailViewmodel
                                      .setEmailState(EmailState.none);
                                },
                                child: SvgPicture.asset(
                                  R.assets.graphics.edit.path,
                                  height: 24.w,
                                ),
                              )
                            ],
                          ),
                    SizedBox(
                      height: 9.h,
                    ),
                    GenericTextField(
                      enable:
                          personalDetailViewmodel.emailState == EmailState.none
                              ? true
                              : false,
                      hintText:
                          AppLocalizations.of(context).enter_email_address,
                      controller: personalDetailViewmodel.emailController,
                      key: ValueKey(
                          AppLocalizations.of(context).enter_email_address),
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
                      verticalContentPadding: 15,
                      useBottomPadding: false,
                      filled: personalDetailViewmodel.emailState ==
                              EmailState.verify
                          ? true
                          : false,
                      fillColor: R.palette.textFieldBorderGreyColor,
                      onChange: (value) {
                        final pattern = ValidationPattern.email.pattern;
                        final result = sl.get<Validator>().validateInput(
                              value!,
                              pattern: pattern,
                            );
                        if (result != ValidationResult.valid) {
                          personalDetailViewmodel.setEmailError(
                              AppLocalizations.of(context)
                                  .please_enter_a_valid_email);
                        } else {
                          personalDetailViewmodel.setEmailError(null);
                        }
                        // personalDetailViewmodel.setEmail(value);
                        personalDetailViewmodel.setEmail("collins@gmail.com");
                      },
                    ),
                    if (personalDetailViewmodel.emailError != null) ...[
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        personalDetailViewmodel.emailError!,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w400,
                          color: R.palette.errorRed,
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 9.h,
                    ),
                    personalDetailViewmodel.emailState == EmailState.verify
                        ? RichText(
                            text: TextSpan(
                              text:
                                  "${AppLocalizations.of(context).verified}. ",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: R.theme.interRegular,
                                color: R.palette.lightDarkGreen,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: AppLocalizations.of(context)
                                      .the_email_address_you_use_to_sign,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.textFieldHintGreyColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SubHeading(
                            AppLocalizations.of(context).contact_details_desc,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: R.theme.interRegular,
                            color: R.palette.textFieldHintGreyColor,
                            maxLines: 5,
                          ),
                  ],
                ),
              ),
              SizedBox(
                width: 9.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    personalDetailViewmodel.phoneState == PhoneState.none
                        ? SubHeading(
                            AppLocalizations.of(context).mobile_number,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: R.theme.interRegular,
                            color: R.palette.lightGray,
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SubHeading(
                                AppLocalizations.of(context).mobile_number,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: R.theme.interRegular,
                                color: R.palette.lightGray,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              InkWell(
                                onTap: () {
                                  personalDetailViewmodel
                                      .setPhoneState(PhoneState.none);
                                },
                                child: SvgPicture.asset(
                                  R.assets.graphics.edit.path,
                                  height: 25.w,
                                ),
                              )
                            ],
                          ),
                    SizedBox(
                      height: 10.h,
                    ),
                    IntlPhoneField(
                      height: 47.h,
                      searchTextStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: R.theme.interRegular,
                      ),
                      pickerDialogStyle: PickerDialogStyle(
                        backgroundColor: R.palette.appWhiteColor,
                        countryNameStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.interRegular,
                          color: R.palette.textFieldHintGreyColor,
                        ),
                      ),
                      enabled:
                          personalDetailViewmodel.phoneState == PhoneState.none
                              ? true
                              : false,
                      controller: personalDetailViewmodel.mobileController,
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
                      flagsButtonPadding:
                          const EdgeInsets.symmetric(vertical: 0),
                      disableLengthCheck: true,
                      dropdownIcon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: R.palette.textFieldHintGreyColor,
                      ),
                      dropdownTextStyle: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: R.theme.interRegular,
                        color: R.palette.mediumBlack,
                      ),
                      flagsButtonMargin: EdgeInsets.only(left: 0.w),
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).txt_enter_number_hint,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                        isDense: true,
                        labelStyle: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: R.theme.interRegular,
                          color: R.palette.mediumBlack,
                        ),
                        filled: personalDetailViewmodel.phoneState ==
                                PhoneState.verify
                            ? true
                            : false,
                        fillColor: R.palette.textFieldBorderGreyColor,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: R.palette.textFieldBorderGreyColor),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: R.palette.textFieldBorderGreyColor),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: R.palette.textFieldBorderGreyColor),
                          borderRadius: BorderRadius.circular(10.r),
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
                          personalDetailViewmodel.setPhoneNumberError(
                              AppLocalizations.of(context).msg_error_please_enter_a_mobile_number);
                        }
                        final pattern = ValidationPattern.phone.pattern;
                        final result = sl.get<Validator>().validateInput(
                              phone.number,
                              pattern: pattern,
                            );
                        if (result != ValidationResult.valid) {
                          personalDetailViewmodel.setPhoneNumberError(
                              AppLocalizations.of(context).msg_error_please_enter_a_mobile_number);
                        } else {
                          personalDetailViewmodel.setPhoneNumberError(null);
                        }

                        personalDetailViewmodel.setMobile(phone.completeNumber);
                      },
                    ),
                    if (personalDetailViewmodel.phoneNumberError != null) ...[
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        personalDetailViewmodel.phoneNumberError!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w400,
                          color: R.palette.errorRed,
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 2.h,
                    ),
                    personalDetailViewmodel.phoneState == PhoneState.verify
                        ? RichText(
                            text: TextSpan(
                              text:
                                  "${AppLocalizations.of(context).verified}. ",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: R.theme.interRegular,
                                color: R.palette.lightDarkGreen,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: AppLocalizations.of(context)
                                      .the_mobile_number_is_where_we_will_send_messages_too,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.textFieldHintGreyColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : RichText(
                            text: TextSpan(
                              text: AppLocalizations.of(context)
                                  .contact_details_desc_2,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: R.theme.interRegular,
                                color: R.palette.textFieldHintGreyColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      AppLocalizations.of(context).resend_code,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.appPrimaryBlue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      if (personalDetailViewmodel.mobile !=
                                              null &&
                                          personalDetailViewmodel
                                                  .phoneNumberError ==
                                              null) {
                                        if (!await sl<NetworkInfo>()
                                            .isConnected) {
                                          Future.delayed(Duration.zero, () {
                                            EasyLoading.showError(AppLocalizations.of(context).msg_error_no_internet_connection);
                                          });
                                          return;
                                        }
                                        Future.delayed(Duration.zero, () {
                                          sl<Navigation>().pushWithArgs(
                                            // ignore: use_build_context_synchronously
                                            context,
                                            Routes.verifyOtpRoute,
                                            args:
                                                personalDetailViewmodel.mobile,
                                          );
                                        });
                                      }
                                    },
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          SubHeading(
            AppLocalizations.of(context).address,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: R.theme.interRegular,
            color: R.palette.lightGray,
          ),
          SizedBox(
            height: 9.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: GenericTextField(
                  height: 47.h,
                  hintText: AppLocalizations.of(context).address_1,
                  controller: personalDetailViewmodel.addressOneController,
                  key: ValueKey(AppLocalizations.of(context).address_1),
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
                  onChange: (value) {
                    personalDetailViewmodel.setAddressOne(value);
                  },
                  verticalContentPadding: 15,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                child: GenericTextField(
                  height: 47.h,
                  hintText: AppLocalizations.of(context).address_2,
                  controller: personalDetailViewmodel.addressTwoController,
                  key: ValueKey(AppLocalizations.of(context).address_2),
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
                  onChange: (value) {
                    personalDetailViewmodel.setAddressTwo(value);
                  },
                  verticalContentPadding: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: GenericTextField(
                  height: 47.h,
                  hintText: AppLocalizations.of(context).town_city,
                  controller: personalDetailViewmodel.townCityController,
                  key: ValueKey(AppLocalizations.of(context).town_city),
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
                  onChange: (value) {
                    personalDetailViewmodel.setTownCity(value);
                  },
                  verticalContentPadding: 15,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                child: GenericTextField(
                  height: 47.h,
                  hintText: AppLocalizations.of(context).state_country,
                  controller: personalDetailViewmodel.stateCountryController,
                  key: ValueKey(AppLocalizations.of(context).state_country),
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
                  onChange: (value) {
                    personalDetailViewmodel.setStateCountry(value);
                  },
                  verticalContentPadding: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenericTextField(
                    height: 47.h,
                    hintText: AppLocalizations.of(context).postcode,
                    controller: personalDetailViewmodel.postCodeController,
                    key: ValueKey(AppLocalizations.of(context).postcode),
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
                    onChange: (value) {
                      final pattern = ValidationPattern.postCode.pattern;
                      final result = sl.get<Validator>().validateInput(
                            value!,
                            pattern: pattern,
                          );
                      if (result != ValidationResult.valid) {
                        personalDetailViewmodel.setPostcodeError(
                            AppLocalizations.of(context)
                                .please_enter_a_valid_postcode);
                      } else {
                        personalDetailViewmodel.setPostcodeError(null);
                      }
                      personalDetailViewmodel.setPostcode(value);
                    },
                    verticalContentPadding: 15,
                  ),
                  if (personalDetailViewmodel.postCodeError != null) ...[
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      personalDetailViewmodel.postCodeError!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: R.theme.interRegular,
                        fontWeight: FontWeight.w400,
                        color: R.palette.errorRed,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                  ],
                ],
              )),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                child: GenericTextField(
                  height: 47.h,
                  hintText: AppLocalizations.of(context).country,
                  controller: personalDetailViewmodel.countryController,
                  key: ValueKey(AppLocalizations.of(context).country),
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
                  onChange: (value) {
                    personalDetailViewmodel.setCountry(value);
                  },
                  verticalContentPadding: 15,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 58.h,
              width: double.infinity,
              child: GenericButton(
                onPressed: () async {
                  sl<Navigation>().goBack(context);
                },
                text: AppLocalizations.of(context).save_details,
                fontWeightT: FontWeight.w500,
                fontFamily: R.theme.interRegular,
                textSize: 18,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
