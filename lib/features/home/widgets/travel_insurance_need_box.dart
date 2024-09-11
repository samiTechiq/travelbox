import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class TravelInsuranceNeedBox extends StatelessWidget {
  const TravelInsuranceNeedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: TravelInsuranceNeedBoxMobile(),
      desktopLayout: TravelInsuranceNeedBoxDesktop(),
    );
  }
}

class TravelInsuranceNeedBoxDesktop extends StatelessWidget {
  const TravelInsuranceNeedBoxDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: R.palette.cottonBollBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(121, 110, 121, 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SubHeading2(
                AppLocalizations.of(context).txt_one_app_for_all_your_travel_insurance_needs,
                fontWeight: FontWeight.w600,
                color: R.palette.appHeadingTextBlackColor,
                fontFamily: R.theme.roboto,
                textAlign: TextAlign.center,
                fontSize: 42,
                height: 1.1,
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TravelInsuranceItem(
                            text: AppLocalizations.of(context)
                                .txt_travel_insurance_with_multiple_cover_extensions
                                .hardcoded,
                            textAlign: TextAlign.end,
                            suffix: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: R.palette.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 6),
                                      blurRadius: 30,
                                      color: R.palette.insuranceBlurShadowBlue
                                          .withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: SvgPicture.asset(
                                    R.assets.graphics.multipleCoverExtension
                                        .path,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 61,
                          ),
                          TravelInsuranceItem(
                            text: AppLocalizations.of(context)
                                .txt_flexibility_to_dynamically_tailor_protection_and_price,
                            textAlign: TextAlign.end,
                            suffix: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: R.palette.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 6),
                                      blurRadius: 30,
                                      color: R.palette.insuranceBlurShadowBlue
                                          .withOpacity(0.2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: SvgPicture.asset(
                                      R.assets.graphics.protection.path),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 38, right: 38),
                        child: Image.asset(
                          R.assets.graphics.appOnIphone.path,
                          width: 324,
                          // height: 656,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TravelInsuranceItem(
                        text: AppLocalizations.of(context)
                            .txt_easy_self_service_options_to_buy_and_manage_insurance
                            .hardcoded,
                        textAlign: TextAlign.start,
                        prefix: DecoratedBox(
                          decoration: BoxDecoration(
                            color: R.palette.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 6),
                                blurRadius: 30,
                                color: R.palette.insuranceBlurShadowBlue
                                    .withOpacity(0.2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: SvgPicture.asset(
                                R.assets.graphics.manageInsurance.path),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
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
                      sl<Navigation>().push(context, Routes.coverQuoteRoute);
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
            ],
          ),
        ),
      ),
    );
  }
}

class TravelInsuranceNeedBoxMobile extends StatelessWidget {
  const TravelInsuranceNeedBoxMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: R.palette.cottonBollBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(52, 186, 52, 110),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SubHeading2(
                AppLocalizations.of(context).txt_one_app_for_all_your_travel_insurance_needs,
                fontWeight: FontWeight.w600,
                color: R.palette.appHeadingTextBlackColor,
                fontFamily: R.theme.roboto,
                textAlign: TextAlign.center,
                fontSize: 34,
                height: 1.1,
              ),
              const SizedBox(
                height: 42,
              ),
              Image.asset(
                R.assets.graphics.appOnIphone.path,
                width: 324,
                // height: 656,
              ),
              const SizedBox(
                height: 67,
              ),
              TravelInsuranceItem(
                text: AppLocalizations.of(context)
                    .txt_travel_insurance_with_multiple_cover_extensions
                    .hardcoded,
                textAlign: TextAlign.start,
                prefix: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: R.palette.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 6),
                          blurRadius: 30,
                          color: R.palette.insuranceBlurShadowBlue
                              .withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SvgPicture.asset(
                        R.assets.graphics.multipleCoverExtension.path,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TravelInsuranceItem(
                text: AppLocalizations.of(context)
                    .txt_flexibility_to_dynamically_tailor_protection_and_price,
                textAlign: TextAlign.start,
                prefix: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: R.palette.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 6),
                          blurRadius: 30,
                          color: R.palette.insuranceBlurShadowBlue
                              .withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SvgPicture.asset(
                          R.assets.graphics.protection.path),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TravelInsuranceItem(
                text: AppLocalizations.of(context)
                    .txt_easy_self_service_options_to_buy_and_manage_insurance
                    .hardcoded,
                textAlign: TextAlign.start,
                prefix: DecoratedBox(
                  decoration: BoxDecoration(
                    color: R.palette.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 6),
                        blurRadius: 30,
                        color: R.palette.insuranceBlurShadowBlue
                            .withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SvgPicture.asset(
                        R.assets.graphics.manageInsurance.path),
                  ),
                ),
              ),
              const SizedBox(
                height: 62,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: R.palette.appPrimaryBlue,
                ),
                child: SizedBox(
                  height: 50,
                  width: 249,
                  child: InkWell(
                    onTap: () {
                      sl<Navigation>().push(context, Routes.coverQuoteRoute);
                    },
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).check_pricing,
                        style: TextStyle(
                          fontFamily: R.theme.interRegular,
                          fontWeight: FontWeight.w600,
                          color: R.palette.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TravelInsuranceItem extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Widget? prefix;
  final Widget? suffix;

  const TravelInsuranceItem({
    super.key,
    required this.text,
    this.textAlign,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (prefix != null) ...[
          SizedBox(
            height: 86,
            width: 86,
            child: prefix,
          ),
          const SizedBox(
            width: 19,
          ),
        ],
        Expanded(
          child: Text(
            text,
            maxLines: null,
            textScaler: TextScaler.linear(1.1),
            textAlign: textAlign,
            style: R.theme.robotoTextStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
        ),
        if (suffix != null) ...[
          const SizedBox(
            width: 19,
          ),
          SizedBox(
            height: 86,
            width: 86,
            child: suffix,
          ),
        ],
      ],
    );
  }
}
