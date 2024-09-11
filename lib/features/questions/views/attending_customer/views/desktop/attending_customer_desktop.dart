import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/change_language/language_dialog.dart';
import 'package:travelbox/features/cover_quote/widget/cover_avatar_image.dart';
import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart';
import 'package:travelbox/features/questions/views/attending_customer/model/attending_customer_data.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/attending_customer/widget/attender_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class AttendingCustomerDesktop extends StatelessWidget {
  const AttendingCustomerDesktop({Key? key}) : super(key: key);

  // static List<AttendingCustomerDataModel> data = [
  //   AttendingCustomerDataModel(
  //     title: R.stringRes.attendingCustomerScreen.listAttendOne,
  //     travelingPartner: TravelingPartner.one,
  //   ),
  //   AttendingCustomerDataModel(
  //     title: R.stringRes.attendingCustomerScreen.listAttendTwo,
  //     travelingPartner: TravelingPartner.two,
  //   ),
  //   AttendingCustomerDataModel(
  //     title: R.stringRes.attendingCustomerScreen.listAttendFamily,
  //     travelingPartner: TravelingPartner.family,
  //   ),
  //   AttendingCustomerDataModel(
  //     title: R.stringRes.attendingCustomerScreen.listAttendGroup,
  //     travelingPartner: TravelingPartner.group,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    final data = _attendingData(context);

    return ChangeNotifierProvider.value(
      value: sl<AttendingCustomerViewModel>(),
      builder: (context, child) {
        return AttendingCustomerContent(data: data
        );
      },
    );
  }

  List<AttendingCustomerDataModel> _attendingData(BuildContext context) => [
    AttendingCustomerDataModel(
      title: AppLocalizations.of(context).txt_just_the_one,
      travelingPartner: TravelingPartner.one,
    ),
    AttendingCustomerDataModel(
      title: AppLocalizations.of(context).txt_we_are_two,
      travelingPartner: TravelingPartner.two,
    ),
    AttendingCustomerDataModel(
      title: AppLocalizations.of(context).txt_we_are_a_family,
      travelingPartner: TravelingPartner.family,
    ),
    AttendingCustomerDataModel(
      title: AppLocalizations.of(context).txt_we_are_a_group,
      travelingPartner: TravelingPartner.group,
    ),
  ];
}

class AttendingCustomerContent extends StatelessWidget {
  const AttendingCustomerContent({
    super.key,
    required this.data,
  });

  final List<AttendingCustomerDataModel> data;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AttendingCustomerViewModel>();
    final loginViewModel = context.watch<LoginViewmodel>();
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            GenericAppBarDesktop(
              showLanguageIcon: loginViewModel.loginState ? false : true,
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
              isClickable: false,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 33.h,
                      ),
                      const Center(child: AvatarImage()),
                      SizedBox(
                        height: 20.h,
                      ),
                      Flexible(
                        child: SizedBox(
                          width: 0.368.sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Heading(
                                AppLocalizations.of(context).txt_whose_going_to_need_cover_on_this_trip,
                                color: R.palette.appHeadingTextBlackColor,
                                fontSize: 34,
                                fontWeight: FontWeight.w400,
                                fontFamily: R.theme.larkenLightFontFamily,
                              ),
                              SizedBox(
                                height: 34.h,
                              ),
                              AttenderCard(
                                data: data,
                                checkValue: false,
                                itemFontSize: 5,
                              ),
                              SizedBox(
                                height: 47.h,
                              ),
                              SizedBox(
                                width: 0.368.sw,
                                height: 65.h,
                                child: GenericButton(
                                  onPressed: () {
                                    navigateToScreen(
                                        viewModel.travelingPartner, context);
                                  },
                                  text: AppLocalizations.of(context).btn_next,
                                  isEnable: viewModel.attendingCustomer != '',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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

  navigateToScreen(TravelingPartner partner, BuildContext context) {
    switch (partner) {
      case TravelingPartner.one:
        sl<Navigation>().push(
          context,
          Routes.coverDetailsRoute,
        );
        break;
      case TravelingPartner.two:
        sl<Navigation>().push(context, Routes.bothCoverDetailsRoute);
        break;
      case TravelingPartner.family:
        sl<Navigation>().push(
          context,
          Routes.coverDetailsRoute,
        );
        break;
      case TravelingPartner.group:
        sl<Navigation>().push(
          context,
          Routes.coverDetailsRoute,
        );
        break;
      case TravelingPartner.none:
        break;
    }
  }
}
