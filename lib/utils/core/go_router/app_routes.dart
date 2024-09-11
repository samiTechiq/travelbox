import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travelbox/features/account_settings/account_settings.dart';
import 'package:travelbox/features/change_language/view/desktop/change_language_desktop.dart';
import 'package:travelbox/features/check_email/check_mail.dart';
import 'package:travelbox/features/contact_us/contact_us_screen.dart';
import 'package:travelbox/features/cover_quote/view/cover_quote.dart';
import 'package:travelbox/features/detail_policy/detail_policy_screen.dart';
import 'package:travelbox/features/downloadApp_suggestion/download_suggestion_screen.dart';
import 'package:travelbox/features/forgot_password/forgot_password.dart';
import 'package:travelbox/features/home/home_screen.dart';
import 'package:travelbox/features/login/login_screen.dart';
import 'package:travelbox/features/notifications/notifications.dart';
import 'package:travelbox/features/onboarding/view/onboarding.dart';
import 'package:travelbox/features/onboarding/widgets/drawer_menu.dart';
import 'package:travelbox/features/otp/otp_screen.dart';
import 'package:travelbox/features/personal_detail/personal_detail_screen.dart';
import 'package:travelbox/features/preferences/preferences.dart';
import 'package:travelbox/features/profile/profile.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/questions/views/attending_customer/attending_customer.dart';
import 'package:travelbox/features/questions/views/basic_info/basic_info_screen.dart';
import 'package:travelbox/features/questions/views/both_cover_detail/both_cover_detail.dart';
import 'package:travelbox/features/questions/views/cover_details/cover_details.dart';
import 'package:travelbox/features/questions/views/second_traveler_detail/second_traveler_cover_detail.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/start_end_picker_screen.dart';
import 'package:travelbox/features/quote_details/quote_detail.dart';
import 'package:travelbox/features/quote_more_detail/quote_more_detail_screen.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/adventure_extreme_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/cancel_reason_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/car_hire_excess_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/cruise_cover_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/gadget_cover_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/golf_cover_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/personal_liability_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/pet_care_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/rental_car_care.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/vacation_rental_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/winter_sport_popup.dart';
import 'package:travelbox/features/quote_more_purchase_detail/quote_more_purchase_detail.dart';
import 'package:travelbox/features/quote_purchase_details/quote_purchase_details.dart';
import 'package:travelbox/features/security/security.dart';
import 'package:travelbox/features/set_new_password/set_new_password_screen.dart';
import 'package:travelbox/features/signup/sign_up_screen.dart';
import 'package:travelbox/features/verify_your_mail/verify_your_mail_result_screen.dart';
import 'package:travelbox/features/verify_your_mail/verify_your_mail_screen.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';

