import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/onboarding/models/travel_insurance.dart';
import 'package:travelbox/features/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/expansion_box/expansion_box.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CheaperTravelInsurance extends StatelessWidget {
  const CheaperTravelInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: CheaperTravelInsuranceMobile(),
      desktopLayout: CheaperTravelInsuranceDesktop(),
    );
  }
}

class CheaperTravelInsuranceDesktop extends StatelessWidget {
  const CheaperTravelInsuranceDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingVM = context.watch<OnboardingViewModel>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: R.palette.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(143, 110, 143, 110),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)
                  .txt_how_to_get_cheaper_travel_insurance,
              style: R.theme.robotoW600.copyWith(
                fontSize: 42,
                color: R.palette.appHeadingTextBlackColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              AppLocalizations.of(context)
                  .txt_cheaper_travel_insurance_description,
              textAlign: TextAlign.center,
              style: R.theme.robotoTextStyle.copyWith(
                fontSize: 16,
                color: R.palette.appHeadingTextBlackColor,
                height: 1.6,
              ),
            ),
            const SizedBox(
              height: 58,
            ),
            LayoutGrid(
              columnSizes: [1.fr, 1.fr],
              rowSizes: const [auto, auto],
              rowGap: 20,
              columnGap: 20,
              children: onboardingVM.cheaperTravelInsurance
                  .mapIndexed((_, policy) => CheaperTravelInsuranceBoxDesktop(
                        travelInsurance: policy,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class CheaperTravelInsuranceMobile extends StatelessWidget {
  const CheaperTravelInsuranceMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onboardingVM = context.watch<OnboardingViewModel>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: R.palette.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 110, 25, 110),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)
                  .txt_how_to_get_cheaper_travel_insurance,
              textAlign: TextAlign.center,
              style: R.theme.robotoW600.copyWith(
                fontSize: 34,
                color: R.palette.appHeadingTextBlackColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              AppLocalizations.of(context)
                  .txt_cheaper_travel_insurance_description,
              textAlign: TextAlign.center,
              style: R.theme.robotoTextStyle.copyWith(
                fontSize: 16,
                color: R.palette.appHeadingTextBlackColor,
                height: 1.6,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ...onboardingVM.cheaperTravelInsurance.mapIndexed((index, value) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CheaperTravelInsuranceBoxMobile(
                  travelInsurance: value,
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class CheaperTravelInsuranceBoxDesktop extends StatelessWidget {
  final TravelInsurance travelInsurance;

  const CheaperTravelInsuranceBoxDesktop({
    super.key,
    required this.travelInsurance,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionBox(
      isExpanded: travelInsurance.isIncluded,
      decoration: BoxDecoration(
        color: R.palette.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: R.palette.boxShadowBlack.withOpacity(0.12),
            offset: Offset(0, 7),
            blurRadius: 20,
          )
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(32, 40, 32, 40),
      headerBuilder: (_, isExpanded) {
        return Row(
          children: [
            Expanded(
              child: Text(
                travelInsurance.title,
                style: R.theme.robotoTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: R.palette.appHeadingTextBlackColor,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              height: 42,
              width: 42,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isExpanded
                      ? R.palette.appPrimaryBlue
                      : R.palette.cottonBollBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(11),
                  child: Center(
                    child: SvgPicture.asset(
                      isExpanded
                          ? R.assets.graphics.icMinus.path
                          : R.assets.graphics.icPlus.path,
                      height: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      bodyBuilder: (_, isExpanded) {
        return Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Text(
            travelInsurance.description,
            maxLines: 4,
            textAlign: TextAlign.start,
            textScaler: TextScaler.linear(1.1),
            style: R.theme.robotoTextStyle.copyWith(
              fontSize: 16,
              color: R.palette.lightGray,
            ),
          ),
        );
      },
    );
  }
}

class CheaperTravelInsuranceBoxMobile extends StatelessWidget {
  final TravelInsurance travelInsurance;

  const CheaperTravelInsuranceBoxMobile({
    super.key,
    required this.travelInsurance,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionBox(
      isExpanded: travelInsurance.isIncluded,
      decoration: BoxDecoration(
        color: R.palette.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: R.palette.cottonBollBlue,
            offset: Offset(0, 5),
            blurRadius: 20,
          )
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(20, 21, 20, 21),
      headerBuilder: (_, isExpanded) {
        return Row(
          children: [
            Expanded(
              child: Text(
                travelInsurance.title,
                style: R.theme.robotoTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: R.palette.appHeadingTextBlackColor,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              height: 32,
              width: 32,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isExpanded
                      ? R.palette.appPrimaryBlue
                      : R.palette.cottonBollBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(9),
                  child: Center(
                    child: SvgPicture.asset(
                      isExpanded
                          ? R.assets.graphics.icMinus.path
                          : R.assets.graphics.icPlus.path,
                      height: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      bodyBuilder: (_, isExpanded) {
        return Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Text(
            travelInsurance.description,
            maxLines: 4,
            textAlign: TextAlign.start,
            style: R.theme.robotoTextStyle.copyWith(
              fontSize: 16,
              color: R.palette.lightGray,
            ),
          ),
        );
      },
    );
  }
}
