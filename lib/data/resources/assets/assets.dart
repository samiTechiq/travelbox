part of '../r.dart';

class Assets {
  final CustomIcons _icons;
  final Graphics _graphics;

  Assets._()
      : _icons = CustomIcons._(),
        _graphics = Graphics._();

  CustomIcons get icons => _icons;

  Graphics get graphics => _graphics;
}

class CustomIcons {
  CustomIcons._();
}

class Graphics {
  Graphics._();

  List<dynamic> getAll() => [
        drawer,
        headerEclipse,
        onBoardingMobile,
        backgroundImage,
        girlImage,
        addImage,
        minusImage,
        cross,
        clipborder,
        path,
        check,
        cards,
        paypal,
        apPay,
        master,
        amex,
        visa,
        mail,
        call,
        messenger,
        appstore,
        playstore,
        checked,
        onboarding,
        person,
        language,
        quote,
        signOut,
        notifications,
        personDetails,
        security,
        preferences,
        iconFail,
        iconSuccess,
        fail,
        success,
        person2,
        sort,
        filter,
        coverImage,
        checkedGreen,
        extra,
        line,
        blackMinus,
        bluePlus,
        edit,
        otp,
        bkgQuotePurchaseTop,
        bkgQuotePurchaseBot,
        bkgQuotePurchaseTopMb,
        bkgQuotePurchaseBotMb,
        bkgQuoteMorePurchaseTop,
        arrowForward,
        apply,
        notApply,
        calendar,
        boringStuff,
        email,
        termsPolicy,
        arrowUp,
        arrowDown,
        eyeOn,
        eyeOff,
        bgQuoteBottom,
        logo,
        imgContactUs,
        imgContactUs2,
      ];

  PngAssetGraphic get drawer => const PngAssetGraphic(name: 'drawer');

  PngAssetGraphic get appstore => const PngAssetGraphic(name: 'appstore');

  PngAssetGraphic get playstore => const PngAssetGraphic(name: 'playstore');

  PngAssetGraphic get call => const PngAssetGraphic(name: 'call');

  PngAssetGraphic get messenger => const PngAssetGraphic(name: 'messenger');

  PngAssetGraphic get amex => const PngAssetGraphic(name: 'amex');

  PngAssetGraphic get visa => const PngAssetGraphic(name: 'visa');

  PngAssetGraphic get path => const PngAssetGraphic(name: 'path');

  PngAssetGraphic get master => const PngAssetGraphic(name: 'symbol');

  PngAssetGraphic get mail => const PngAssetGraphic(name: 'mail');

  PngAssetGraphic get paypal => const PngAssetGraphic(name: 'paypal');

  PngAssetGraphic get apPay => const PngAssetGraphic(name: 'apPay');

  PngAssetGraphic get clipborder => const PngAssetGraphic(name: 'clipborder');

  PngAssetGraphic get cross => const PngAssetGraphic(name: 'cross');

  PngAssetGraphic get shield => const PngAssetGraphic(name: 'shield');

  PngAssetGraphic get check => const PngAssetGraphic(name: 'check');

  PngAssetGraphic get headerEclipse =>
      const PngAssetGraphic(name: 'headerEclipse');

  PngAssetGraphic get clipBorder => const PngAssetGraphic(name: 'clipborder');

  PngAssetGraphic get bkgQuotePurchaseTop =>
      const PngAssetGraphic(name: 'bkg_quote_purchase_top');

  PngAssetGraphic get bkgQuotePurchaseBot =>
      const PngAssetGraphic(name: 'bkg_quote_purchase_bot');

  PngAssetGraphic get bkgQuotePurchaseTopMb =>
      const PngAssetGraphic(name: 'bkg_quote_purchase_top_mb');

  PngAssetGraphic get bkgQuotePurchaseBotMb =>
      const PngAssetGraphic(name: 'bkg_quote_purchase_bot_mb');

  PngAssetGraphic get bkgQuoteMorePurchaseTop =>
      const PngAssetGraphic(name: 'bkg_quote_more_purchase_top');

  SvgAssetGraphic get onBoardingMobile =>
      const SvgAssetGraphic('homepage_mobile');

  SvgAssetGraphic get onBoardingDesktop =>
      const SvgAssetGraphic('homepage_desktop');

  SvgAssetGraphic get webIcon => const SvgAssetGraphic('web');

  PngAssetGraphic get cards => const PngAssetGraphic(name: 'cards');

  PngAssetGraphic get pathIconForward => const PngAssetGraphic(name: 'path');

  PngAssetGraphic get mailImage => const PngAssetGraphic(name: 'mail');

  PngAssetGraphic get checkIcon => const PngAssetGraphic(name: 'check');

  PngAssetGraphic get backgroundImage =>
      const PngAssetGraphic(name: 'background');

  PngAssetGraphic get girlImage => const PngAssetGraphic(name: 'girl');

  PngAssetGraphic get addImage => const PngAssetGraphic(name: 'add');

  PngAssetGraphic get minusImage => const PngAssetGraphic(name: 'minus');

  SvgAssetGraphic get crossIcon => const SvgAssetGraphic('cross');

  SvgAssetGraphic get checked => const SvgAssetGraphic('checked');

  SvgAssetGraphic get person => const SvgAssetGraphic('person');

  SvgAssetGraphic get language => const SvgAssetGraphic('language');

