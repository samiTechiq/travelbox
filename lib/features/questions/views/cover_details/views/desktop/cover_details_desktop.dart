import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/extension/extension.dart';
import 'package:travelbox/features/change_language/language_dialog.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/cover_quote/widget/cover_avatar_image.dart';
import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart';
import 'package:travelbox/features/questions/viewmodel/common_quote_viewmodel.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/viewmodel/cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/widgets/cover_details_card.dart';
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

class CoveredDetailsDesktop extends StatelessWidget {
  final bool checkbox = false;

  const CoveredDetailsDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<CoverDetailViewModel>(),
      builder: (context, child) {
        return const CoveredDetailsDesktopContent();
      },
    );
  }
}

class CoveredDetailsDesktopContent extends StatefulWidget {
  const CoveredDetailsDesktopContent({
    super.key,
  });

  @override
  State<CoveredDetailsDesktopContent> createState() =>
      _CoveredDetailsDesktopContentState();
}

class _CoveredDetailsDesktopContentState
    extends State<CoveredDetailsDesktopContent> {
  final _formKey = GlobalKey<FormState>();
  late StreamSubscription<bool> keyboardSubscription;
  bool isKeyboardVisible = false;
  final basicInfoViewModel = sl.get<BasicInfoViewModel>();
  final attendCustomer = sl.get<AttendingCustomerViewModel>();

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
    context.read<CoverDetailViewModel>().firstNameController.text =
        basicInfoViewModel.firstName!;
    context.read<CoverDetailViewModel>().lastNameController.text =
        basicInfoViewModel.surname!;
    context.read<CoverDetailViewModel>().emailController.text =
        basicInfoViewModel.email!;
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CoverDetailViewModel>();
    final loginViewModel = context.watch<LoginViewmodel>();
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GenericAppBarDesktop(
                            showLanguageIcon:
                                loginViewModel.loginState ? false : true,
                            onTrailingPressed: () {
                              _showMyDialog(context);
                            },
                            leading: Icon(
                              Icons.arrow_back_ios,
                              color: R.palette.mediumBlack,
                            ),
                            onLeadingPressed: () {
                              sl<Navigation>().goBack(context);
                            },
                            trailing: loginViewModel.loginState
                                ? SizedBox(
                                    child: IconButton(
                                      icon: SvgPicture.asset(
                                        R.assets.graphics.person2.path,
                                        height: 60.h,
                                        width: 60.w,
                                      ),
                                      onPressed: () {
                                        sl<Navigation>()
                                            .push(context, Routes.profileRoute);
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                            isClickable: false,
                          ),
                          SizedBox(
                            height: 33.h,
                          ),
                          const Center(child: AvatarImage()),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 0.368.sw,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Heading(
                                  AppLocalizations.of(context).txt_hi_user_name_let_get_you_covered(basicInfoViewModel.firstName.capitalizeFirstWord()),
                                  color: R.palette.appHeadingTextBlackColor,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: R.theme.larkenLightFontFamily,
                                ),
                                SizedBox(
                                  height: 34.h,
                                ),
                                CoveredDetailsCard(
                                  heading: AppLocalizations.of(context).txt_we_need_some_details_from_you,
                                  viewModel: viewModel,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                attendCustomer.travelingPartner ==
                                        TravelingPartner.one
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              viewModel.toggleAgreeToTerms();
                                            },
                                            child: SquareBox(
                                              checkValue:
                                                  viewModel.agreeToTerms,
                                              squareBoxSize: 20,
                                              iconSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12.w,
                                          ),
                                          Flexible(
                                            child: TermsAndCondtions(
                                              title: '${AppLocalizations.of(context).txt_i_agree_to} ',
                                              fontSize: 16,
                                              onPrivacyPress: () {
                                                _showDialog(
                                                  context,
                                                  TermsAndPolicyPopup(
                                                    title: AppLocalizations.of(context).txt_privacy_policy,
                                                    subtitle: AppLocalizations.of(
                                                        context)
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
                                                    title: AppLocalizations.of(context).txt_terms_of_business,
                                                    subtitle: AppLocalizations.of(
                                                        context)
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
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                  height: 47.h,
                                ),
                                GenericButton(
                                  onPressed: () async {
                                    if (!_formKey.currentState!.validate()) {
                                      viewModel.setFormValid(false);
                                      return;
                                    }
                                    if (viewModel.dateOfBirth == null) {
                                      EasyLoading.showError(
                                          AppLocalizations.of(context).msg_error_please_select_date_of_birth);
                                      return;
                                    }
                                    switch (sl<AttendingCustomerViewModel>()
                                        .travelingPartner) {
                                      case TravelingPartner.two:
                                        break;
                                      case TravelingPartner.family:
                                        sl<Navigation>().pushWithArgs(
                                          context,
                                          Routes.familyCoverDetailsRoute,
                                          args: sl<AttendingCustomerViewModel>()
                                              .travelingPartner,
                                        );
                                        break;
                                      case TravelingPartner.group:
                                        sl<Navigation>().pushWithArgs(
                                          context,
                                          Routes.groupCoverDetailsRoute,
                                          args: sl<AttendingCustomerViewModel>()
                                              .travelingPartner,
                                        );
                                        break;
                                      case TravelingPartner.one:
                                        EasyLoading.show();
                                        final quotes = await viewModel.getQuote(
                                            sl<CoverQuoteViewModel>(),
                                            sl<AttendingCustomerViewModel>(),
                                            sl<StartEndPickerViewModel>(),
                                            sl<BasicInfoViewModel>());
                                        sl<QuoteData>().setQuotes(quotes);
                                        viewModel.setFormValid(true);
                                        EasyLoading.dismiss();
                                        if (mounted) {
                                          sl<Navigation>().pushWithArgs(
                                              // ignore: use_build_context_synchronously
                                              context,
                                              Routes.quoteDetailsRoute,
                                              args: quotes);
                                        }
                                        break;
                                      case TravelingPartner.none:
                                        break;
                                    }
                                  },
                                  text:
                                      AppLocalizations.of(context).btn_next,
                                  isEnable: attendCustomer.travelingPartner ==
                                          TravelingPartner.one
                                      ? viewModel.agreeToTerms
                                      : true,
                                  fontSize: 20,
                                  height: 65.h,
                                  width: 0.368.sw,
                                ),
                                SizedBox(
                                  height: 48.h,
                                ),
                                if (isKeyboardVisible) ...[
                                  SizedBox(height: 150.h),
                                ]
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const LanguageDialog();
      },
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
