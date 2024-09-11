import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/network/network.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class OnBoardingTablet extends StatelessWidget {
  const OnBoardingTablet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            R.assets.graphics.onBoardingDesktop.path,
            fit: BoxFit.fill,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.2.sh,
            ),
            Heading(
              AppLocalizations.of(context).txt_travel_insurance_purchase_journey,
              fontWeight: FontWeight.bold,
              fontFamily: R.theme.larken,
              fontSize: 32,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 0.7.sw,
              child: SubHeading2(
                AppLocalizations.of(context).txt_combining_insurtech_and_travtech,
                color: R.palette.white,
                fontFamily: R.theme.interRegular,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            GenericButton(
              onPressed: () async {
                if (!await sl<NetworkInfo>().isConnected) {
                  Future.delayed(Duration.zero, () {
                    EasyLoading.showError(AppLocalizations.of(context).msg_error_no_internet_connection);
                  });
                  return;
                }

                Future.delayed(Duration.zero, () {
                  // ignore: use_build_context_synchronously
                  sl<Navigation>().push(context, Routes.coverQuoteRoute);
                });
              },
              text: AppLocalizations.of(context).check_pricing,
              fontSize: 6.spMin,
              fontWeightT: FontWeight.w600,
              color: R.palette.white,
              width: 90,
              height: 40,
              radius: 10,
              buttonTextColor: R.palette.appPrimaryBlue,
            ),
          ],
        ),
      ],
    );
  }
}
