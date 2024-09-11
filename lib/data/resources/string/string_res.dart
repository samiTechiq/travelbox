part of '../r.dart';

class StringRes {
  late final onBoardingScreen = _StringOnBoardingScreen();
  late final coverQuoteScreen = _StringCoverQuoteScreen();
  late final registerScreen = _StringLoginScreenScreen();
  late final coverPickerScreen = _StringCoverPickerScreen();
  late final attendingCustomerScreen = _StringAttendingCustomerScreen();
  late final coverDetailScreen = _StringCoverDetailsScreen();
  late final bothCoverDetailScreen = _StringBothCoverDetailsScreen();
  late final familyCoverDetailScreen = _StringFamilyCoverDetailsScreen();
  late final quoteDetailScreen = _StringQuoteDetailScreen();
  late final downloadSuggestedScreen = _StringDownloadSuggestedScreen();
  late final referFriendScreen = _StringReferFriendScreen();
  late final paymentInformation = _StringPaymentInformationScreen();
  late final paymentScreen = _StringPaymentScreen();
  late final policyConfirmScreen = _StringPolicyConfirmScreen();
  late final policyDetailScreen = _StringPolicyDetailScreen();
  late final informationExpandScreen = _StringInformationExpandScreen();
  late final rangePickerScreen = _StringRangePickerScreen();
  late final localeHelper = _StringLocaleHelper();
  late final rentalVehicle = _StringRentalVehicle();
  late final noPageScreen = _StringNoPageFound();
  late final errorString = _ErrorString();
  late final loginScreen = _StringLoginScreen();
}

class _StringOnBoardingScreen {
  String get travelInsurancePurchase => 'Travel Insurance Purchase Journey';

  String get findAllYourNeedsFaster =>
      'Combining InsurTech and TravTech to deliver amazing customer experiences across the travel insurance ecosytem.';

  String get checkPricing => 'Check pricing';
}

class _StringRangePickerScreen {
  String get heading => 'Rental vehicle excess\ncover';

  String get cancel => 'Cancel';

  String get selectDate => "Select Date";

  String get buttonText => "Add to plan for HK\$";

  String get vehiclePolicy =>
      "When you rent a motor vehicle overseas, the total rental price usually includes a Collision Damage Waiver (CDW) element. This means that if the vehicle is accidentally damaged by you or a third party, you will not be liable to pay the full cost of the repair. However, you will often be liable for a portion of the repair cost – this is usually called the ‘Collision Damage Waiver Excess’. ‘Rental Vehicle Excess’ coverage. In the event of loss of or damage to the vehicle, you will be reimbursed the excess amount payable to the rental company up to HK\$5,000.";
}

class _StringCoverQuoteScreen {
  String get greeting => 'Hi, I’m Amber.';

  String get howCanIHelp => 'What type of cover would you like a quote for?';

  String get annualCover => 'Annual cover';

  String get recommended => 'Recommended if you travel 2+ times per year.';

  String get destinationHeading => 'Destinations to cover?';

  String get destinationAnnualSelect => 'Select the destinations to cover.';

  String get destinationSingleSelect =>
      'Traveling to multiple countries? Plug them in!';

  String get destinationSelectHeading => "Select destination";

  String get singleCover => 'Single trip cover';

  String get daysDescription =>
      'If you’re only going away for less then 90 days.';

  String get destinationGoingHeading => 'Where are you going?';

  String get multipleCountriesDescription =>
      'Traveling to multiple countries?Plug them in!';

  String get enterCountries => 'Enter Countries';

  String get buttonText => 'Get your quote';

  String get friendRefer => 'Have a friend’s referral code?';

  String get listCruiseItem => 'Cruise Cover';

  String get listTravelItem => 'Travel Disruption option';

  String get listVacationRentItem => 'Vacation rental protection';

  String get listLiabilityOptionItem => "Personal liability option";

  String get listAdventureItem => "Adventure and extreme sports";

  String get listWinterSportsItem => "Winter sports";

  String get listGadgetCoverItem => "Gadget cover";

  String get listGolfCoverItem => "Golf cover";

  String get listSingleCoverItem => "Single item cover";

  String get listExcessCoverItem => "Excess waver";

  String get listCarExcessItem => "Car hire Excess waiver";

  String get additionalCover =>
      "Do you also want additional cover included in the quote:";