  SvgAssetGraphic get quote => const SvgAssetGraphic('quote');

  SvgAssetGraphic get signOut => const SvgAssetGraphic('sign_out');

  SvgAssetGraphic get personDetails => const SvgAssetGraphic('person_details');

  SvgAssetGraphic get preferences => const SvgAssetGraphic('preferences');

  SvgAssetGraphic get security => const SvgAssetGraphic('security');

  SvgAssetGraphic get notifications => const SvgAssetGraphic('notifications');

  PngAssetGraphic get onboarding => const PngAssetGraphic(name: 'onboarding_2');

  PngAssetGraphic get onboardingDesktop =>
      const PngAssetGraphic(name: 'onboarding_desktop_3');

  SvgAssetGraphic get iconFail => const SvgAssetGraphic('iconFail');

  SvgAssetGraphic get iconSuccess => const SvgAssetGraphic('iconSuccess');

  PngAssetGraphic get fail => const PngAssetGraphic(name: 'fail');

  PngAssetGraphic get success => const PngAssetGraphic(name: 'success');

  SvgAssetGraphic get person2 => const SvgAssetGraphic('person2');

  SvgAssetGraphic get sort => const SvgAssetGraphic('sort');

  SvgAssetGraphic get filter => const SvgAssetGraphic('filter');

  PngAssetGraphic get coverImage => const PngAssetGraphic(name: 'cover_image');

  SvgAssetGraphic get checkedGreen => const SvgAssetGraphic('checked_green');

  SvgAssetGraphic get extra => const SvgAssetGraphic('extra');

  SvgAssetGraphic get line => const SvgAssetGraphic('line');

  SvgAssetGraphic get blackMinus => const SvgAssetGraphic('blackMinus');

  SvgAssetGraphic get bluePlus => const SvgAssetGraphic('bluePlus');

  SvgAssetGraphic get edit => const SvgAssetGraphic('edit');

  SvgAssetGraphic get otp => const SvgAssetGraphic('otp');

  SvgAssetGraphic get arrowForward => const SvgAssetGraphic('arrow_forward');

  SvgAssetGraphic get apply => const SvgAssetGraphic('apply');

  SvgAssetGraphic get notApply => const SvgAssetGraphic('not_apply');

  SvgAssetGraphic get calendar => const SvgAssetGraphic('calendar');

  PngAssetGraphic get boringStuff => const PngAssetGraphic(name: 'boringStuff');

  SvgAssetGraphic get email => const SvgAssetGraphic('email');

  SvgAssetGraphic get termsPolicy => const SvgAssetGraphic('terms_policy');

  SvgAssetGraphic get arrowUp => const SvgAssetGraphic('arrow_up');

  SvgAssetGraphic get arrowDown => const SvgAssetGraphic('arrow_down');

  SvgAssetGraphic get eyeOn => const SvgAssetGraphic('ic_eye_on');

  SvgAssetGraphic get eyeOff => const SvgAssetGraphic('ic_eye_off');

  PngAssetGraphic get imgSuccess => const PngAssetGraphic(name: 'imgSuccess');

  PngAssetGraphic get imgFailed => const PngAssetGraphic(name: 'imgFailed');

  PngAssetGraphic get bgQuoteBottom =>
      const PngAssetGraphic(name: 'bg_quote_bottom');

  PngAssetGraphic get logo => const PngAssetGraphic(name: 'logo');

  PngAssetGraphic get airPlane => const PngAssetGraphic(name: 'air_plane');

  PngAssetGraphic get appOnIphone =>
      const PngAssetGraphic(name: 'app_on_iphone');

  SvgAssetGraphic get multipleCoverExtension =>
      const SvgAssetGraphic('multiple_cover_extension');

  SvgAssetGraphic get protection => const SvgAssetGraphic('protection');

  SvgAssetGraphic get manageInsurance =>
      const SvgAssetGraphic('manage_insurance');

  SvgAssetGraphic get icExtra => const SvgAssetGraphic('ic_extra');

  SvgAssetGraphic get icCheck => const SvgAssetGraphic('ic_check');

  SvgAssetGraphic get coveredHealth => const SvgAssetGraphic('covered_heart');

  SvgAssetGraphic get coveredTrip => const SvgAssetGraphic('covered_trip');

  SvgAssetGraphic get coveredStuff => const SvgAssetGraphic('covered_stuff');

  SvgAssetGraphic get coveredExtra => const SvgAssetGraphic('covered_extra');

  SvgAssetGraphic get icPlus => const SvgAssetGraphic('ic_plus');

  SvgAssetGraphic get icMinus => const SvgAssetGraphic('ic_minus');

  SvgAssetGraphic get icDrawer => const SvgAssetGraphic('ic_drawer');

  PngAssetGraphic get imgContactUs =>
      const PngAssetGraphic(name: 'image_contact_us');

  PngAssetGraphic get imgContactUs2 =>
      const PngAssetGraphic(name: 'image_contact_us_2');

  PngAssetGraphic get travelShield =>
      const PngAssetGraphic(name: 'travel_shield');

  PngAssetGraphic get travelSuitcase =>
      const PngAssetGraphic(name: 'travel_suitcase');

  PngAssetGraphic get travelHat =>
      const PngAssetGraphic(name: 'travel_hat');
}
