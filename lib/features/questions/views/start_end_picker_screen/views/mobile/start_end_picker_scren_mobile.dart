import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/cover_quote/widget/cover_avatar_image.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/picker_card.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/titile_widget_builder.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class PickerScreenMobile extends StatelessWidget {
  const PickerScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<StartEndPickerViewModel>(),
      builder: (context, child) {
        return const PickerScreenContent();
      },
    );
  }
}

class PickerScreenContent extends StatelessWidget {
  const PickerScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final coverViewModel = sl<CoverQuoteViewModel>();
    final viewModel = context.watch<StartEndPickerViewModel>();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: R.palette.appBackgroundColor,
          child: Form(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenericAppBarMobile(
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
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const Center(child: AvatarImage()),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: SizedBox(
                            width: 0.88.sw,
                            child: Heading(
                              AppLocalizations.of(context).txt_cover_picker_description,
                              color: R.palette.appHeadingTextBlackColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              fontFamily: R.theme.larkenLightFontFamily,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: Center(
                            child: TitleWidgetBuilder(
                              timeFrame: coverViewModel.timeframeSelected,
                              // timeFrame: AvailableCoversTimeFrame.annual,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        Center(
                          child: SizedBox(
                            width: 0.88.sw,
                            child: const PickerCard(),
                          ),
                        ),
                        SizedBox(
                          height: 121.h,
                        ),
                        Center(
                          child: GenericButton(
                            onPressed: () {
                              sl<Navigation>()
                                  .push(context, Routes.attendingCustomerRoute);
                            },
                            text: AppLocalizations.of(context).btn_next,
                            isEnable: viewModel.isButtonEnabled(),
                            width: 0.88.sw,
                            height: 58.h,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        )
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
}