  String get eclipseDate => "from\n\$1180";

  String get asiaOption => "Asia";

  String get selectOption => "Select";

  String get worldWideOption => "Worldwide";

  String get includedCountries => "Included countries";

  String get excludedCountries => "Excluded countries";

  String get includedAsiaCoverCountries => "Included Asia countries covered";

  String get excludedWorldWideCoverCountries =>
      "Excluded worldwide countries covered";

  String get iLiveIn => "I live in ";

  String get change => " Change";
}

class _StringLoginScreenScreen {
  String get alreadyAccount => 'Already have an account?';

  String get alreadyAccountMobile => 'Already have an account?\n';

  String get signIn => "Sign-in";

  String get createAccount => 'Create an account.';

  String get fastCheap => ' It’s faster and could be cheaper for you.';

  String get fastCheapMobile => '\nIt’s faster and could be cheaper for you.';

  String get buttonText => 'Next';

  String get dropDownMr => 'Mr';

  String get dropDownMis => 'Miss';

  String get dropDownMs => 'Ms';

  String get dropDownMrs => 'Mrs';

  String get dropDownDr => 'Doctor';

  String get dropDownMaster => 'Master';

  String get basicInformation => "Basic Information";

  String get title => "Title*";

  String get firstName => "First name*";

  String get firstNameHint => "Enter first name";

  String get surName => "Last name*";

  String get surNameHint => "Enter last name";

  String get email => "Email*";

  String get emailHint => "Enter email";

  String get mobile => "Mobile*";

  String get mobileHint => 'Enter number';

  String get countryResidence => "Country of residence**";

  String get countryResidenceField => "Hong Kong SAR";

  String get emailAddressPolicy =>
      "Your entered email address is where we will send you an email with your quote and policy information. From time to time we'd like to contact you regarding other products and services. If you would like to opt out of specific channels, tick here.";
}

class _StringCoverPickerScreen {
  String get coverPicDesc => 'When would you like cover to start and end?';

  String get singleTripPolicy => 'Single trip policy';

  String get annualTripPolicy => 'Annual trip policy';

  String get yourTripDetails => 'Your trip details';

  String get protectYourTripFor => 'Protect your trip for';

  String get buttonText => 'Next';

  String get selectDate => 'Select Date';

  String get from => 'from';

  String get fromCap => 'From';

  String get fieldHint => "DD/MM/YYYY";

  String get until => "Until";
}

class _StringAttendingCustomerScreen {
  String get listAttendOne => 'Just the one';

  String get listAttendTwo => 'We’re two';

  String get listAttendFamily => 'We’re a family';

  String get listAttendGroup => 'We’re a group';

  String get whoTravel => 'Whose going to need cover on this trip?';

  String get buttonText => "Next";

  String get cardHeading => "Whose travelling?";
}

//second and first traveler both
class _StringCoverDetailsScreen {
  String get leadHeading => 'Hi Chris, Let’s get you covered.';

  String get leadHeadingSecondTraveler =>
      "Hi Chris, let’s get you both covered.";

  String get cardLeadHeading => "We need some details from you.";

  String get cardLeadHeadingSecondTraveler => "Second traveller";

  String get agreeTerms => 'I agree to the ';

  String get buttonText => "Next";

  String get firstName => "First name*";

  String get remove => "Remove";

  String get firstNameHint => "Enter first name";

  String get surName => "Last name*";

  String get email => "Email*";

  String get nonMenEmail => "Email";

  String get emailHint => "Enter email";

  String get surNameHint => "Enter last name";

  String get dob => "Date of Birth*";

  String get nonMenDob => "Date of Birth";

  String get dobHint => "DD/MM/YYYY";
}

class _StringBothCoverDetailsScreen {
  String get leadHeading => 'Hi Chris, let’s get you both covered.';

  String get cardLeadHeading => "Lets get your details first!";

  String get cardLeadHeadingSecondTraveler => "Second traveller";

  String get agreeTerms => 'I agree to the ';

  String get buttonText => "Next";

  String get firstName => "First name*";

  String get firstNameHint => "Enter first name";

  String get surName => "Last name*";

  String get email => "Email";

  String get emailHint => "Enter email";

  String get surNameHint => "Enter last name";

  String get dob => "Date of birth*";

  String get dobHint => "DD/MM/YYYY";
}

