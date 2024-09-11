import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/onboarding/models/insurance_offer.dart';
import 'package:travelbox/features/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class OfferBox extends StatelessWidget {
  const OfferBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: OfferBoxMobile(),
      desktopLayout: OfferBoxDesktop(),
    );
  }
}

class OfferBoxDesktop extends StatelessWidget {
  const OfferBoxDesktop({super.key});

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
              AppLocalizations.of(context).txt_ready_to_check_out_what_on_offer,
              textAlign: TextAlign.center,
              style: R.theme.robotoW600.copyWith(
                fontSize: 42,
                color: R.palette.appHeadingTextBlackColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              AppLocalizations.of(context).txt_offer_description,
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
            Row(
              children: onboardingVM.insuranceOffers.mapIndexed((index, offer) => Expanded(
                child: OfferItem(
                  index: (index + 1),
                  offer: onboardingVM.insuranceOffers[index],
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class OfferBoxMobile extends StatelessWidget {
  const OfferBoxMobile({super.key});

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
              AppLocalizations.of(context).txt_ready_to_check_out_what_on_offer,
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
              AppLocalizations.of(context).txt_offer_description,
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
            ...onboardingVM.insuranceOffers.mapIndexed((index, offer) => Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: OfferItem(
                offer: onboardingVM.insuranceOffers[index], index: (index + 1),
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}

class OfferItem extends StatelessWidget {
  final int index;
  final InsuranceOffer offer;

  const OfferItem({
    super.key,
    required this.index,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            '$index',
            style: TextStyle(
              fontFamily: R.theme.larkenDemoRegular,
              fontWeight: FontWeight.w700,
              fontSize: 42,
              color: R.palette.appPrimaryBlue,
            ),
          ),
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offer.title,
                maxLines: null,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: R.theme.roboto,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: R.palette.appHeadingTextBlackColor,
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                offer.description,
                maxLines: null,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: R.theme.roboto,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: R.palette.lightGray,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
