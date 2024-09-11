import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/onboarding/models/insurance_offer.dart';
import 'package:travelbox/features/onboarding/models/insurance_policy.dart';
import 'package:travelbox/features/onboarding/models/travel_insurance.dart';
import 'package:travelbox/utils/core/store/common_shared_perferences.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';

@LazySingleton()
class OnboardingViewModel extends ChangeNotifier {
  bool? isLoggedIn;
  final CommonSharedPreferences commonSharedPreferences =
      sl<CommonSharedPreferences>();

  Future<bool?> getConfigs() async {
    isLoggedIn = await commonSharedPreferences.getLoggedIn();
    return isLoggedIn;
  }

  Future<List<InsurancePolicy>> getInsurancePolices() async {
    // for call api
    return [
      InsurancePolicy(
        coverImage: '',
        title: 'Your health'.hardcoded,
        policies: [
          'Emergency accident'.hardcoded,
          'Emergency medical  expenses'.hardcoded,
          'Follow-up medical  expenses'.hardcoded,
        ],
      ),
      InsurancePolicy(
        coverImage: '',
        title: 'Your trip'.hardcoded,
        policies: [
          'Trip cancellations'.hardcoded,
          'Trip delay'.hardcoded,
          'Trip interruption'.hardcoded,
        ],
      ),
      InsurancePolicy(
        coverImage: '',
        title: 'Your stuff'.hardcoded,
        policies: [
          'Loss or damage to  personal'.hardcoded,
          'property'.hardcoded,
          'Loss of money'.hardcoded,
          'Home contents'.hardcoded,
        ],
      ),
      InsurancePolicy(
        coverImage: '',
        title: 'Available extras'.hardcoded,
        policies: [
          'Gadget cover'.hardcoded,
          'Cruise cover'.hardcoded,
          'Personal liability'.hardcoded,
          'Adventure and  extreme sports'.hardcoded,
          'More'.hardcoded,
        ],
      ),
    ];
  }

  List<InsurancePolicy> get insurancePolicies => [
    InsurancePolicy(
      coverImage: R.assets.graphics.coveredHealth.path,
      title: 'Your health'.hardcoded,
      policies: [
        'Emergency accident'.hardcoded,
        'Emergency medical  expenses'.hardcoded,
        'Follow-up medical  expenses'.hardcoded,
      ],
    ),
    InsurancePolicy(
      coverImage: R.assets.graphics.coveredTrip.path,
      title: 'Your trip'.hardcoded,
      policies: [
        'Trip cancellations'.hardcoded,
        'Trip delay'.hardcoded,
        'Trip interruption'.hardcoded,
      ],
    ),
    InsurancePolicy(
      coverImage: R.assets.graphics.coveredStuff.path,
      title: 'Your stuff'.hardcoded,
      policies: [
        'Loss or damage to  personal property'.hardcoded,
        'Loss of money'.hardcoded,
        'Home contents'.hardcoded,
      ],
    ),
    InsurancePolicy(
      coverImage: R.assets.graphics.coveredExtra.path,
      title: 'Available extras'.hardcoded,
      policies: [
        'Gadget cover'.hardcoded,
        'Cruise cover'.hardcoded,
        'Personal liability'.hardcoded,
        'Adventure and  extreme sports'.hardcoded,
        'More'.hardcoded,
      ],
      isExtras: true,
    ),
  ];

  List<TravelInsurance> get policiesRight => [
    TravelInsurance(title: 'Annual multi-trip'.hardcoded, description: 'Save time and money with annual multi-trip coverage for multiple holidays annually, typically up to 90 days per trip'.hardcoded, isIncluded: false,),
    TravelInsurance(title: 'Single trip'.hardcoded, description: 'Often the cheapest policy option, single trip policies provide cover  for one trip, normally up to 90 days'.hardcoded, isIncluded: false,),
    TravelInsurance(title: 'Winter sports'.hardcoded, description: 'Protection for winter sports enthusiasts, including equipment like skis and snowboards.'.hardcoded, isIncluded: false,),
    TravelInsurance(title: 'Family travel insurance'.hardcoded, description: 'Family travel insurance covers one to two adults, and up to eight  children.'.hardcoded, isIncluded: false,),
    TravelInsurance(title: 'Cruise cover'.hardcoded, description: 'Covers everything standard travel insurance does, but with a few cruise specific extras.'.hardcoded, isIncluded: false,),
    TravelInsurance(title: 'Business travel'.hardcoded, description: 'Customized insurance for business trips, featuring coverage for  electronics and extra travel expenses.'.hardcoded, isIncluded: false,),
  ];

  List<TravelInsurance> get cheaperTravelInsurance => [
    TravelInsurance(title: 'Compare quotes'.hardcoded, description: 'Comparing quotes from several insurers makes it easier to assess  whether the price and features meets your needs.'.hardcoded, isIncluded: false,),
    TravelInsurance(title: 'Consider annual cover'.hardcoded, description: 'If you travel more than twice a year, an annual multi-trip policy can  be a money saving option.'.hardcoded, isIncluded: false,),
    TravelInsurance(title: 'Consider optional extras'.hardcoded, description: 'Optional add-ons like Gadget cover can enhance your coverage, but  it’s always worth checking what’s already covered by other policies'.hardcoded, isIncluded: false,),
    TravelInsurance(title: 'Group travel cover'.hardcoded, description: 'Grouping family members or multiple travellers under one policy  may well be a cheaper option than separate cover per person.'.hardcoded, isIncluded: false,),
  ];

  List<InsuranceOffer> get insuranceOffers => [
    InsuranceOffer(title: 'Tell us about whose travelling'.hardcoded, description: 'Give a few details about yourself or you and  travelling party, your travel plans and what  you need cover for'.hardcoded),
    InsuranceOffer(title: 'We’ll do the heavy lifting'.hardcoded, description: 'We’ll dynamically price and put together a list  of travel insurance quotes; all you have to do  is choose one that works for you.'.hardcoded),
    InsuranceOffer(title: 'Purchase and be covered'.hardcoded, description: 'Once you’ve chosen, you can purchase your  policy via our secure payment gateway and  you’ll be covered for your travels.'.hardcoded),
  ];
}