class _StringFamilyCoverDetailsScreen {
  String get leadHeadingFamily =>
      'Hi Chris, let’s get you and your family covered.';

  String get leadHeadingGroup =>
      'Hi Chris, let’s get you and your group covered.';

  String get addtraveler => 'Add traveler';

  String get secondTraveler => "Second Traveler";

  String get thirdTraveler => "Third Traveler";

  String get forthTraveler => "Forth Traveler";

  String get fifthTraveler => "Fifth Traveler";

  String get sixthTraveler => "Sixth Traveler";

  String get seventhTraveler => "Seventh Traveler";

  String get eigthTraveler => "Eight Traveler";

  String get ninthTraveler => "Ninth Traveler";

  String get tenthTraveler => "Tenth Traveler";

  String get elevenTraveler => "Eleven Traveler";

  String get twelveTraveler => "Twelve Traveler";

  String get traveler => "Traveler";
}

class _StringQuoteDetailScreen {
  String get quoteDetailRowHeading1 => 'Your health';

  String get quoteDetailRowHeading2 => 'Your trip';

  String get quoteDetailRowHeading3 => 'Your stuff';

  String get hereYourQuote => 'Here’s your quote';

  String get singleTripPolicy => "Single trip policy";

  String get expansionCardBasic => "Basic Cover";

  String get expansionCardComprehensiveCover => "What’s covered?";

  String get expansionCardComprehensive => "Comprehensive Cover";

  String get expansionCardBasicSubheading => "HK\$200.00";

  String get expansionCardComprehensiveSubheading => "HK\$200.00";

  String get expansionCardDestination => "HK\$200.00";

  String get buttonText => "Get covered for HK\$260";

  String get rowExpandDetail1 => "Emergency Accident";

  String get rowExpandDetail2 => "Emergency medical expenses ";

  String get rowExpandDetail3 => "Trip interruption";

  String get cruiseCover => "Cruise Cover";

  String get cruiseCoverSubtext =>
      "Go on a cruise during the period of insurance?";

  String get cruiseCoverAmountText => "HK\$26.50";

  String get moreInfoLink => "More information";

  String get removeButton => "Remove";

  String get addButton => "Add";

  String get rentalVehicle => "Rental vehicle excess cover";

  String get rentalVehicleSubtext =>
      "In the event of loss of or damage to the vehicle..";

  String get rentalVehicleAmountText => "HK\$26.50/day";

  String get rentalVehicleSelectDatesText => "Select dates";

  String get vacationRental => "Vacation rental protection";

  String get vacationRentalSubtext =>
      "Be reimbursed up to HK\$[Insert amount] in repair/replacement";

  String get vacationRentalAmountText => "HK\$100.00";

  String get seeMore => "see more";

  String get adventureExtreme => "Adventure and extreme";

  String get adventureExtremeSubText =>
      "Coverage for medical-related expenses if you...";

  String get adventureExtremeAmountText => "HK\$26.50";

  String get winterSports => "Adventure and extreme";

  String get winterSportsSubText =>
      "Coverage for medical-related expenses if you...";

  String get winterSportsAmountText => "HK\$16.50";

  String get personalLiability => "Personal liability protection";

  String get personalLiabilitySubText =>
      "This cover is available for an unlimited number of gadgets to provide cover for:";

  String get personalLiabilityAmountText => "HK\$100.00";

  String get recommended => "Recommended";

  String get select => "Select";

  String get whatsCovered => "What's covered?";

  String get whatCanYouAddOn => "What can you add on?";

  String get amount => "HK\$5000";

  String get seeAll => "See all";

  String get the => "The ";

  String get policyWording => "policy wording";

  String get quoteDetailPolicy =>
      " is available for you to read here. If you want to learn how Lyla decided which bundles to include alongside the Base Plan as well as the add-ons you can select, you can read about it in our FAQ.";
}

class _StringDownloadSuggestedScreen {
  String get travelInsurancePurchase => 'Travel Insurance Purchase Journey';

  String get findAllYourNeedsFaster => 'Find all your needs faster than ever';

  String get letsStarts => 'Let’s Start';

  String get policyAnytime =>
      'Access your policy anytime, no internet access required.';

  String get submitClaim =>
      'Submit a claim in no time at all and track its progress.';

