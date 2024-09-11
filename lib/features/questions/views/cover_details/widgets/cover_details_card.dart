import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/viewmodel/cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/widgets/date_of_birth_widget.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/validator/validator.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

import '../../../../../../../utils/widgets/text_fields/app_text_field.dart';
import 'custom_date_picker_dialog.dart';

class CoveredDetailsCard extends StatelessWidget {
  final String heading;
  final bool isDisableEmail;
  final AbstractCoverDetailViewModel viewModel;
  final bool disableEmailValidator;
  final bool isMendatory;

  const CoveredDetailsCard({
    super.key,
    required this.heading,
    this.isDisableEmail = false,
    required this.viewModel,
    this.disableEmailValidator = false,
    this.isMendatory = true,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: CoveredDetailsCardMobile(
        heading: heading,
        viewModel: viewModel,
        disableEmailValidator: disableEmailValidator,
        isDisableEmail: isDisableEmail,
        isMendatory: isMendatory,
      ),
      desktopLayout: CoveredDetailsCardDesktop(
        heading: heading,
        viewModel: viewModel,
        disableEmailValidator: disableEmailValidator,
        isDisableEmail: isDisableEmail,
        isMendatory: isMendatory,
      ),
    );
  }
}

class CoveredDetailsCardMobile extends StatefulWidget {
  final String heading;
  final bool isDisableEmail;
  final AbstractCoverDetailViewModel viewModel;
  final bool disableEmailValidator;
  final bool isMendatory;

  const CoveredDetailsCardMobile({
    Key? key,
    required this.heading,
    this.isDisableEmail = false,
    required this.viewModel,
    this.disableEmailValidator = false,
    this.isMendatory = true,
  }) : super(key: key);

  @override
  State<CoveredDetailsCardMobile> createState() =>
      _CoveredDetailsCardMobileState();
}

class _CoveredDetailsCardMobileState extends State<CoveredDetailsCardMobile> {
  String? day;
  String? month;
  String? year;
  DateTime selectedDate = DateTime.now();

  late TextEditingController dobDayController;
  late TextEditingController dobMonthController;
  late TextEditingController dobYearController;

  bool _allFieldInputted() {
    return (day?.trim().isNotEmpty ?? false) &&
        (month?.trim().isNotEmpty ?? false) &&
        (year?.trim().isNotEmpty ?? false);
  }

  void _parseDateAndApply() {
    DateTime? pickedDate = DateTime(int.parse(year ?? "2000"),
        int.parse(month ?? "1"), int.parse(day ?? "1"));
    String formattedDateWithSlashes =
        DateFormat(R.stringRes.localeHelper.pickerDateFormat)
            .format(pickedDate);
    widget.viewModel.dateOfBirth = formattedDateWithSlashes;
  }

