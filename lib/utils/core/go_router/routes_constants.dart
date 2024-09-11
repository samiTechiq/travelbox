import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travelbox/utils/core/go_router/page_not_found.dart';

class Routes {
  static const onBoardingRoute = '/onBoarding_screen';
  static const homeRoute = '/home_screen';

  //Quote cover
  static const coverQuoteRoute = '/quote/insurance_type';
  static const basicInfo = '/quote/basic_information';
  static const pickerScreenRoute = '/quote/single_trip_dates';
  static const pickerAnnualScreenRoute = '/quote/annual_dates';
  static const attendingCustomerRoute = '/quote/whose_travelling';
  static const coverDetailsRoute = '/quote/just_one';
  static const bothCoverDetailsRoute = '/quote/first_or_two';
  static const familyCoverDetailsRoute = '/quote/first_of_family';
  static const groupCoverDetailsRoute = '/quote/first_of_group';
  static const secondCoverDetailsRoute = '/quote/rest_of_family';
  static const secondGroupCoverDetailsRoute = '/quote/rest_of_group';

  //Trip cover
  static const quoteDetailsRoute = '/quote/search_results';
  static const quoteMoreDetailRoute = '/quote/offer';
  static const quotePurchaseDetailRoute = '/quote/offer_purchase';
  static const quoteMorePurchaseDetailRoute = '/quote/confirm_offer';
  static const detailsPolicyConfirmRoute = '/quote/boring_stuff';
  static const paymentsRoute = '/quote/checkout';
  static const paymentsInformationRoute = '/quote/payment';
  static const referFriendRoute = '/refer_a_friend';
  static const downloadSuggestRoute = '/download_app';
  static const infoExpandDetailsRoute = '/information_expand_screen';
  static const detailsPolicyRoute = '/detail_policy_screen';


  //Profile and Account settings
  static const profileRoute = '/account';
  //TODO: Implement code for account_settings
  static const accountSettingsRoute = '/account/account_settings';
  static const personalDetailRoute = '/account/account_settings/personal_details';
  static const verifyOtpRoute = '/account/account_settings/verify_otp';
  static const securityRoute = '/account/account_settings/security';
  static const notificationsRoute = '/account/account_settings/notifications';
  static const preferencesRoute = '/account/account_settings/preferences';
  //TODO: Implement code when click reset password button in email
  static const newPasswordRoute = '/account/new_password';

  //Sign in and Forgot password
  static const loginRoute = '/account/sign_in';
  static const forgotPasswordRoute = '/account/forgot_password';
  static const checkYouEmailRoute = '/account/check_email';
  static const setNewPasswordRoute = '/account/set_new_password';

  //Create an account
  static const signUpRoute = '/account/create_account';
  static const verifyYourMailRoute = '/account/checkout_your_mail';
  //TODO: Implement code for verify success and failed
  static const verifyYourMailResultRoute = '/account/verification';

  //Extra Popup
  static const carHireExcessRoute = '/car_hire_excess';
  static const cruiseCoverRoute = '/cruise_cover';
  static const vacationRentalRoute = '/vacation_rental';
  static const personalLiabilityRoute = '/personal_liability';
  static const adventureExtremeRoute = '/adventure_extreme';
  static const winterSportsRoute = '/winter_sports';
  static const gadgetCoverRoute = '/gadget_cover';
  static const golfCoverRoute = '/golf_cover';
  static const cancelReasonRoute = '/cancelReason';
  static const petCareRoute = '/pet_care';
  static const rentalCareRoute = '/rental_care';

  static const rentalVehicleRoute = '/rental_vehicle_detail_screen';
  static const rentalVehicleDetailRoute = '/custom_picker';
  static const changeLanguageRoute = '/language';
  static const contactUsRoute = '/contact_us';
  static const drawerMenu = '/drawer_menu';

  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const PageNotFound();
}