  String get humanSupport =>
      'Use our Flight delay cover that automatically pays out on any flight delays that affect you';

  String get downloadApp => 'Time to download our mobile app';

  String get referFriend => 'Refer a friend and get paid';

  String get referLink => 'Your referral discount link';

  String get done => 'Done';

  String get usShare => "Give us a share:";

  String get referFriendDesc =>
      '"For every friend you refer you get £10 refunded back instantly. And they get \$30 off their policy. Go crazy. Refer as many friends as you like until your policy is free.';
}

class _StringReferFriendScreen {
  String get referFiend => 'Refer a friend, get paid';

  String get everyFiend =>
      "For every friend you refer you get \$50 refunded back instantly. And they get \$50 off their policy. Go crazy. Refer as many friends as you like until your policy is free.";

  String get linkBelow =>
      'Share the link below and they can buy their policy in no time at all.';

  String get howItWorks => "Here's how it works:";

  String get referFriend => 'You share your link with a friend';

  String get referFriend2 => "A friend buys a policy using the link";

  String get getsDiscount =>
      "Your friend gets a \$30 discount off their policy ";

  String get instantlyRefunded =>
      "You instantly get \$30 refunded off your policy";

  String get referralAbout =>
      "Read more about the referral\ndiscounts with Lyla";

  String get referralAboutDesktop =>
      "Read more about the referral discounts with Lyla";

  String get discountLink => "Referral discount link";

  String get next => "Next";

  String get referFriendDesc =>
      '"For every friend you refer you get £10 refunded back instantly. And they get \$30 off their policy. Go crazy. Refer as many friends as you like until your policy is free.';
}

class _StringPaymentInformationScreen {
  String get paymentInformation => "Payment Information";

  String get selectCard => "Select your card";

  String get name => 'Name';

  String get nameHint => 'John Doe';

  String get cardNumber => "Card Number";

  String get cardNumberHint => "1234 5678 2468 1357";

  String get cvv => "CVV";

  String get cvvHint => "1234";

  String get expDate => "Expiration Date";

  String get expDateHint => "08/2023";

  String get creditCardInfo => "Save credit card information";

  String get payNow => "Pay now";
}

class _StringPaymentScreen {
  String get startPayment => "Let's start payment";

  String get likePLay => "How would you like to pay?";

  String get securePayment => "Secure payments";

  String get continueWith => "Continue with";

  String get payWith => "Pay with";

  String get emailQuote => "Not ready to buy? Click ";

  String get toEmailYourQuote => "email your quote";

  String get here => "here";

  String get to => " to ";
}

class _StringPolicyConfirmScreen {
  String get policyDetail1 =>
      "You are a HK resident. What we mean by “HK residentt";

  String get policyDetail2 =>
      "You haven’t already started a trip you’d like cover for.";

  String get boringStaff =>
      "Some boring, (but important), stuff before you checkout.";

  String get policyConfirm => "Please confirm the following is true:";

  String get confirmStatement => "I confirm the above is true";

  String get excitingDocument => "Exciting documents to acknowledge:";

  String get termConditions => "Read Terms & Conditions";

  String get privacyPolicy => "Read Privacy Policy";

  String get acceptPolicy => "I accept the T&Cs and Privacy Policy";

  String get proceedPayment => "Proceed to payment";

  String get policyDetail3 =>
      "You haven’t made more than 2 travel insurance claims in the past 3 years or had insurance refused, cancelled or had special terms imposed.";
}

class _StringPolicyDetailScreen {
  String get medicalExpenses => "Medical expenses";

  String get personalAccident => "Personal accident";

  String get worldAssistance => "24 worldwide assistance";

  String get available => "Available";

  String get skip => "Skip";

  String get yourQuote => "Your quote";

  String get aboutYourPolicy => "Details about your policy";

  String get coverForYou => "Cover for you";

  String get healthCover => "See all health coverage";

  String get tripCover => "Your trip cover";

  String get cancellation =>
      "See all trip cancellation,\ninterruption, or delay";

  String get stuffCover => "Your stuff cover";

  String get belongingCover => "See all personal belongings coverage";

  String get extraBits => "Extras and other bits";

  String get personalCoverage => "Personal and trip coverage details";

  String get name => "Name:";

  String get secondTravelerName => "2 Traveler Name:";

  String get policy => "Policy:";

