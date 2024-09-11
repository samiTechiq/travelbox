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

class PolicyRightForYouBox extends StatelessWidget {
  const PolicyRightForYouBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: PolicyRightForYouBoxMobile(),
      desktopLayout: PolicyRightForYouBoxDesktop(),
    );
  }
}

class PolicyRightForYouBoxDesktop extends StatelessWidget {
  const PolicyRightForYouBoxDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingVM = context.watch<OnboardingViewModel>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: R.palette.cottonBollBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(143, 110, 143, 110),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).txt_which_policy_is_right_for_you,
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
                  .txt_policy_is_right_for_you_description,
              textAlign: TextAlign.center,
              textScaler: TextScaler.linear(1.1),
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
              rowSizes: const [auto, auto, auto],
              rowGap: 22.79,
              columnGap: 24,
              children: onboardingVM.policiesRight
                  .mapIndexed((_, policy) => PolicyItemDesktop(
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

class PolicyRightForYouBoxMobile extends StatelessWidget {
  const PolicyRightForYouBoxMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onboardingVM = context.watch<OnboardingViewModel>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: R.palette.cottonBollBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 110, 25, 110),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).txt_which_policy_is_right_for_you,
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
                  .txt_policy_is_right_for_you_description,
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
            ...onboardingVM.policiesRight
                .mapIndexed(
                  (index, value) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: PolicyItemMobile(
                      travelInsurance: value,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

class PolicyItemDesktop extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final TravelInsurance travelInsurance;

  const PolicyItemDesktop({
    super.key,
    required this.travelInsurance,
    this.contentPadding,
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

class PolicyItemMobile extends StatelessWidget {
  final TravelInsurance travelInsurance;

  const PolicyItemMobile({
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
