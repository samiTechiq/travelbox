// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/features/questions/views/cover_details/widgets/custom_date_picker_dialog.dart';
import 'package:travelbox/features/questions/views/cover_details/widgets/date_of_birth_widget.dart';
import 'package:travelbox/features/questions/views/cover_details/widgets/viewmodel/cover_detail_card_fields_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

import '../../../../../data/di/dependeny_injection.dart';
import '../../../../../data/resources/r.dart';
import '../../../../../utils/core/validator/validator.dart';
import '../../../../../utils/widgets/app_text.dart';
import '../../../../../utils/widgets/text_fields/app_text_field.dart';

class CoverDetailCardFields extends StatelessWidget {
  String heading;
  final bool isDisableEmail;
  final Function(int)? onTap;
  int index;
  final Function(String, int) onEmailChanged;
  final Function(String, int) onFirstNameChanged;
  final Function(String, int) onLastNameChanged;
  final Function(String, int) onDateChanged;
  final Function(String, int) onIDCardChanged;
  final Function(String, int) onIDCardCodeChanged;
  final Function(String, int) onDOBDateChanged;
  final Function(String, int) onDOBMonthChanged;
  final Function(String, int) onDOBYearChanged;
  final bool canRemove;
  final bool disableEmailValidator;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? emailController;
  final TextEditingController? dobDayController;
  final TextEditingController? dobMonthController;
  final TextEditingController? dobYearController;
  final TextEditingController? idCardController;
  final TextEditingController? idCardCodeController;

  CoverDetailCardFields({
    super.key,
    required this.heading,
    this.onTap,
    required this.index,
    this.isDisableEmail = false,
    this.canRemove = true,
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.idCardController,
    this.idCardCodeController,
    this.disableEmailValidator = false,
    required this.onEmailChanged,
    required this.onFirstNameChanged,
    required this.onLastNameChanged,
    required this.onDateChanged,
    required this.onIDCardChanged,
    required this.onIDCardCodeChanged,
    this.dobDayController,
    this.dobMonthController,
    this.dobYearController,
    required this.onDOBDateChanged,
    required this.onDOBMonthChanged,
    required this.onDOBYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: CoverDetailCardMobileFields(
        heading: heading,
        index: index,
        onEmailChanged: onEmailChanged,
        onDateChanged: onDateChanged,
        onFirstNameChanged: onFirstNameChanged,
        onLastNameChanged: onLastNameChanged,
        onTap: onTap,
        isDisableEmail: isDisableEmail,
        disableEmailValidator: disableEmailValidator,
        canRemove: canRemove,
        onIDCardChanged: onIDCardChanged,
        onIDCardCodeChanged: onIDCardCodeChanged,
        onDOBDateChanged: onDOBDateChanged,
        onDOBMonthChanged: onDOBMonthChanged,
        onDOBYearChanged: onDOBYearChanged,
        dobDayController: dobDayController,
        dobMonthController: dobMonthController,
        dobYearController: dobYearController,
      ),
      desktopLayout: CoverDetailCardDesktopFields(
        heading: heading,
        index: index,
        onEmailChanged: onEmailChanged,
        onDateChanged: onDateChanged,
        onFirstNameChanged: onFirstNameChanged,
        onLastNameChanged: onLastNameChanged,
        onTap: onTap,
        isDisableEmail: isDisableEmail,
        disableEmailValidator: disableEmailValidator,
        canRemove: canRemove,
        firstNameController: firstNameController,
        lastNameController: lastNameController,
        emailController: emailController,
        dobDayController: dobDayController,
        dobMonthController: dobMonthController,
        dobYearController: dobYearController,
        idCardController: idCardController,
        idCardCodeController: idCardCodeController,
        onIDCardChanged: onIDCardChanged,
        onIDCardCodeChanged: onIDCardCodeChanged,
        onDOBDateChanged: onDOBDateChanged,
        onDOBMonthChanged: onDOBMonthChanged,
        onDOBYearChanged: onDOBYearChanged,
      ),
    );
  }
}

