import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/enum/phone_state.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/otp/view_model/otp_viewmodel.dart';
import 'package:travelbox/features/otp/widget/otp_card.dart';
import 'package:travelbox/features/personal_detail/viewmodel/personal_detail_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class OtpMobileScreen extends StatelessWidget {
  final String phoneNumber;
  const OtpMobileScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<OtpViewmodel>(),
        builder: (context, index) {
          return OtpContent(phoneNumber: phoneNumber);
        });
  }
}

class OtpContent extends StatelessWidget {
  final String phoneNumber;
  final personalViewModel = sl<PersonalDetailViewmodel>();
  OtpContent({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OtpViewmodel>();

    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              GenericAppBar(
                leading: Padding(
                  padding: EdgeInsets.only(right: 12.w),
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
                height: 30.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: OtpCard(phoneNumber: phoneNumber),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.center,
                child: GenericButton(
                  isEnable: viewModel.verify,
                  onPressed: () {
                    personalViewModel.setPhoneState(PhoneState.verify);
                    sl<Navigation>().goBack(context);
                  },
                  text: AppLocalizations.of(context).verify,
                  fontSize: 18,
                  fontWeightT: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