  @override
  void initState() {
    super.initState();
    dobDayController = TextEditingController(text: day ?? "");
    dobMonthController = TextEditingController(text: month ?? "");
    dobYearController = TextEditingController(text: year ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: R.theme.genericCardDecoration,
      child: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 28.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(
              widget.heading,
              maxLines: 2,
              color: R.palette.darkBlack,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            SizedBox(
              height: 30.h,
            ),
            SubHeading(
              AppLocalizations.of(context).first_name_require,
              fontSize: 16,
              color: R.palette.lightGray,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 12.h,
            ),
            GenericTextField(
              key: ValueKey(AppLocalizations.of(context).first_name_require),
              hintText: AppLocalizations.of(context).enter_first_name,
              controller: widget.viewModel.firstNameController,
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
              verticalContentPadding: 16,
            ),
            SizedBox(
              height: 30.h,
            ),
            SubHeading(
              AppLocalizations.of(context).last_name_require,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
            ),
            GenericTextField(
              key: ValueKey(AppLocalizations.of(context).last_name_require),
              hintText: AppLocalizations.of(context).enter_last_name,
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
              controller: widget.viewModel.lastNameController,
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
              verticalContentPadding: 16,
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              widget.isMendatory
                  ? AppLocalizations.of(context).txt_date_of_birth_mandatory
                  : AppLocalizations.of(context).date_of_birth,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
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
                  dobDayController.text = day ?? "";
                  dobMonthController.text = month ?? "";
                  dobYearController.text = year ?? "";
                  String formattedDateWithSlashes =
                      DateFormat(R.stringRes.localeHelper.pickerDateFormat)
                          .format(pickedDate);
                  widget.viewModel.dateOfBirth = formattedDateWithSlashes;
                }
              },
              dobDayController: dobDayController,
              dobMonthController: dobMonthController,
              dobYearController: dobYearController,
              onDOBDateChanged: (value) {
                if (value.trim().isNotEmpty) {
                  day = value;
                }
                if (_allFieldInputted()) {
                  _parseDateAndApply();
                }
              },
              onDOBMonthChanged: (value) {
                if (value.trim().isNotEmpty) {
                  month = value;
                }
                if (_allFieldInputted()) {
                  _parseDateAndApply();
                }
              },
              onDOBYearChanged: (value) {
                if (value.trim().isNotEmpty) {
                  year = value;
                }
                if (_allFieldInputted()) {
                  _parseDateAndApply();
                }
              },
            ),
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              widget.isMendatory
                  ? AppLocalizations.of(context).id_card_number_require
                  : AppLocalizations.of(context).id_card_number,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: R.palette.lightGray,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  child: GenericTextField(
                    key: const ValueKey('idCard'),
                    hintText: AppLocalizations.of(context).enter_id_card_number,
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
                    controller: widget.viewModel.idCardController,
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
                    verticalContentPadding: 16,
                  ),
                ),
                SizedBox(
                  width: 11.w,
                ),
                GenericTextField(
                  useZeroPrefixPadding: true,
                  width: 0.25.sw,
                  textAlign: TextAlign.center,
                  key: const ValueKey('idCardCode'),
                  hintText: '(        )',
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
                  useBottomPadding: false,
                  controller: widget.viewModel.idCardCodeController,
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
                  verticalContentPadding: 16,
                ),
              ],
            ),
            Visibility(
              visible: !widget.isDisableEmail,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  SubHeading(
                    widget.isMendatory
                        ? AppLocalizations.of(context).txt_email_mandatory
                        : AppLocalizations.of(context).email,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: R.palette.lightGray,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GenericTextField(
                    leadingIcon: SvgPicture.asset(
                      R.assets.graphics.email.path,
                      width: 18.w,
                      height: 18.w,
                      fit: BoxFit.cover,
                    ),
                    key: ValueKey('Email*'.hardcoded),
                    hintText: AppLocalizations.of(context).txt_enter_email_hint,
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
                    controller: widget.viewModel.emailController,
                    validator: widget.disableEmailValidator
                        ? null
                        : (value) {
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
                    verticalContentPadding: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
          ],
        ),
      ),
    );
  }
}

class CoveredDetailsCardDesktop extends StatefulWidget {
  final String heading;
  final bool isDisableEmail;
  final AbstractCoverDetailViewModel viewModel;
  final bool disableEmailValidator;
  final bool isMendatory;

  const CoveredDetailsCardDesktop({
    Key? key,
    required this.heading,
    this.isDisableEmail = false,
    required this.viewModel,
    this.disableEmailValidator = false,
    this.isMendatory = true,
  }) : super(key: key);

  @override
  State<CoveredDetailsCardDesktop> createState() =>
      _CoveredDetailsCardDesktopState();
}

class _CoveredDetailsCardDesktopState extends State<CoveredDetailsCardDesktop> {
  DateTime selectedDate = DateTime.now();
  String? day;
  String? month;
  String? year;

  late TextEditingController dobDayController;
  late TextEditingController dobMonthController;
  late TextEditingController dobYearController;

  @override
  void initState() {
    super.initState();
    dobDayController = TextEditingController(text: day ?? "");
    dobMonthController = TextEditingController(text: month ?? "");
    dobYearController = TextEditingController(text: year ?? "");
  }

  bool _allFieldInputted() {
    return (day?.trim().isNotEmpty ?? false) &&
        (month?.trim().isNotEmpty ?? false) &&
        (year?.trim().isNotEmpty ?? false);
  }