import '../../../features/Information_Expand/information_expand_screen.dart';
import '../../../features/Information_Expand/rental_vehicle_detail_screen.dart';
import '../../../features/payment/payment_information_screen.dart';
import '../../../features/payment/payment_screen.dart';
import '../../../features/policy_confirm/policy_confirm_screen.dart';
import '../../../features/questions/views/family_group_cover_details/family_group_cover_details.dart';
import '../../../features/refer_friend/refer_firend_screen.dart';
import '../../../features/time_range_picker/custom_picker.dart';
import 'args_model/custom_data_picker_range_model.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static Widget _homeRouteBuilder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  static Widget _onBoardingRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const OnBoarding();

  static Widget _downloadSuggestRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const DownLoadSuggestScreen();

  static Widget _coverQuoteRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const CoverQuote();

  static Widget _paymentInformationRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const PaymentInformationScreen();

  static Widget _basicInfoRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const BasicInfoScreen();

  static Widget _rentalVehicleRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const RentalVehicle();

  static Widget _attendingCustomerBuilder(
          BuildContext context, GoRouterState state) =>
      const AttendingCustomer();

  static Widget _coverDetailBuilder(BuildContext context, GoRouterState state) {
    return const CoveredDetails();
  }

  static Widget _policyConfirmBuilder(
      BuildContext context, GoRouterState state) {
    return const PolicyConfirm();
  }

  static Widget _bothCoverDetailBuilder(
          BuildContext context, GoRouterState state) =>
      const BothCoveredDetails();

  static Widget _familyCoverDetailBuilder(
      BuildContext context, GoRouterState state) {
    return const FamilyGroupCoveredDetails();
  }

  static Widget _groupCoverDetailBuilder(
      BuildContext context, GoRouterState state) {
    return const FamilyGroupCoveredDetails();
  }

  static Widget _pickerBuilder(BuildContext context, GoRouterState state) =>
      const PickerScreen();

  static Widget _pickerAnnualBuilder(
          BuildContext context, GoRouterState state) =>
      const PickerScreen();

  static Widget _secondCoverBuilder(
          BuildContext context, GoRouterState state) =>
      const SecondCoveredDetailed();

  static Widget _secondGroupCoverBuilder(
          BuildContext context, GoRouterState state) =>
      const SecondCoveredDetailed();

  static Widget _quoteCoverBuilder(BuildContext context, GoRouterState state) {
    return const QuoteDetails();
  }

  static Widget _detailPolicyBuilder(
      BuildContext context, GoRouterState state) {
    return const DetailPolicyScreen();
  }

  static Widget _referFriendBuilder(
          BuildContext context, GoRouterState state) =>
      const ReferFriend();

  static Widget _paymentBuilder(BuildContext context, GoRouterState state) {
    final order = state.extra as String?;
    return Payment(
      orderId: order ?? '',
    );
  }

  static Widget _forgotPasswordRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const ForgotPasswordScreen();

  static Widget _checkMailRouteBuilder(
      BuildContext context, GoRouterState state) {
    final email = state.extra as String?;

    return CheckMailScreen(email: email ?? '');
  }

  static Widget _profileRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const ProfileScreen();

  static Widget _accountSettingsRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const AccountSettingsScreen();

  static Widget _rentalVehicleDetailRoute(
      BuildContext context, GoRouterState state) {
    CustomDateRangePickerArgs args = state.extra as CustomDateRangePickerArgs;
    return CustomDateRangePicker(
      backgroundColor: args.backgroundColor,
      maximumDate: args.maximumDate,
      minimumDate: args.minimumDate,
      onApplyClick: args.onApplyClick,
      onCancelClick: args.onCancelClick,
      primaryColor: args.primaryColor,
      initialEndDate: args.initialEndDate,
      initialStartDate: args.initialStartDate,
    );
  }

  static Widget _infoDetailsBuilder(BuildContext context, GoRouterState state) {
    Map<String, dynamic> args = state.extra as Map<String, dynamic>;
    return InfoExpand(
      page: args['page'],
      isCruiseScreen: true,
      isRentalProtectionScreen: false,
      isAdventureAndSportsScreen: false,
      isGadgetCover: false,
      isGolfCoverScreen: false,
      isPersonalLiabilityScreen: false,
      isWinterSportsProtection: false,
    );
  }

  static Widget _loginBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const LoginScreen();

  static Widget _signUpBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SignUpScreen();

  static Widget _setNewPasswordBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SetNewPasswordScreen();

  static Widget _newPasswordBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SetNewPasswordScreen();

  static Widget _verifyYourMailBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const VerifyYourMailScreen();

  static Widget _verifyYourMailResultBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const VerifyYourMailResultScreen();

  static Widget _verifyOtpBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    final phoneNumber = state.extra as String?;
    return OtpScreen(phoneNumber: phoneNumber ?? '');
  }

  static Widget _quoteMoreDetailBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    final quote = state.extra as Quote?;
    return QuoteMoreDetailScreen(
      quote: quote ?? Quote(),
    );
  }

  static Widget _quotePurchaseDetailBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const QuotePurchaseDetailsScreen();
  }

  static Widget _quoteMorePurchaseDetailBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const QuoteMorePurchaseDetailsScreen();
  }

  static Widget _personalDetailBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const PersonalDetailScreen();
  }

  static Widget _securityBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const SecurityScreen();
  }

  static Widget _preferencesBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const PreferencesScreen();
  }

  static Widget _notificationsBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const NotificationsScreen();
  }

  static Widget _carHireExcessBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const CarHireExcessPopup();
  }

  static Widget _cruiseCoverBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const CruiseCoverPopup();
  }

  static Widget _vacationRentalBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const VacationRentalPopup();
  }

  static Widget _personalLiabilityBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const PersonalLiabilityPopup();
  }

  static Widget _adventureExtremeBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const AdventureExtremePopup();
  }

  static Widget _winterSportsBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const WinterSportPopup();
  }

  static Widget _gadgetCoverBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const GadgetCoverPopup();
  }

  static Widget _golfCoverBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const GolfCoverPopup();
  }

  static Widget _cancelReasonBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const CancelReasonPopup();
  }

  static Widget _petCareBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const PetCarePopup();
  }

  static Widget _rentalCareBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const RentalCarCare();
  }

  static Widget _changeLanguageBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return const ChangeLanguageDesktop();
  }

  static Widget _contactUsBuilder(
      BuildContext context,
      GoRouterState state,
      ) {
    return const ContactUsScreen();
  }

  static Widget _drawerMenuBuilder(
      BuildContext context,
      GoRouterState state,
      ) {
    return const DrawerMenu();
  }

  static final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.onBoardingRoute,
    observers: [NavigationObserver()],
    routes: [
      GoRoute(path: Routes.onBoardingRoute, builder: _onBoardingRouteBuilder),
      GoRoute(path: Routes.homeRoute, builder: _homeRouteBuilder),
      GoRoute(path: Routes.coverQuoteRoute, builder: _coverQuoteRouteBuilder),
      GoRoute(path: Routes.basicInfo, builder: _basicInfoRouteBuilder),
      GoRoute(
          path: Routes.attendingCustomerRoute,
          builder: _attendingCustomerBuilder),
      GoRoute(path: Routes.coverDetailsRoute, builder: _coverDetailBuilder),
      GoRoute(
          path: Routes.bothCoverDetailsRoute, builder: _bothCoverDetailBuilder),
      GoRoute(
          path: Routes.familyCoverDetailsRoute,
          builder: _familyCoverDetailBuilder),
      GoRoute(
          path: Routes.groupCoverDetailsRoute,
          builder: _groupCoverDetailBuilder),
      GoRoute(
          path: Routes.detailsPolicyConfirmRoute,
          builder: _policyConfirmBuilder),
      GoRoute(path: Routes.pickerScreenRoute, builder: _pickerBuilder),
      GoRoute(
          path: Routes.pickerAnnualScreenRoute, builder: _pickerAnnualBuilder),
      GoRoute(
          path: Routes.secondCoverDetailsRoute, builder: _secondCoverBuilder),
      GoRoute(
          path: Routes.secondGroupCoverDetailsRoute,
          builder: _secondGroupCoverBuilder),
      GoRoute(
          path: Routes.rentalVehicleRoute, builder: _rentalVehicleRouteBuilder),
      GoRoute(
          path: Routes.rentalVehicleDetailRoute,
          builder: _rentalVehicleDetailRoute),
      GoRoute(
        path: Routes.quoteDetailsRoute,
        builder: _quoteCoverBuilder,
      ),
      GoRoute(
          path: Routes.infoExpandDetailsRoute, builder: _infoDetailsBuilder),
      GoRoute(path: Routes.detailsPolicyRoute, builder: _detailPolicyBuilder),
      GoRoute(path: Routes.paymentsRoute, builder: _paymentBuilder),
      GoRoute(
          path: Routes.paymentsInformationRoute,
          builder: _paymentInformationRouteBuilder),
      GoRoute(path: Routes.referFriendRoute, builder: _referFriendBuilder),
      GoRoute(
          path: Routes.downloadSuggestRoute,
          builder: _downloadSuggestRouteBuilder),
      GoRoute(path: Routes.loginRoute, builder: _loginBuilder),
      GoRoute(
          path: Routes.forgotPasswordRoute,
          builder: _forgotPasswordRouteBuilder),
      GoRoute(path: Routes.checkYouEmailRoute, builder: _checkMailRouteBuilder),
      GoRoute(path: Routes.profileRoute, builder: _profileRouteBuilder),
      GoRoute(
          path: Routes.accountSettingsRoute,
          builder: _accountSettingsRouteBuilder),
      GoRoute(path: Routes.signUpRoute, builder: _signUpBuilder),
      GoRoute(
          path: Routes.setNewPasswordRoute, builder: _setNewPasswordBuilder),
      GoRoute(path: Routes.newPasswordRoute, builder: _newPasswordBuilder),
      GoRoute(
          path: Routes.verifyYourMailRoute, builder: _verifyYourMailBuilder),
      GoRoute(
          path: Routes.verifyYourMailResultRoute,
          builder: _verifyYourMailResultBuilder),
      GoRoute(
          path: Routes.quoteMoreDetailRoute, builder: _quoteMoreDetailBuilder),
      GoRoute(path: Routes.verifyOtpRoute, builder: _verifyOtpBuilder),
      GoRoute(
          path: Routes.quotePurchaseDetailRoute,
          builder: _quotePurchaseDetailBuilder),
      GoRoute(
          path: Routes.quoteMorePurchaseDetailRoute,
          builder: _quoteMorePurchaseDetailBuilder),
      GoRoute(
          path: Routes.personalDetailRoute, builder: _personalDetailBuilder),
      GoRoute(path: Routes.securityRoute, builder: _securityBuilder),
      GoRoute(path: Routes.preferencesRoute, builder: _preferencesBuilder),
      GoRoute(path: Routes.notificationsRoute, builder: _notificationsBuilder),
      GoRoute(path: Routes.carHireExcessRoute, builder: _carHireExcessBuilder),
      GoRoute(path: Routes.cruiseCoverRoute, builder: _cruiseCoverBuilder),
      GoRoute(
          path: Routes.vacationRentalRoute, builder: _vacationRentalBuilder),
      GoRoute(
          path: Routes.personalLiabilityRoute,
          builder: _personalLiabilityBuilder),
      GoRoute(
          path: Routes.adventureExtremeRoute,
          builder: _adventureExtremeBuilder),
      GoRoute(path: Routes.winterSportsRoute, builder: _winterSportsBuilder),
      GoRoute(path: Routes.gadgetCoverRoute, builder: _gadgetCoverBuilder),
      GoRoute(path: Routes.golfCoverRoute, builder: _golfCoverBuilder),
      GoRoute(path: Routes.cancelReasonRoute, builder: _cancelReasonBuilder),
      GoRoute(path: Routes.petCareRoute, builder: _petCareBuilder),
      GoRoute(path: Routes.rentalCareRoute, builder: _rentalCareBuilder),
      GoRoute(
          path: Routes.changeLanguageRoute, builder: _changeLanguageBuilder),
      GoRoute(
          path: Routes.contactUsRoute, builder: _contactUsBuilder),
      GoRoute(
          path: Routes.drawerMenu, builder: _drawerMenuBuilder),
    ],
  );

  static GoRouter get router => _router;
}
