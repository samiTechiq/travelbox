import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/extension/extension.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart';
import 'package:travelbox/features/questions/views/both_cover_detail/viewmodel/both_cover_detail_viewmodel.dart';
import 'package:travelbox/features/questions/views/cover_details/widgets/cover_details_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class BothCoveredDetailsMobile extends StatelessWidget {
  const BothCoveredDetailsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<BothCoverDetailViewModel>(),
      builder: (context, child) {
        return const BothCoveredDetailsMobileContent();
      },
    );
  }
}

class BothCoveredDetailsMobileContent extends StatefulWidget {
  const BothCoveredDetailsMobileContent({
    super.key,
  });

  @override
  State<BothCoveredDetailsMobileContent> createState() =>
      _BothCoverDetailsMobileContentState();
}

class _BothCoverDetailsMobileContentState
    extends State<BothCoveredDetailsMobileContent> {
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
    // context.read<BothCoverDetailViewModel>().firstNameController.text =
    // basicInfoViewModel.firstName!;
    // context.read<BothCoverDetailViewModel>().lastNameController.text =
    // basicInfoViewModel.surname!;
    // context.read<BothCoverDetailViewModel>().emailController.text =
    // basicInfoViewModel.email!;
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BothCoverDetailViewModel>();

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
                      AppLocalizations.of(context).txt_hi_user_name_let_get_you_covered(basicInfoViewModel.firstName.capitalizeFirstWord()),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: R.theme.larkenLightFontFamily,
                      color: R.palette.appHeadingTextBlackColor,
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    CoveredDetailsCard(
                      heading:
                          AppLocalizations.of(context).txt_we_need_some_details_from_you,
                      viewModel: viewModel,
                    ),
                    SizedBox(
                      height: 53.h,
                    ),
                    GenericButton(
                      onPressed: () {
                        if (viewModel.dateOfBirth == null) {
                          EasyLoading.showError(AppLocalizations.of(context).msg_error_please_select_date_of_birth);
                          return;
                        }
                        if (_formKey.currentState!.validate()) {
                          switch (sl<AttendingCustomerViewModel>()
                              .travelingPartner) {
                            case TravelingPartner.two:
                              context.push(Routes.secondCoverDetailsRoute);
                              break;
                            case TravelingPartner.family:
                              context.push(Routes.secondCoverDetailsRoute);
                              break;
                            case TravelingPartner.group:
                              context.push(Routes.secondGroupCoverDetailsRoute);
                              break;
                            case TravelingPartner.one:
                              break;
                            case TravelingPartner.none:
                              break;
                          }
                        }
                      },
                      text: AppLocalizations.of(context).btn_next,
                      fontSize: 18,
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
}