  void _parseDateAndApply() {
    DateTime? pickedDate = DateTime(int.parse(year ?? "2000"),
        int.parse(month ?? "1"), int.parse(day ?? "1"));
    String formattedDateWithSlashes =
        DateFormat(R.stringRes.localeHelper.pickerDateFormat)
            .format(pickedDate);
    widget.viewModel.dateOfBirth = formattedDateWithSlashes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: R.theme.genericCardDecoration,
      child: Padding(
        padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 27.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SubHeading(
              widget.heading,
              maxLines: 2,
              color: R.palette.darkBlack,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
            SizedBox(
              height: 37.h,
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).first_name_require,
                        fontSize: 16,
                        color: R.palette.lightGray,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      GenericTextField(
                        key: ValueKey(AppLocalizations.of(context).first_name_require),
                        hintText: AppLocalizations.of(context).enter_first_name,
                        controller: widget.viewModel.firstNameController,
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
                        fontWeight: FontWeight.w400,
                        color: R.palette.lightGray,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      GenericTextField(
                        key: ValueKey(AppLocalizations.of(context).last_name_require),
                        hintText: AppLocalizations.of(context).enter_last_name,
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
                        controller: widget.viewModel.lastNameController,
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
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeading(
                  widget.isMendatory
                      ? AppLocalizations.of(context).txt_date_of_birth_mandatory
                      : AppLocalizations.of(context).date_of_birth,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: R.palette.lightGray,
                ),
                SizedBox(
                  height: 12.h,
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
                      dobDayController.text = day ?? "";
                      dobMonthController.text = month ?? "";
                      dobYearController.text = year ?? "";
                      String formattedDateWithSlashes =
                          DateFormat(R.stringRes.localeHelper.pickerDateFormat)
                              .format(pickedDate);
                      widget.viewModel.dateOfBirth = formattedDateWithSlashes;
                    }
                  },
                  dobDayController: dobDayController,
                  dobMonthController: dobMonthController,
                  dobYearController: dobYearController,
                  onDOBDateChanged: (value) {
                    if (value.trim().isNotEmpty) {
                      day = value;
                    }
                    if (_allFieldInputted()) {
                      _parseDateAndApply();
                    }
                  },
                  onDOBMonthChanged: (value) {
                    if (value.trim().isNotEmpty) {
                      month = value;
                    }
                    if (_allFieldInputted()) {
                      _parseDateAndApply();
                    }
                  },
                  onDOBYearChanged: (value) {
                    if (value.trim().isNotEmpty) {
                      year = value;
                    }
                    if (_allFieldInputted()) {
                      _parseDateAndApply();
                    }
                  },
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubHeading(
                  widget.isMendatory
                      ? AppLocalizations.of(context).id_card_number_require
                      : AppLocalizations.of(context).id_card_number,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: R.palette.lightGray,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Flexible(
                      child: GenericTextField(
                        textInputType: TextInputType.number,
                        key: const ValueKey('idCard'),
                        hintText:
                            AppLocalizations.of(context).enter_id_card_number,
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
                        controller: widget.viewModel.idCardController,
                        validator: (value) {
                          final pattern = ValidationPattern.idCard.pattern;
                          final result = sl.get<Validator>().validateInput(
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
                      width: 10.w,
                    ),
                    GenericTextField(
                      textInputType: TextInputType.number,
                      textAlign: TextAlign.center,
                      width: 0.074.sw,
                      key: const ValueKey('idCardCode'),
                      hintText: '(        )',
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
                      controller: widget.viewModel.idCardCodeController,
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
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            if (!widget.isDisableEmail) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubHeading(
                    widget.isMendatory
                        ? AppLocalizations.of(context).txt_email_mandatory
                        : AppLocalizations.of(context).email,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: R.palette.lightGray,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GenericTextField(
                    leadingIcon: SvgPicture.asset(
                      R.assets.graphics.email.path,
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                    key: ValueKey(AppLocalizations.of(context).txt_email_mandatory),
                    hintText: AppLocalizations.of(context).txt_enter_email_hint,
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
                    controller: widget.viewModel.emailController,
                    validator: widget.disableEmailValidator
                        ? null
                        : (value) {
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
                  ),
                ],
              )
            ],
            SizedBox(
              height: 36.h,
            ),
          ],
        ),
      ),
    );
  }
}