class CoverDetailCardMobileFields extends StatefulWidget {
  String heading;
  final bool isDisableEmail;
  final Function(int)? onTap;
  int index;
  final Function(String, int) onEmailChanged;
  final Function(String, int) onFirstNameChanged;
  final Function(String, int) onLastNameChanged;
  final Function(String, int) onDateChanged;
  final Function(String, int) onIDCardChanged;
  final Function(String, int) onIDCardCodeChanged;
  final bool canRemove;
  final bool disableEmailValidator;
  final Function(String, int) onDOBDateChanged;
  final Function(String, int) onDOBMonthChanged;
  final Function(String, int) onDOBYearChanged;
  final TextEditingController? dobDayController;
  final TextEditingController? dobMonthController;
  final TextEditingController? dobYearController;

  CoverDetailCardMobileFields({
    super.key,
    required this.heading,
    this.onTap,
    required this.index,
    this.isDisableEmail = false,
    this.canRemove = true,
    this.disableEmailValidator = false,
    required this.onEmailChanged,
    required this.onFirstNameChanged,
    required this.onLastNameChanged,
    required this.onDateChanged,
    required this.onIDCardChanged,
    required this.onIDCardCodeChanged,
    required this.onDOBDateChanged,
    required this.onDOBMonthChanged,
    required this.onDOBYearChanged,
    required this.dobDayController,
    required this.dobMonthController,
    required this.dobYearController,
  });

  @override
  State<CoverDetailCardMobileFields> createState() =>
      _CoverDetailCardMobileFieldsState();
}

