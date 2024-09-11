import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/language_dialog.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/cover_quote/widget/cover_avatar_image.dart';
import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/questions/views/basic_info/widget/field_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_rich_text.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class BasicInfoScreenDesktop extends StatefulWidget {
  const BasicInfoScreenDesktop({Key? key}) : super(key: key);

  @override
  State<BasicInfoScreenDesktop> createState() => _BasicInfoScreenDesktopState();
}

class _BasicInfoScreenDesktopState extends State<BasicInfoScreenDesktop> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<BasicInfoViewModel>(),
      builder: (context, child) {
        return BasicInfoContent(formKey: _formKey);
      },
    );
  }
}

class BasicInfoContent extends StatelessWidget {
  const BasicInfoContent({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BasicInfoViewModel>();
    final loginViewModel = context.watch<LoginViewmodel>();
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                          isClickable: true,
                          onTrailingPressed: () {
                            _showMyDialog(context);
                          },
                          leading: Padding(
                            padding: EdgeInsets.only(left: 25.w),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: R.palette.mediumBlack,
                            ),
                          ),
                          onLeadingPressed: () {
                            sl<Navigation>().goBack(context);
                          },
                          trailing: loginViewModel.loginState
                              ? SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 25.w),
                                    child: IconButton(
                                      icon: SvgPicture.asset(
                                        R.assets.graphics.person2.path,
                                        height: 60.h,
                                        width: 60.w,
                                      ),
                                      onPressed: () {
                                        sl<Navigation>().push(
                                            context, Routes.profileRoute);
                                      },
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const Center(child: AvatarImage()),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 0.36.sw,
                          child: Column(
                            children: [
                              loginViewModel.loginState
                                  ? SubHeading(
                                      '${AppLocalizations.of(context).hi} '
                                      '${loginViewModel.user?.firstName ?? loginViewModel.user?.email ?? ''},'
                                      '\n${AppLocalizations.of(context).lets_confirm_your_basic_info}',
                                      color:
                                          R.palette.appHeadingTextBlackColor,
                                      fontSize: 34,
                                      fontWeight: FontWeight.w400,
                                      fontFamily:
                                          R.theme.larkenLightFontFamily,
                                    )
                                  : RichTextClass(
                                      title: AppLocalizations.of(context).txt_already_have_an_account,
                                      link:
                                          "\n${AppLocalizations.of(context).txt_sign_in}",
                                      orLink: AppLocalizations.of(context).txt_create_an_account,
                                      subTitle: ' ${AppLocalizations.of(context).txt_its_faster_and_could_be_cheaper_for_you}',
                                      fontSize: 34,
                                      onTapLink: () {
                                        sl<Navigation>()
                                            .push(context, Routes.loginRoute);
                                      },
                                      onTapOrLink: () {
                                        sl<Navigation>().push(
                                            context, Routes.signUpRoute);
                                      },
                                    ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const FieldCard(),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: AppLocalizations.of(context).txt_email_address_policy,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: R.palette.textFieldHintGreyColor,
                                      fontFamily: R.theme.interRegular,
                                    ),
                                    children: <InlineSpan>[
                                      WidgetSpan(
                                        child: SizedBox(
                                          width: 12.w,
                                          height: 9.h,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: InkWell(
                                          onTap: () {
                                            viewModel.toggleAcceptPolicy();
                                          },
                                          child: SquareBox(
                                            iconColor:
                                                R.palette.appWhiteColor,
                                            innerBoxColor:
                                                R.palette.appPrimaryBlue,
                                            unFillBackColor:
                                                R.palette.appWhiteColor,
                                            border: Border.all(
                                              color: viewModel.acceptPolicy
                                                  ? R.palette.appPrimaryBlue
                                                  : R.palette
                                                      .checkBoxGreyColor,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3.r)),
                                            checkValue:
                                                viewModel.acceptPolicy,
                                            squareBoxSize: 20,
                                            iconSize: 12,
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              GenericButton(
                                width: 0.36.sw,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (viewModel.mobile == null) {
                                      viewModel.setPhoneNumberError(AppLocalizations.of(context).msg_error_please_enter_a_mobile_number);
                                      return;
                                    }
                                    if (viewModel.phoneNumberError != null) {
                                      return;
                                    }
                                    switch (sl<CoverQuoteViewModel>()
                                        .timeframeSelected) {
                                      case AvailableCoversTimeFrame.single:
                                        sl<Navigation>().push(context,
                                            Routes.pickerScreenRoute);
                                        break;
                                      case AvailableCoversTimeFrame.annual:
                                        sl<Navigation>().push(context,
                                            Routes.pickerAnnualScreenRoute);
                                        break;
                                      default:
                                        break;
                                    }
                                  }
                                },
                                text: AppLocalizations.of(context).btn_next,
                                fontSize: 20,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
}