  String get plan => "Plan:";

  String get destination => "Destination:";

  String get policyStartDate => "Policy start date:";

  String get policyEndDate => "Policy end date:";

  String get policyActivated =>
      "We will email you your policy wording when your policy is activated.";

  String get singleTripCover => "Single Trip Cover";

  String get annualTripCover => "Annual Trip Cover";

  String get insurancePremium =>
      "Your price includes the HK Insurance Premium Levy";

  String get the => "The";

  String get policyWording => " policy wording";

  String get purchaseCover => "Purchase cover for HK\$260";

  String get clickHere => "Not ready to buy? Click here to email your quote";

  String get isAvailableToYou => " is available for you to ";

  String get readHere => "read here";

  String get ifYouWantToLearn =>
      ". If you want to learn how Lyla decided which bundles to include alongside the Base Plan as well as the add-ons you can select, you can read about it in our FAQ ";
}

class _StringInformationExpandScreen {
  String get kh260 => 'Get covered for HK\$260';

  String get hk100 => 'Add to plan for HK\$100.00';

  String get hk26 => 'Add to plan for HK\$26.50';

  String get wouldAddGadget => "Would you like to add gadget cover?";

  String get gadgetAnswer =>
      "Yes, I’d like to cover HK\$10,000 worth of gadgets (HKD\$150.00)";

  String get damage => "Accidental or malicious damage";

  String get unlimitedNumber =>
      "This cover is available for an unlimited number of gadgets to provide cover for:";

  String get closure1500 => "Cover for course closure up to £1500";

  String get perPerson => "Benefits of this cover are per person and include:";

  String get lawCost =>
      "all law costs awarded to any claimant or incurred in the defence of any claim that is contested by us or with our consent.";

  String get personalLiabilities =>
      "This option provides up to HK\$5,000,000 protection against any incident for which you become legally liable for during your journey, to cover:";

  String get skiResorts => "Skiing and snowboarding in ski resorts";

  String get winterSports =>
      "Coverage for medical expenses if you become injured while participating in winter sports as defined in the plan on the same basis as all other injuries.";

  String get jumpingCliff => "B.A.S.E. jumping, Cliff diving";

  String get adventureSportsProtection =>
      "Coverage for medical expenses if you become injured while participating in adventure or extreme sports as defined  in the plan on the same basis as all other injuries.";

  String get rentalVacation =>
      "Be reimbursed up to HK\$[Insert amount] in repair/replacement costs if you accidentally damage the rental you're staying in, or its contents, while in-trip.";

  String get cruiseScreen =>
      "Cruises are defined as trips on ocean or river cruise-ships / boats. No cover is provided for cruise holidays unless you have declared this to us by adding to your coverage and ensured that 'Cruise: Included' is shown on your Validation Certificate. A ferry crossing does not constitute a cruise";
}

class _StringLocaleHelper {
  String get dateFormat => 'MMMM yyyy';

  String get pickerDateFormat => 'yyyy/MM/dd';

  String get reversePickerDateFormat => 'dd/MM/yy';

  String get reversePickerDateFormatYYYY => 'dd/MM/yyyy';

  String get pickerDateFormatWithSlashes => 'yyyy-MM-dd';

  String get pickerDateFormatter => 'MM-dd-yyyy';

  String get dateMonthFormatter => 'dd MMM';

  String get dateMonthYearFormatter => 'dd MMM, yyyy';

  String get pickerDateFormatDMY => 'dd/MM/yyyy';
}

class _StringRentalVehicle {
  String get rentalVehicleExcessCover => 'Rental vehicle excess cover';

  String get buttonText => 'Add to plan for HK\$200';
}

class _StringNoPageFound {
  String get noPageFound => 'No Page Found';
}

class _ErrorString {
  String get somethingWentWrong => 'Something went wrong';

  String get noInternet => 'No Internet connection';

  String get pleaseEnterValidEntry => "Please enter valid entry";

  String get pleaseFillFormCorrectly => "Please fill correct card number";

  String get pleaseEnterValidMobileNumber => "Please enter valid mobile number";

  String get pleaseEnterAMobileNumber => "Please enter a mobile number";

  String get noMoreThen90Days => "No more then 90 days";
}

class _StringLoginScreen {
  String get signInOrCreateAccount => 'Sign in or create an account';
}