class _CoverDetailCardMobileFieldsState
    extends State<CoverDetailCardMobileFields> {
  DateTime selectedDate = DateTime.now();
  String? day;
  String? month;
  String? year;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => sl<CoverDetailCardsFieldViewModel>(),
        builder: (context, child) {
          return Consumer<CoverDetailCardsFieldViewModel>(
              builder: (context, viewModel, child) {
            return Padding(
              padding: EdgeInsets.only(
                left: 28.w,
                right: 29.w,
                top: 30.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SubHeading(
                        widget.heading,
                        maxLines: 2,
                        color: R.palette.darkBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const Spacer(),
                      widget.canRemove
                          ? InkWell(
                              onTap: () {
                                if (widget.onTap == null) {
                                  return;
                                }
                                widget.onTap!(widget.index);
                              },
                              child: SubHeading2(
                                AppLocalizations.of(context).btn_remove,
                                maxLines: 2,
                                color: R.palette.appPrimaryBlue,
                                fontSize: 14,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SubHeading(
                    AppLocalizations.of(context).first_name_require,
                    fontSize: 14,
                    color: R.palette.darkBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  GenericTextField(
                    key: ValueKey('First name*'.hardcoded),
                    hintText: AppLocalizations.of(context).enter_first_name,
                    controller: viewModel.firstNameController,
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: R.theme.interRegular,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: R.palette.mediumBlack,
                    ),
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: R.theme.interRegular,
                      fontWeight: FontWeight.w600,
                      color: R.palette.mediumBlack,
                    ),
                    useBottomPadding: false,
                    onChange: (value) {
                      widget.onFirstNameChanged(value, widget.index);
                    },
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
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  SubHeading(
                    AppLocalizations.of(context).last_name_require,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: R.palette.darkBlack,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  GenericTextField(
                    key: ValueKey('Last name*'.hardcoded),
                    hintText: AppLocalizations.of(context).enter_last_name,
                    controller: viewModel.lastNameController,
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: R.theme.interRegular,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: R.palette.mediumBlack,
                    ),
                    textStyle: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: R.theme.interRegular,
                      fontWeight: FontWeight.w600,
                      color: R.palette.mediumBlack,
                    ),
                    useBottomPadding: false,
                    onChange: (value) {
                      widget.onLastNameChanged(value, widget.index);
                    },
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
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  SubHeading(
                    AppLocalizations.of(context).txt_date_of_birth_mandatory,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: R.palette.darkBlack,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  DateOfBirthWidget(
                    day: day,
                    month: month,
                    year: year,
                    onPressed: () async {
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
                        NumberFormat formatter = NumberFormat("00");
                        setState(() {
                          selectedDate = pickedDate;
                          day = formatter.format(pickedDate.day);
                          month = formatter.format(pickedDate.month);
                          year = pickedDate.year.toString();
                        });
                        widget.dobDayController?.text = day ?? "";
                        widget.dobMonthController?.text = month ?? "";
                        widget.dobYearController?.text = year ?? "";
                        String formattedDate = DateFormat(R.stringRes
                            .localeHelper.reversePickerDateFormatYYYY)
                            .format(pickedDate);
                        widget.onDateChanged(
                          formattedDate,
                          widget.index,
                        );
                      }
                    },
                    dobDayController: widget.dobDayController!,
                    dobMonthController: widget.dobMonthController!,
                    dobYearController: widget.dobYearController!,
                    onDOBDateChanged: (value) {
                      int? day = int.tryParse(value);
                      if (day != null) {
                        selectedDate = selectedDate.copyWith(day: day);
                        _parseDayAndCallback(selectedDate);
                      }
                    },
                    onDOBMonthChanged: (value) {
                      int? month = int.tryParse(value);
                      if (month != null) {
                        selectedDate = selectedDate.copyWith(month: month);
                        _parseDayAndCallback(selectedDate);
                      }
                    },
                    onDOBYearChanged: (value) {
                      int? year = int.tryParse(value);
                      if (year != null) {
                        selectedDate = selectedDate.copyWith(year: year);
                        _parseDayAndCallback(selectedDate);
                      }
                    },
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  SubHeading(
                    AppLocalizations.of(context).id_card_number_require,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: R.palette.darkBlack,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GenericTextField(
                          textInputType: TextInputType.number,
                          key: const ValueKey('idCard'),
                          hintText:
                              AppLocalizations.of(context).enter_id_card_number,
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                            color: R.palette.mediumBlack,
                          ),
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            color: R.palette.mediumBlack,
                          ),
                          useBottomPadding: false,
                          controller: viewModel.idCardController,
                          onChange: (value) {
                            widget.onIDCardChanged(value, widget.index);
                          },
                          validator: (value) {
                            final pattern = ValidationPattern.idCard.pattern;
                            final result = sl.get<Validator>().validateInput(
                                  value!,
                                  pattern: pattern,
                                );
                            if (result != ValidationResult.valid) {
                              return AppLocalizations.of(context).msg_invalid_id_card_number;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GenericTextField(
                        useZeroPrefixPadding: true,
                        width: 100.w,
                        textInputType: TextInputType.number,
                        textAlign: TextAlign.center,
                        key: const ValueKey('idCardCode'),
                        hintText: '(        )',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w600,
                          color: R.palette.mediumBlack,
                        ),
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w600,
                          color: R.palette.mediumBlack,
                        ),
                        useBottomPadding: false,
                        controller: viewModel.idCardCodeController,
                        onChange: (value) {
                          widget.onIDCardCodeChanged(value, widget.index);
                        },
                        validator: (value) {
                          final pattern = ValidationPattern.idCardCode.pattern;
                          final result = sl.get<Validator>().validateInput(
                                value!,
                                pattern: pattern,
                              );
                          if (result != ValidationResult.valid) {
                            return AppLocalizations.of(context).msg_invalid_code;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  Visibility(
                    visible: !widget.isDisableEmail,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 33.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).txt_email_mandatory,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: R.palette.darkBlack,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        GenericTextField(
                          leadingIcon: SvgPicture.asset(
                            R.assets.graphics.email.path,
                            width: 24.w,
                            height: 24.w,
                            fit: BoxFit.cover,
                          ),
                          key: ValueKey('Email*'.hardcoded),
                          hintText: AppLocalizations.of(context).txt_enter_email_hint,
                          useBottomPadding: false,
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                            color: R.palette.mediumBlack,
                          ),
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            color: R.palette.mediumBlack,
                          ),
                          controller: viewModel.emailController,
                          onChange: (value) {
                            widget.onEmailChanged(value, widget.index);
                          },
                          validator: widget.disableEmailValidator
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
                                    return AppLocalizations.of(context).please_enter_a_valid_email;
                                  }
                                  return null;
                                },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  void _parseDayAndCallback(DateTime pickedDate) {
    NumberFormat formatter = NumberFormat("00");
    setState(() {
      selectedDate = pickedDate;
      day = formatter.format(pickedDate.day);
      month = formatter.format(pickedDate.month);
      year = pickedDate.year.toString();
    });
    String formattedDate =
        DateFormat(R.stringRes.localeHelper.reversePickerDateFormatYYYY)
            .format(pickedDate);
    widget.onDateChanged(
      formattedDate,
      widget.index,
    );
  }
}

class CoverDetailCardDesktopFields extends StatefulWidget {
  String heading;
  final bool isDisableEmail;
  final Function(int)? onTap;
  int index;
  final Function(String, int) onEmailChanged;
  final Function(String, int) onFirstNameChanged;
  final Function(String, int) onLastNameChanged;
  final Function(String, int) onDateChanged;
  final Function(String, int) onIDCardChanged;
  final Function(String, int) onIDCardCodeChanged;
  final bool canRemove;
  final bool disableEmailValidator;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? emailController;
  final TextEditingController? dobDayController;
  final TextEditingController? dobMonthController;
  final TextEditingController? dobYearController;
  final TextEditingController? idCardController;
  final TextEditingController? idCardCodeController;
  final Function(String, int) onDOBDateChanged;
  final Function(String, int) onDOBMonthChanged;
  final Function(String, int) onDOBYearChanged;

  CoverDetailCardDesktopFields({
    super.key,
    required this.heading,
    this.onTap,
    required this.index,
    this.isDisableEmail = false,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.dobDayController,
    required this.dobMonthController,
    required this.dobYearController,
    required this.idCardController,
    required this.idCardCodeController,
    this.canRemove = true,
    this.disableEmailValidator = false,
    required this.onEmailChanged,
    required this.onFirstNameChanged,
    required this.onLastNameChanged,
    required this.onDateChanged,
    required this.onIDCardChanged,
    required this.onIDCardCodeChanged,
    required this.onDOBDateChanged,
    required this.onDOBMonthChanged,
    required this.onDOBYearChanged,
  });

  @override
  State<CoverDetailCardDesktopFields> createState() =>
      _CoverDetailCardDesktopFieldsState();
}

class _CoverDetailCardDesktopFieldsState
    extends State<CoverDetailCardDesktopFields> {
  String? day;
  String? month;
  String? year;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => sl<CoverDetailCardsFieldViewModel>(),
        builder: (context, child) {
          return Consumer<CoverDetailCardsFieldViewModel>(
              builder: (context, viewModel, child) {
            return Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SubHeading(
                        widget.heading,
                        maxLines: 2,
                        color: R.palette.darkBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 6,
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeading(
                              AppLocalizations.of(context).first_name_require,
                              fontSize: 4,
                              color: R.theme.genericTextStyle.color,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            GenericTextField(
                              key: ValueKey('First name*'.hardcoded),
                              hintText:
                                  AppLocalizations.of(context).enter_first_name,
                              controller: widget.firstNameController,
                              hintStyle: TextStyle(
                                fontSize: 4.sp,
                                fontFamily: R.theme.interRegular,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                color: R.palette.mediumBlack,
                              ),
                              textStyle: TextStyle(
                                fontSize: 4.sp,
                                fontFamily: R.theme.interRegular,
                                fontWeight: FontWeight.w600,
                                color: R.palette.mediumBlack,
                              ),
                              useBottomPadding: false,
                              onChange: (value) {
                                widget.onFirstNameChanged(value, widget.index);
                              },
                              validator: (value) {
                                final pattern = ValidationPattern.name.pattern;
                                final result =
                                    sl.get<Validator>().validateInput(
                                          value!,
                                          pattern: pattern,
                                        );
                                if (result != ValidationResult.valid) {
                                  return AppLocalizations.of(context).please_enter_a_valid_name;
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.0.w,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeading(
                              AppLocalizations.of(context).last_name_require,
                              fontSize: 4,
                              fontWeight: FontWeight.w400,
                              color: R.theme.genericTextStyle.color,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            GenericTextField(
                              key: ValueKey('Last name*'.hardcoded),
                              hintText:
                                  AppLocalizations.of(context).enter_last_name,
                              controller: widget.lastNameController,
                              hintStyle: TextStyle(
                                fontSize: 4.sp,
                                fontFamily: R.theme.interRegular,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                color: R.palette.mediumBlack,
                              ),
                              textStyle: TextStyle(
                                fontSize: 4.sp,
                                fontFamily: R.theme.interRegular,
                                fontWeight: FontWeight.w600,
                                color: R.palette.mediumBlack,
                              ),
                              useBottomPadding: false,
                              onChange: (value) {
                                widget.onLastNameChanged(value, widget.index);
                              },
                              validator: (value) {
                                final pattern = ValidationPattern.name.pattern;
                                final result =
                                    sl.get<Validator>().validateInput(
                                          value!,
                                          pattern: pattern,
                                        );
                                if (result != ValidationResult.valid) {
                                  return AppLocalizations.of(context).please_enter_a_valid_name;
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).txt_date_of_birth_mandatory,
                        fontSize: 4,
                        fontWeight: FontWeight.w500,
                        color: R.theme.genericTextStyle.color,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      DateOfBirthWidget(
                        day: day,
                        month: month,
                        year: year,
                        onPressed: () async {
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
                            NumberFormat formatter = NumberFormat("00");
                            setState(() {
                              selectedDate = pickedDate;
                              day = formatter.format(pickedDate.day);
                              month = formatter.format(pickedDate.month);
                              year = pickedDate.year.toString();
                            });
                            widget.dobDayController?.text = day ?? "";
                            widget.dobMonthController?.text = month ?? "";
                            widget.dobYearController?.text = year ?? "";
                            String formattedDate = DateFormat(R.stringRes
                                    .localeHelper.reversePickerDateFormatYYYY)
                                .format(pickedDate);
                            widget.onDateChanged(
                              formattedDate,
                              widget.index,
                            );
                          }
                        },
                        dobDayController: widget.dobDayController!,
                        dobMonthController: widget.dobMonthController!,
                        dobYearController: widget.dobYearController!,
                        onDOBDateChanged: (value) {
                          int? day = int.tryParse(value);
                          if (day != null) {
                            selectedDate = selectedDate.copyWith(day: day);
                            _parseDayAndCallback(selectedDate);
                          }
                        },
                        onDOBMonthChanged: (value) {
                          int? month = int.tryParse(value);
                          if (month != null) {
                            selectedDate = selectedDate.copyWith(month: month);
                            _parseDayAndCallback(selectedDate);
                          }
                        },
                        onDOBYearChanged: (value) {
                          int? year = int.tryParse(value);
                          if (year != null) {
                            selectedDate = selectedDate.copyWith(year: year);
                            _parseDayAndCallback(selectedDate);
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).id_card_number_require,
                        fontSize: 4,
                        fontWeight: FontWeight.w500,
                        color: R.theme.genericTextStyle.color,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: GenericTextField(
                              textInputType: TextInputType.number,
                              key: const ValueKey('idCard'),
                              hintText: AppLocalizations.of(context)
                                  .enter_id_card_number,
                              hintStyle: TextStyle(
                                fontSize: 4.sp,
                                fontFamily: R.theme.interRegular,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                color: R.palette.mediumBlack,
                              ),
                              textStyle: TextStyle(
                                fontSize: 4.sp,
                                fontFamily: R.theme.interRegular,
                                fontWeight: FontWeight.w600,
                                color: R.palette.mediumBlack,
                              ),
                              useBottomPadding: false,
                              controller: widget.idCardController,
                              onChange: (value) {
                                widget.onIDCardChanged(value, widget.index);
                              },
                              validator: (value) {
                                final pattern =
                                    ValidationPattern.idCard.pattern;
                                final result =
                                    sl.get<Validator>().validateInput(
                                          value!,
                                          pattern: pattern,
                                        );
                                if (result != ValidationResult.valid) {
                                  return AppLocalizations.of(context).msg_please_enter_a_valid_id_card_number;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          GenericTextField(
                            textInputType: TextInputType.number,
                            textAlign: TextAlign.center,
                            width: 25.w,
                            key: const ValueKey('idCardCode'),
                            hintText: '(        )',
                            hintStyle: TextStyle(
                              fontSize: 4.sp,
                              fontFamily: R.theme.interRegular,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                              color: R.palette.mediumBlack,
                            ),
                            textStyle: TextStyle(
                              fontSize: 4.sp,
                              fontFamily: R.theme.interRegular,
                              fontWeight: FontWeight.w600,
                              color: R.palette.mediumBlack,
                            ),
                            useBottomPadding: false,
                            controller: widget.idCardCodeController,
                            onChange: (value) {
                              widget.onIDCardCodeChanged(value, widget.index);
                            },
                            validator: (value) {
                              final pattern =
                                  ValidationPattern.idCardCode.pattern;
                              final result = sl.get<Validator>().validateInput(
                                    value!,
                                    pattern: pattern,
                                  );
                              if (result != ValidationResult.valid) {
                                return AppLocalizations.of(context).msg_invalid_code;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  if (!widget.isDisableEmail) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubHeading(
                          AppLocalizations.of(context).txt_email_mandatory,
                          fontSize: 4,
                          fontWeight: FontWeight.bold,
                          color: R.theme.genericTextStyle.color,
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        GenericTextField(
                          leadingIcon: SvgPicture.asset(
                            R.assets.graphics.email.path,
                            width: 24.w,
                            height: 24.h,
                            fit: BoxFit.cover,
                          ),
                          key: ValueKey('Email*'.hardcoded),
                          hintText: AppLocalizations.of(context).txt_enter_email_hint,
                          useBottomPadding: false,
                          hintStyle: TextStyle(
                            fontSize: 4.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                            color: R.palette.mediumBlack,
                          ),
                          textStyle: TextStyle(
                            fontSize: 4.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            color: R.palette.mediumBlack,
                          ),
                          controller: widget.emailController,
                          onChange: (value) {
                            widget.onEmailChanged(value, widget.index);
                          },
                          validator: widget.disableEmailValidator
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
                                    return AppLocalizations.of(context).please_enter_a_valid_email;
                                  }
                                  return null;
                                },
                        ),
                      ],
                    )
                  ]
                ],
              ),
            );
          });
        });
  }

  void _parseDayAndCallback(DateTime pickedDate) {
    NumberFormat formatter = NumberFormat("00");
    setState(() {
      selectedDate = pickedDate;
      day = formatter.format(pickedDate.day);
      month = formatter.format(pickedDate.month);
      year = pickedDate.year.toString();
    });
    String formattedDate =
        DateFormat(R.stringRes.localeHelper.reversePickerDateFormatYYYY)
            .format(pickedDate);
    widget.onDateChanged(
      formattedDate,
      widget.index,
    );
  }
}
