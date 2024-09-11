import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/domain/network/network.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CheckPricingBox extends StatelessWidget {
  const CheckPricingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: CheckPricingBoxMobile(),
      desktopLayout: CheckPricingBoxDesktop(),
    );
  }
}

/// Desktop
class CheckPricingBoxDesktop extends StatelessWidget {
  const CheckPricingBoxDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Image.asset(R.assets.graphics.travelSuitcase.path),
                    SizedBox(height: 120,)
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    SubHeading2(
                      AppLocalizations.of(context).onboarding_1,
                      fontWeight: FontWeight.w500,
                      color: R.palette.appHeadingTextBlackColor,
                      fontFamily: R.theme.larkenLightFontFamily,
                      textAlign: TextAlign.center,
                      fontSize: 72,
                      height: 1.1,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 58.0, right: 58),
                      child: SubHeading2(
                        AppLocalizations.of(context).onboarding_2,
                        color: R.palette.appHeadingTextBlackColor,
                        fontFamily: R.theme.roboto,
                        fontSize: 30,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: R.palette.appPrimaryBlue,
                      ),
                      child: SizedBox(
                        height: 65,
                        width: 313,
                        child: InkWell(
                          onTap: () {
                            sl<Navigation>()
                                .push(context, Routes.coverQuoteRoute);
                          },
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context).check_pricing,
                              style: TextStyle(
                                fontFamily: R.theme.interRegular,
                                fontWeight: FontWeight.w600,
                                color: R.palette.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                    child: Image.asset(
                  R.assets.graphics.travelHat.path,
                  fit: BoxFit.contain,
                )),
              ),
            ],
          ),
        ),
        // Positioned(
        //   left: 0,
        //   top: 0,
        //   child: Image.asset(R.assets.graphics.travelHat.path),
        // ),
        // Positioned(
        //   child: Image.asset(R.assets.graphics.travelSuitcase.path),
        // ),
      ],
    );
  }
}

/// Mobile
class CheckPricingBoxMobile extends StatelessWidget {
  const CheckPricingBoxMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: SizedBox(
            child: Heading(
              AppLocalizations.of(context).onboarding_1,
              fontWeight: FontWeight.w400,
              color: R.palette.appHeadingTextBlackColor,
              fontFamily: R.theme.larkenLightFontFamily,
              fontSize: 28,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SizedBox(
            child: SubHeading2(
              AppLocalizations.of(context).onboarding_2,
              color: R.palette.appHeadingTextBlackColor,
              fontFamily: R.theme.interRegular,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 42,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: AppButton.generic(
            onPressed: () async {
              final isNetworkConnected = await sl<NetworkInfo>().isConnected;
              if (!isNetworkConnected) {
                EasyLoading.showError(
                  AppLocalizations.of(context).msg_error_no_internet_connection,
                );
              } else {
                sl<Navigation>().push(context, Routes.coverQuoteRoute);
              }
            },
            text: AppLocalizations.of(context).check_pricing,
            fontSize: 15,
            fontWeightT: FontWeight.w600,
            color: R.palette.appPrimaryBlue,
            height: 50,
            radius: 5,
            buttonTextColor: R.palette.white,
          ),
        ),
        const SizedBox(
          height: 420,
        ),
      ],
    );
  }
}
