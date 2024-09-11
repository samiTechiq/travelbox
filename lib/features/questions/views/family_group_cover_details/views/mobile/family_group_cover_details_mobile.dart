import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/extension/extension.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/viewmodel/common_quote_viewmodel.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/model/card_data.dart';
import 'package:travelbox/features/questions/views/cover_details/widgets/cover_details_card_fields.dart';
import 'package:travelbox/features/questions/views/family_group_cover_details/viewmodel/family_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/terms_and_policy_popup.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/date_time_ext.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_rich_text.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class FamilyGroupCoveredDetailsMobile extends StatelessWidget {
  const FamilyGroupCoveredDetailsMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<FamilyGroupCoverDetailViewModel>(),
      builder: (context, child) {
        return const FamilyGroupCoverDetailsMobileContent();
      },
    );
  }
}

class FamilyGroupCoverDetailsMobileContent extends StatefulWidget {
  const FamilyGroupCoverDetailsMobileContent({
    super.key,
  });

  @override
  State<FamilyGroupCoverDetailsMobileContent> createState() =>
      _FamilyGroupCoverDetailsMobileContentState();
}

class _FamilyGroupCoverDetailsMobileContentState
    extends State<FamilyGroupCoverDetailsMobileContent> {
  final basicInfoViewModel = sl.get<BasicInfoViewModel>();
  final _formKey = GlobalKey<FormState>();
  late StreamSubscription<bool> keyboardSubscription;
  bool isKeyboardVisible = false;
  final List<Map<String, TextEditingController>> _controller = [];

  @override
  void initState() {
    super.initState();

    var keyboardVisibilityController = KeyboardVisibilityController();
    sl<FamilyGroupCoverDetailViewModel>().attendee.clear();
    sl<FamilyGroupCoverDetailViewModel>().cardList.clear();
    sl<FamilyGroupCoverDetailViewModel>().listIndex = 0;
    _controller.add({
      'firstName': TextEditingController(),
      'lastName': TextEditingController(),
      'dobDay': TextEditingController(),
      'dobMonth': TextEditingController(),
      'dobYear': TextEditingController(),
      'idCard': TextEditingController(),
      'idCardCode': TextEditingController(),
      'email': TextEditingController(),
    });
    sl<FamilyGroupCoverDetailViewModel>().cardList.add(CoverDetailCardFields(
          heading: R.stringRes.familyCoverDetailScreen.secondTraveler.hardcoded,
          index: 0,
          onEmailChanged: (value, index) {
            sl<FamilyGroupCoverDetailViewModel>().setEmail(value);
          },
          onFirstNameChanged: (value, index) {
            sl<FamilyGroupCoverDetailViewModel>().setFirstName(value);
          },
          onLastNameChanged: (value, index) {
            sl<FamilyGroupCoverDetailViewModel>().setLastName(value);
          },
          onDateChanged: (value, index) {
            sl<FamilyGroupCoverDetailViewModel>().attendee.firstWhere(
                (element) => element.index == index,
                orElse: () => CardData.initial());
            DateTime selectedDate = DateTime.parse(value);
            sl<FamilyGroupCoverDetailViewModel>().setDateOfBirth(selectedDate);

            sl<FamilyGroupCoverDetailViewModel>()
                .attendee
                .elementAt(index)
                .dob = selectedDate;
          },
          onDOBDateChanged: (value, index) {
            if (value.trim().isNotEmpty) {
              DateTime dob =
                  sl<FamilyGroupCoverDetailViewModel>().setDayDOB(value);
              sl<FamilyGroupCoverDetailViewModel>()
                  .attendee
                  .elementAt(index)
                  .dob = dob;
            }
          },
          onDOBMonthChanged: (value, index) {
            if (value.trim().isNotEmpty) {
              DateTime dob =
                  sl<FamilyGroupCoverDetailViewModel>().setMonthDOB(value);
              sl<FamilyGroupCoverDetailViewModel>()
                  .attendee
                  .elementAt(index)
                  .dob = dob;
            }
          },
          onDOBYearChanged: (value, index) {
            if (value.trim().isNotEmpty) {
              DateTime dob =
                  sl<FamilyGroupCoverDetailViewModel>().setYearDOB(value);
              sl<FamilyGroupCoverDetailViewModel>()
                  .attendee
                  .elementAt(index)
                  .dob = dob;
            }
          },
          canRemove: false,
          disableEmailValidator: true,
          onIDCardChanged: (value, index) {
            final data = sl<FamilyGroupCoverDetailViewModel>()
                .attendee
                .firstWhere((element) => element.index == index,
                    orElse: () => CardData.initial());
            if (data.idCard == '') {
              sl<FamilyGroupCoverDetailViewModel>().setIDCard(value);
              return;
            }
            sl<FamilyGroupCoverDetailViewModel>()
                .attendee
                .elementAt(index)
                .idCard = value;
          },
          onIDCardCodeChanged: (value, index) {
            final data = sl<FamilyGroupCoverDetailViewModel>()
                .attendee
                .firstWhere((element) => element.index == index,
                    orElse: () => CardData.initial());
            if (data.idCardCode == '') {
              sl<FamilyGroupCoverDetailViewModel>().setIDCardCode(value);
              return;
            }
            sl<FamilyGroupCoverDetailViewModel>()
                .attendee
                .elementAt(index)
                .idCardCode = value;
          },
          firstNameController: _controller[0]['firstName'],
          lastNameController: _controller[0]['lastName'],
          dobDayController: _controller[0]['dobDay'],
          dobMonthController: _controller[0]['dobMonth'],
          dobYearController: _controller[0]['dobYear'],
          idCardController: _controller[0]['idCard'],
          idCardCodeController: _controller[0]['idCardCode'],
          emailController: _controller[0]['email'],
        ));

    // Subscribe
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        isKeyboardVisible = visible;
      });
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FamilyGroupCoverDetailViewModel>();

    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GenericAppBar(
                      leading: Icon(
                        Icons.arrow_back_ios,
                        color: R.palette.mediumBlack,
                      ),
                      onLeadingPressed: () {
                        sl<Navigation>().goBack(context);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Heading(
                      sl<AttendingCustomerViewModel>().travelingPartner ==
                              TravelingPartner.family
                          ? AppLocalizations.of(context)
                              .txt_hi_user_name_let_get_you_and_your_family_covered(
                                  basicInfoViewModel.firstName
                                      .capitalizeFirstWord())
                          : AppLocalizations.of(context)
                              .txt_hi_user_name_let_get_you_and_your_group_covered(
                                  basicInfoViewModel.firstName
                                      .capitalizeFirstWord()),
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      fontFamily: R.theme.larkenLightFontFamily,
                      color: R.palette.appHeadingTextBlackColor,
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Container(
                      decoration: R.theme.genericCardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return viewModel.cardList[index];
                            },
                            itemCount: viewModel.cardList.length,
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(28.w),
                            child: GenericButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                final data = viewModel.cardData;
                                viewModel.addAttendee(data);
                                viewModel.clear();
                                _controller.add({
                                  'firstName': TextEditingController(),
                                  'lastName': TextEditingController(),
                                  'dobDay': TextEditingController(),
                                  'dobMonth': TextEditingController(),
                                  'dobYear': TextEditingController(),
                                  'idCard': TextEditingController(),
                                  'idCardCode': TextEditingController(),
                                  'email': TextEditingController(),
                                });
                                viewModel.addCard(
                                  CoverDetailCardFields(
                                    heading: convertNumberToTravelerHeading(
                                      context: context,
                                      number: viewModel.listIndex,
                                    ),
                                    isDisableEmail: false,
                                    onTap: (value) {
                                      viewModel.removeCard(value);
                                    },
                                    index: viewModel.listIndex,
                                    onEmailChanged: (value, index) {
                                      final data = viewModel.attendee
                                          .firstWhere(
                                              (element) =>
                                                  element.lastName == value,
                                              orElse: () => CardData.initial());
                                      if (data.email == '') {
                                        viewModel.setEmail(value);
                                        return;
                                      }
                                      viewModel.attendee
                                          .elementAt(viewModel.listIndex)
                                          .email = value;
                                    },
                                    onFirstNameChanged: (value, index) {
                                      final data = viewModel.attendee
                                          .firstWhere(
                                              (element) =>
                                                  element.index == index,
                                              orElse: () => CardData.initial());
                                      if (data.firstName == '') {
                                        viewModel.setFirstName(value);
                                        return;
                                      }
                                      viewModel.attendee
                                          .elementAt(index)
                                          .firstName = value;
                                    },
                                    onLastNameChanged: (value, index) {
                                      final data = viewModel.attendee
                                          .firstWhere(
                                              (element) =>
                                                  element.index == index,
                                              orElse: () => CardData.initial());
                                      if (data.lastName == '') {
                                        viewModel.setLastName(value);
                                        return;
                                      }
                                      viewModel.attendee
                                          .elementAt(index)
                                          .lastName = value;
                                    },
                                    onDateChanged: (value, index) {
                                      viewModel.attendee.firstWhere(
                                          (element) => element.index == index,
                                          orElse: () => CardData.initial());
                                      DateTime selectedDate =
                                          DateTime.parse(value);
                                      viewModel.setDateOfBirth(selectedDate);

                                      viewModel.attendee.elementAt(index).dob =
                                          selectedDate;
                                    },
                                    disableEmailValidator: true,
                                    onIDCardChanged: (value, index) {
                                      final data = viewModel.attendee
                                          .firstWhere(
                                              (element) =>
                                                  element.index == index,
                                              orElse: () => CardData.initial());
                                      if (data.idCard == '') {
                                        viewModel.setIDCard(value);
                                        return;
                                      }
                                      viewModel.attendee
                                          .elementAt(index)
                                          .idCard = value;
                                    },
                                    onIDCardCodeChanged: (value, index) {
                                      final data = viewModel.attendee
                                          .firstWhere(
                                              (element) =>
                                                  element.index == index,
                                              orElse: () => CardData.initial());
                                      if (data.idCardCode == '') {
                                        viewModel.setIDCardCode(value);
                                        return;
                                      }
                                      viewModel.attendee
                                          .elementAt(index)
                                          .idCardCode = value;
                                    },
                                    onDOBDateChanged: (value, index) {
                                      if (value.trim().isNotEmpty) {
                                        DateTime dob =
                                            sl<FamilyGroupCoverDetailViewModel>()
                                                .setDayDOB(value);
                                        sl<FamilyGroupCoverDetailViewModel>()
                                            .attendee
                                            .elementAt(index)
                                            .dob = dob;
                                      }
                                    },
                                    onDOBMonthChanged: (value, index) {
                                      if (value.trim().isNotEmpty) {
                                        DateTime dob =
                                            sl<FamilyGroupCoverDetailViewModel>()
                                                .setMonthDOB(value);
                                        sl<FamilyGroupCoverDetailViewModel>()
                                            .attendee
                                            .elementAt(index)
                                            .dob = dob;
                                      }
                                    },
                                    onDOBYearChanged: (value, index) {
                                      if (value.trim().isNotEmpty) {
                                        DateTime dob =
                                            sl<FamilyGroupCoverDetailViewModel>()
                                                .setYearDOB(value);
                                        sl<FamilyGroupCoverDetailViewModel>()
                                            .attendee
                                            .elementAt(index)
                                            .dob = dob;
                                      }
                                    },
                                    firstNameController:
                                        _controller.last['firstName'],
                                    lastNameController:
                                        _controller.last['lastName'],
                                    dobDayController:
                                        _controller.last['dobDay'],
                                    dobMonthController:
                                        _controller.last['dobMonth'],
                                    dobYearController:
                                        _controller.last['dobYear'],
                                    idCardController:
                                        _controller.last['idCard'],
                                    idCardCodeController:
                                        _controller.last['idCardCode'],
                                    emailController: _controller.last['email'],
                                  ),
                                );
                              },
                              text:AppLocalizations.of(context).txt_add_traveler,
                              fontSize: 16,
                              height: 47.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            viewModel.toggleAgreeToTerm();
                          },
                          child: SquareBox(
                            checkValue: viewModel.agreeToTerm,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: TermsAndCondtions(
                            title:
                                '${AppLocalizations.of(context).txt_i_agree_to} ',
                            fontSize: 16,
                            onPrivacyPress: () {
                              _showDialog(
                                context,
                                TermsAndPolicyPopup(
                                  title: AppLocalizations.of(context)
                                      .txt_privacy_policy,
                                  subtitle: AppLocalizations.of(context)
                                      .txt_effective_date(
                                    DateTime(2024, 1, 1).formatToDoPattern,
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
                                    DateTime(2024, 1, 1).formatToDoPattern,
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
                      height: 40.h,
                    ),
                    GenericButton(
                      onPressed: () async {
                        if (viewModel.attendee.isEmpty) {
                          EasyLoading.showError(AppLocalizations.of(context)
                              .msg_error_add_one_person_to_cover);
                          return;
                        }
                        EasyLoading.show();
                        final quotes = await viewModel.getQuote(
                          sl<CoverQuoteViewModel>(),
                          sl<AttendingCustomerViewModel>(),
                          sl<StartEndPickerViewModel>(),
                          sl<BasicInfoViewModel>(),
                        );
                        sl<QuoteData>().setQuotes(quotes);
                        EasyLoading.dismiss();
                        if (mounted) {
                          sl<Navigation>().pushWithArgs(
                              // ignore: use_build_context_synchronously
                              context,
                              Routes.quoteDetailsRoute,
                              args: quotes);
                        }
                      },
                      text: AppLocalizations.of(context).btn_next,
                      fontSize: 18,
                      isEnable: viewModel.agreeToTerm,
                      height: 58.h,
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    if (isKeyboardVisible) ...[
                      SizedBox(height: 180.h),
                    ]
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

String convertNumberToTravelerHeading(
    {required BuildContext context, required int number}) {
  switch (number) {
    case 0:
      return AppLocalizations.of(context).txt_second_traveller;
    case 1:
      return AppLocalizations.of(context).txt_third_traveler;
    case 2:
      return AppLocalizations.of(context).txt_forth_traveler;
    case 3:
      return AppLocalizations.of(context).txt_fifth_traveler;
    case 4:
      return AppLocalizations.of(context).txt_sixth_traveler;
    case 5:
      return AppLocalizations.of(context).txt_seventh_traveler;
    case 6:
      return AppLocalizations.of(context).txt_eight_traveler;
    case 7:
      return AppLocalizations.of(context).txt_ninth_traveler;
    case 8:
      return AppLocalizations.of(context).txt_tenth_traveler;
    case 9:
      return AppLocalizations.of(context).txt_eleven_traveler;
    case 10:
      return AppLocalizations.of(context).txt_twelve_traveler;
    default:
      return '';
  }
}
