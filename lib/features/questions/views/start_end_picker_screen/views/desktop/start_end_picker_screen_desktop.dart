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
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/picker_card.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/titile_widget_builder.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class PickerScreenDesktop extends StatelessWidget {
  const PickerScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<StartEndPickerViewModel>(),
      builder: (context, child) {
        return PickerScreenContent();
      },
    );
  }
}

class PickerScreenContent extends StatelessWidget {
  final coverViewModel = sl<CoverQuoteViewModel>();

  PickerScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<StartEndPickerViewModel>();
    final loginViewModel = context.watch<LoginViewmodel>();
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            GenericAppBarDesktop(
              showLanguageIcon: loginViewModel.loginState ? false : true,
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
                            sl<Navigation>().push(context, Routes.profileRoute);
                          },
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        const Center(child: AvatarImage()),
                        SizedBox(
                          width: 0.368.sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              SubHeading(
                                AppLocalizations.of(context).txt_cover_picker_description,
                                color: R.palette.appHeadingTextBlackColor,
                                fontSize: 34,
                                fontWeight: FontWeight.w400,
                                fontFamily: R.theme.larkenLightFontFamily,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Center(
                                child: TitleWidgetBuilder(
                                  timeFrame: coverViewModel.timeframeSelected,
                                  // timeFrame: AvailableCoversTimeFrame.annual,
                                  fontSize: 26,
                                  imageSize: 52,
                                ),
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              const PickerCard(),
                              SizedBox(
                                height: 47.h,
                              ),
                              GenericButton(
                                onPressed: () {
                                  sl<Navigation>().push(
                                      context, Routes.attendingCustomerRoute);
                                },
                                text: AppLocalizations.of(context).btn_next,
                                isEnable: viewModel.isButtonEnabled(),
                                fontSize: 20,
                                width: 0.368.sw,
                              ),
                            ],
                          ),
                        ),
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
