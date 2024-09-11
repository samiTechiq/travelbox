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
import 'package:travelbox/features/cover_quote/widget/cover_avatar_image.dart';
import 'package:travelbox/features/questions/viewmodel/common_quote_viewmodel.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/questions/views/both_cover_detail/viewmodel/both_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/widgets/cover_details_card.dart';
import 'package:travelbox/features/questions/views/second_traveler_detail/viewmodel/second_travel_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
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

class SecondCoveredDetailedDesktop extends StatelessWidget {
  const SecondCoveredDetailedDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<SecondTravelCoverDetailsViewModel>(),
      builder: (context, child) {
        return const SecondCoveredDetailedDesktopContent();
      },
    );
  }
}

class SecondCoveredDetailedDesktopContent extends StatefulWidget {
  const SecondCoveredDetailedDesktopContent({
    super.key,
  });

  @override
  State<SecondCoveredDetailedDesktopContent> createState() =>
      _SecondCoveredDetailedDesktopContentState();
}

class _SecondCoveredDetailedDesktopContentState
    extends State<SecondCoveredDetailedDesktopContent> {
  final _formKey = GlobalKey<FormState>();
  late StreamSubscription<bool> keyboardSubscription;
  bool isKeyboardVisible = false;
  final basicInfoViewModel = sl.get<BasicInfoViewModel>();

  @override
  void initState() {
    super.initState();

    var keyboardVisibilityController = KeyboardVisibilityController();

    // Subscribe
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        isKeyboardVisible = visible;
      });
    });
    context.read<SecondTravelCoverDetailsViewModel>().firstNameController.text =
        '';
    context.read<SecondTravelCoverDetailsViewModel>().lastNameController.text =
        '';
    context.read<SecondTravelCoverDetailsViewModel>().emailController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SecondTravelCoverDetailsViewModel>();
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenericAppBarDesktop(
                          trailing: const SizedBox(),
                          leading: InkWell(
                            onTap: () {
                              sl<Navigation>().goBack(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 25.w),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: R.palette.mediumBlack,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 0.368.sw,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 33.h,
                                ),
                                const Center(child: AvatarImage()),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Heading(
                                  AppLocalizations.of(context).txt_hi_user_name_let_get_you_both_covered(basicInfoViewModel.firstName.capitalizeFirstWord()),
                                  fontSize: 34,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: R.theme.larkenLightFontFamily,
                                  color: R.palette.appHeadingTextBlackColor,
                                ),
                                SizedBox(
                                  height: 34.h,
                                ),
                                CoveredDetailsCard(
                                  heading: AppLocalizations.of(context).txt_second_traveller,
                                  viewModel: viewModel,
                                  disableEmailValidator: true,
                                  isMendatory: true,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        viewModel.toggleAgreeToTerms();
                                      },
                                      child: SquareBox(
                                        checkValue: viewModel.agreeToTerms,
                                        squareBoxSize: 20,
                                        iconSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Expanded(
                                      child: TermsAndCondtions(
                                        title: '${AppLocalizations.of(context).txt_i_agree_to} ',
                                        fontSize: 16,
                                        onPrivacyPress: () {
                                          _showDialog(
                                            context,
                                            TermsAndPolicyPopup(
                                              title: AppLocalizations.of(context).txt_privacy_policy,
                                              subtitle:
                                                  AppLocalizations.of(context).txt_effective_date(
                                                    DateTime(2024,1,1).formatToDoPattern
                                                  ),
                                              content: termsData,
                                            ),
                                          );
                                        },
                                        onTermPress: () {
                                          _showDialog(
                                            context,
                                            TermsAndPolicyPopup(
                                              title: AppLocalizations.of(context).txt_terms_of_business,
                                              subtitle:
                                              AppLocalizations.of(context).txt_effective_date(
                                                  DateTime(2024,1,1).formatToDoPattern
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
                                  height: 47.h,
                                ),
                                GenericButton(
                                  onPressed: () async {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    if (viewModel.dateOfBirth == null) {
                                      EasyLoading.showError(
                                          AppLocalizations.of(context).msg_error_please_select_date_of_birth);
                                      return;
                                    }
                                    EasyLoading.show();
                                    final quotes =
                                        await viewModel.getQuoteForTwo(
                                      sl<CoverQuoteViewModel>(),
                                      sl<AttendingCustomerViewModel>(),
                                      sl<StartEndPickerViewModel>(),
                                      sl<BasicInfoViewModel>(),
                                      sl<BothCoverDetailViewModel>(),
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
                                  text:
                                      AppLocalizations.of(context).btn_next,
                                  isEnable: viewModel.agreeToTerms,
                                  fontSize: 20,
                                  height: 65.h,
                                  width: 0.368.sw,
                                ),
                                SizedBox(
                                  height: 33.h,
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      sl<Navigation>().goBack(context);
                                    },
                                    child: SubHeading(
                                      AppLocalizations.of(context).txt_go_back('< '),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: R.palette.textFieldHintGreyColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 32.h,
                                ),
                                if (isKeyboardVisible) ...[
                                  SizedBox(height: 250.h),
                                ]
                              ],
                            ),
                          ),
                        )
                      ],
                    )
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
