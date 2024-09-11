import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/widget/cover_avatar_image.dart';
import 'package:travelbox/features/questions/views/attending_customer/model/attending_customer_data.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/features/questions/views/attending_customer/widget/attender_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class AttendingCustomerMobile extends StatelessWidget {
  const AttendingCustomerMobile({Key? key}) : super(key: key);

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
        return AttendingCustomerContent(data: data);
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
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GenericAppBar(
                  leading: Padding(
                    padding: EdgeInsets.only(right: 25.w),
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
                SizedBox(
                  width: 0.621.sw,
                  child: Heading(
                    AppLocalizations.of(context).txt_whose_going_to_need_cover_on_this_trip,
                    color: R.palette.appHeadingTextBlackColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    fontFamily: R.theme.larkenLightFontFamily,
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                AttenderCard(
                  data: data,
                  checkValue: false,
                ),
                const Spacer(),
                GenericButton(
                  onPressed: () {
                    navigateToScreen(viewModel.travelingPartner, context);
                  },
                  text: AppLocalizations.of(context).btn_next,
                  isEnable: viewModel.attendingCustomer != '',
                  height: 58.h,
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigateToScreen(TravelingPartner partner, BuildContext context) {
    switch (partner) {
      case TravelingPartner.one:
        sl<Navigation>().pushWithArgs(
          context,
          Routes.coverDetailsRoute,
          args: TravelingPartner.one,
        );
        break;
      case TravelingPartner.two:
        sl<Navigation>().push(context, Routes.bothCoverDetailsRoute);
        break;
      case TravelingPartner.family:
        sl<Navigation>().pushWithArgs(
          context,
          Routes.coverDetailsRoute,
          args: TravelingPartner.family,
        );
        break;
      case TravelingPartner.group:
        sl<Navigation>().pushWithArgs(
          context,
          Routes.coverDetailsRoute,
          args: TravelingPartner.group,
        );
        break;
      case TravelingPartner.none:
        break;
    }
  }
}
