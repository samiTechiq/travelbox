import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/language_dialog.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/cover_quote/widget/cover_avatar_image.dart';
import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart';
import 'package:travelbox/features/profile/profile.dart';
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

class BasicInfoScreenMobile extends StatefulWidget {
  const BasicInfoScreenMobile({Key? key}) : super(key: key);

  @override
  State<BasicInfoScreenMobile> createState() => _BasicInfoScreenMobileState();
}

class _BasicInfoScreenMobileState extends State<BasicInfoScreenMobile> {
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
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenericAppBarMobile(
                          isClickable: false,
                          trailing: SvgPicture.asset(
                            loginViewModel.loginState
                                ? R.assets.graphics.person2.path
                                : R.assets.graphics.webIcon.path,
                            height: 43.h,
                            width: 43.w,
                          ),
                          leading: Padding(
                            padding: EdgeInsets.only(right: 9.w),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: R.palette.mediumBlack,
                            ),
                          ),
                          onTrailingPressed: () {
                            loginViewModel.loginState
                                ? _showMyDialog(const ProfileScreen(), context)
                                : _showMyDialog(const LanguageDialog(), context);
                          },
                          onLeadingPressed: () {
                            sl<Navigation>().goBack(context);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const Center(child: AvatarImage()),
                        SizedBox(
                          height: 10.h,
                        ),
                        loginViewModel.loginState
                            ? SubHeading2(
                                '${AppLocalizations.of(context).hi} '
                                '${loginViewModel.user?.firstName ?? loginViewModel.user?.email ?? ''},'
                                '\n${AppLocalizations.of(context).lets_confirm_your_basic_info}',
                                color: R.palette.appHeadingTextBlackColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                fontFamily: R.theme.larkenLightFontFamily,
                              )
                            : RichTextClass(
                                title:
                                    '${AppLocalizations.of(context).txt_already_have_an_account}\n',
                                link: AppLocalizations.of(context).txt_sign_in,
                                orLink:
                                    AppLocalizations.of(context).txt_create_an_account,
                                subTitle: '\n${AppLocalizations.of(context).txt_its_faster_and_could_be_cheaper_for_you}',
                                onTapLink: () {
                                  sl<Navigation>()
                                      .push(context, Routes.loginRoute);
                                },
                                onTapOrLink: () {
                                  sl<Navigation>()
                                      .push(context, Routes.signUpRoute);
                                },
                                fontSize: 27,
                              ),
                        SizedBox(
                          height: 25.h,
                        ),
                        const FieldCard(),
                        SizedBox(
                          height: 40.h,
                        ),
                        GenericButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (viewModel.mobile == null) {
                                viewModel.setPhoneNumberError(AppLocalizations.of(context).msg_error_please_enter_a_mobile_number);
                                return;
                              }
                              if (viewModel.phoneNumberError != null) return;
                              switch (sl<CoverQuoteViewModel>().timeframeSelected) {
                                case AvailableCoversTimeFrame.single:
                                  sl<Navigation>()
                                      .push(context, Routes.pickerScreenRoute);
                                  break;
                                case AvailableCoversTimeFrame.annual:
                                  sl<Navigation>().push(
                                      context, Routes.pickerAnnualScreenRoute);
                                  break;
                                default:
                                  break;
                              }
                            }
                          },
                          text: AppLocalizations.of(context).btn_next,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 0.85.sw,
                          child: Text.rich(
                            TextSpan(
                                text:
                                AppLocalizations.of(context).txt_email_address_policy,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: R.palette.textFieldHintGreyColor,
                                  fontFamily: R.theme.interRegular,
                                ),
                                children: <InlineSpan>[
                                  WidgetSpan(
                                    child: SizedBox(
                                      width: 5.0.w,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: InkWell(
                                      onTap: () {
                                        viewModel.toggleAcceptPolicy();
                                      },
                                      child: SquareBox(
                                        checkValue: viewModel.acceptPolicy,
                                      ),
                                    ),
                                  )
                                ]),
                          )
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(Widget widget, BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
