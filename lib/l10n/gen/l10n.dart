// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `English`
  String get language {
    return Intl.message(
      'English',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Sign in or create an account`
  String get sign_in_or_create_account {
    return Intl.message(
      'Sign in or create an account',
      name: 'sign_in_or_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get email_address {
    return Intl.message(
      'Email address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get enter_email_address {
    return Intl.message(
      'Enter email address',
      name: 'enter_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email address`
  String get incorrect_email_address {
    return Intl.message(
      'Incorrect email address',
      name: 'incorrect_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enter_password {
    return Intl.message(
      'Enter password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get incorrect_password {
    return Intl.message(
      'Incorrect password',
      name: 'incorrect_password',
      desc: '',
      args: [],
    );
  }

  /// `Keep me signed in`
  String get keep_me_signed_in {
    return Intl.message(
      'Keep me signed in',
      name: 'keep_me_signed_in',
      desc: '',
      args: [],
    );
  }

  /// `Selecting this checkbox will keep you signed into your account on this device until you sign out. Do not select this on shared devices.`
  String get keep_me_signed_in_note {
    return Intl.message(
      'Selecting this checkbox will keep you signed into your account on this device until you sign out. Do not select this on shared devices.',
      name: 'keep_me_signed_in_note',
      desc: '',
      args: [],
    );
  }

  /// `By signing in, I agree to the Lyla \n`
  String get login_term {
    return Intl.message(
      'By signing in, I agree to the Lyla \n',
      name: 'login_term',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Business`
  String get login_term_business {
    return Intl.message(
      'Terms of Business',
      name: 'login_term_business',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(
      ' and ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy.`
  String get login_term_privacy_policy {
    return Intl.message(
      'Privacy Policy.',
      name: 'login_term_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get create_account {
    return Intl.message(
      'Create an account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language_title_popup {
    return Intl.message(
      'Language',
      name: 'language_title_popup',
      desc: '',
      args: [],
    );
  }

  /// `Set your language preference`
  String get set_your_language_preference {
    return Intl.message(
      'Set your language preference',
      name: 'set_your_language_preference',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get select_language {
    return Intl.message(
      'Select language',
      name: 'select_language',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Save Details`
  String get save_details {
    return Intl.message(
      'Save Details',
      name: 'save_details',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Hong Kong`
  String get hong_kong {
    return Intl.message(
      'Hong Kong',
      name: 'hong_kong',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgot_password {
    return Intl.message(
      'Forgot password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `< Back to Sign in`
  String get back_to_sign_in {
    return Intl.message(
      '< Back to Sign in',
      name: 'back_to_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get please_enter_a_valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'please_enter_a_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get check_you_email {
    return Intl.message(
      'Check your email',
      name: 'check_you_email',
      desc: '',
      args: [],
    );
  }

  /// `We've send an email to `
  String get check_you_email_content {
    return Intl.message(
      'We\'ve send an email to ',
      name: 'check_you_email_content',
      desc: '',
      args: [],
    );
  }

  /// `Open email`
  String get open_mail {
    return Intl.message(
      'Open email',
      name: 'open_mail',
      desc: '',
      args: [],
    );
  }

  /// `Did not receive.`
  String get did_not_receive {
    return Intl.message(
      'Did not receive.',
      name: 'did_not_receive',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Manage account`
  String get manage_account {
    return Intl.message(
      'Manage account',
      name: 'manage_account',
      desc: '',
      args: [],
    );
  }

  /// `Get a quote`
  String get get_a_quote {
    return Intl.message(
      'Get a quote',
      name: 'get_a_quote',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language_profile {
    return Intl.message(
      'Language',
      name: 'language_profile',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get sign_out {
    return Intl.message(
      'Sign out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get account_settings {
    return Intl.message(
      'Account Settings',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `Manage your Lyla experience`
  String get account_settings_content {
    return Intl.message(
      'Manage your Lyla experience',
      name: 'account_settings_content',
      desc: '',
      args: [],
    );
  }

  /// `Personal details`
  String get personal_details {
    return Intl.message(
      'Personal details',
      name: 'personal_details',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get security {
    return Intl.message(
      'Security',
      name: 'security',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `First name*`
  String get first_name_require {
    return Intl.message(
      'First name*',
      name: 'first_name_require',
      desc: '',
      args: [],
    );
  }

  /// `Enter first name`
  String get enter_first_name {
    return Intl.message(
      'Enter first name',
      name: 'enter_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter last name`
  String get enter_last_name {
    return Intl.message(
      'Enter last name',
      name: 'enter_last_name',
      desc: '',
      args: [],
    );
  }

  /// `Last name*`
  String get last_name_require {
    return Intl.message(
      'Last name*',
      name: 'last_name_require',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get mobile_number {
    return Intl.message(
      'Mobile number',
      name: 'mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get enter_confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'enter_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `I don’t want to receive emails about the Lyla product, features and promotion updates.`
  String get dont_want_receive_email {
    return Intl.message(
      'I don’t want to receive emails about the Lyla product, features and promotion updates.',
      name: 'dont_want_receive_email',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account.`
  String get have_account {
    return Intl.message(
      'I already have an account.',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree to the \n`
  String get agree_to {
    return Intl.message(
      'I have read and agree to the \n',
      name: 'agree_to',
      desc: '',
      args: [],
    );
  }

  /// `Travel insurance that suits you and your trips`
  String get onboarding_1 {
    return Intl.message(
      'Travel insurance that suits you and your trips',
      name: 'onboarding_1',
      desc: '',
      args: [],
    );
  }

  /// `Hassle-free digital experience. Choice of insurance coverage plans.`
  String get onboarding_2 {
    return Intl.message(
      'Hassle-free digital experience. Choice of insurance coverage plans.',
      name: 'onboarding_2',
      desc: '',
      args: [],
    );
  }

  /// `Change your residential location, language, and currency.`
  String get preferences_content {
    return Intl.message(
      'Change your residential location, language, and currency.',
      name: 'preferences_content',
      desc: '',
      args: [],
    );
  }

  /// `Country of residence`
  String get country_of_residence {
    return Intl.message(
      'Country of residence',
      name: 'country_of_residence',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Set new password`
  String get set_new_password {
    return Intl.message(
      'Set new password',
      name: 'set_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Must have 8 characters`
  String get must_have_8_chars {
    return Intl.message(
      'Must have 8 characters',
      name: 'must_have_8_chars',
      desc: '',
      args: [],
    );
  }

  /// `Password doesn’t match`
  String get password_does_not_match {
    return Intl.message(
      'Password doesn’t match',
      name: 'password_does_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Adjust your security settings and set up two-factor authentication`
  String get adjust_your_security_settings {
    return Intl.message(
      'Adjust your security settings and set up two-factor authentication',
      name: 'adjust_your_security_settings',
      desc: '',
      args: [],
    );
  }

  /// `To change your password, we need to send a reset link to your email address.`
  String get to_change_your_password {
    return Intl.message(
      'To change your password, we need to send a reset link to your email address.',
      name: 'to_change_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Why do you want to delete your account?`
  String get why_do_you_want_to_delete_your_account {
    return Intl.message(
      'Why do you want to delete your account?',
      name: 'why_do_you_want_to_delete_your_account',
      desc: '',
      args: [],
    );
  }

  /// `I get too many emails from Lyla. If you’d prefer to keep your account benefits without any marketing emails, you can unsubscribe instead.`
  String get security_context_1 {
    return Intl.message(
      'I get too many emails from Lyla. If you’d prefer to keep your account benefits without any marketing emails, you can unsubscribe instead.',
      name: 'security_context_1',
      desc: '',
      args: [],
    );
  }

  /// `I want to use a different email address for my account. There's a faster way! Change it below or update it anytime in the ‘Personal details’ section of your account settings.`
  String get security_context_2 {
    return Intl.message(
      'I want to use a different email address for my account. There\'s a faster way! Change it below or update it anytime in the ‘Personal details’ section of your account settings.',
      name: 'security_context_2',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Send email`
  String get send_email {
    return Intl.message(
      'Send email',
      name: 'send_email',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email`
  String get check_mail {
    return Intl.message(
      'Please check your email',
      name: 'check_mail',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been created. We have sent you a link to verify your email address.`
  String get verify_your_mail_desc_1 {
    return Intl.message(
      'Your account has been created. We have sent you a link to verify your email address.',
      name: 'verify_your_mail_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `If you haven’t received the email from us, please click the button below to re-send the access link or send an email to `
  String get verify_your_mail_desc_2 {
    return Intl.message(
      'If you haven’t received the email from us, please click the button below to re-send the access link or send an email to ',
      name: 'verify_your_mail_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Verification success!`
  String get verification_success {
    return Intl.message(
      'Verification success!',
      name: 'verification_success',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully verified your email address.`
  String get verification_success_desc {
    return Intl.message(
      'You have successfully verified your email address.',
      name: 'verification_success_desc',
      desc: '',
      args: [],
    );
  }

  /// `Verification failed`
  String get verification_fail {
    return Intl.message(
      'Verification failed',
      name: 'verification_fail',
      desc: '',
      args: [],
    );
  }

  /// `Your verification link has failed. Please try again and if the problem persists, please email `
  String get verification_fail_desc {
    return Intl.message(
      'Your verification link has failed. Please try again and if the problem persists, please email ',
      name: 'verification_fail_desc',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Promotions & deals`
  String get promotions_deals {
    return Intl.message(
      'Promotions & deals',
      name: 'promotions_deals',
      desc: '',
      args: [],
    );
  }

  /// `Emails based on destinations and coverages you could be interested in.`
  String get promotions_deals_content {
    return Intl.message(
      'Emails based on destinations and coverages you could be interested in.',
      name: 'promotions_deals_content',
      desc: '',
      args: [],
    );
  }

  /// `Rewards`
  String get rewards {
    return Intl.message(
      'Rewards',
      name: 'rewards',
      desc: '',
      args: [],
    );
  }

  /// `Refer a Friend`
  String get refer_a_friend {
    return Intl.message(
      'Refer a Friend',
      name: 'refer_a_friend',
      desc: '',
      args: [],
    );
  }

  /// `Lyla products and services`
  String get lyla_products_and_services {
    return Intl.message(
      'Lyla products and services',
      name: 'lyla_products_and_services',
      desc: '',
      args: [],
    );
  }

  /// `Communications about Lyla’s products and services.`
  String get communications_about_lyla_products_and_services {
    return Intl.message(
      'Communications about Lyla’s products and services.',
      name: 'communications_about_lyla_products_and_services',
      desc: '',
      args: [],
    );
  }

  /// `Customer feedback`
  String get customer_feedback {
    return Intl.message(
      'Customer feedback',
      name: 'customer_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Product announcements`
  String get product_announcements {
    return Intl.message(
      'Product announcements',
      name: 'product_announcements',
      desc: '',
      args: [],
    );
  }

  /// `Travel experiences`
  String get travel_experiences {
    return Intl.message(
      'Travel experiences',
      name: 'travel_experiences',
      desc: '',
      args: [],
    );
  }

  /// `Customized information and offers to make the most out of your trip, including partner offers.`
  String get travel_experiences_content {
    return Intl.message(
      'Customized information and offers to make the most out of your trip, including partner offers.',
      name: 'travel_experiences_content',
      desc: '',
      args: [],
    );
  }

  /// `Purchase emails`
  String get purchase_emails {
    return Intl.message(
      'Purchase emails',
      name: 'purchase_emails',
      desc: '',
      args: [],
    );
  }

  /// `Emails you receive after making a purchase. This includes invitations to review the policy, coverage or claims.`
  String get purchase_emails_content {
    return Intl.message(
      'Emails you receive after making a purchase. This includes invitations to review the policy, coverage or claims.',
      name: 'purchase_emails_content',
      desc: '',
      args: [],
    );
  }

  /// `Renewals`
  String get renewals {
    return Intl.message(
      'Renewals',
      name: 'renewals',
      desc: '',
      args: [],
    );
  }

  /// `Auto renewal emails about the renewal of a policy.`
  String get renewals_content {
    return Intl.message(
      'Auto renewal emails about the renewal of a policy.',
      name: 'renewals_content',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Emails inviting you to leave a review about a policy you have purchased.`
  String get reviews_content {
    return Intl.message(
      'Emails inviting you to leave a review about a policy you have purchased.',
      name: 'reviews_content',
      desc: '',
      args: [],
    );
  }

  /// `Offers in confirmation emails`
  String get offers_in_confirmation_emails {
    return Intl.message(
      'Offers in confirmation emails',
      name: 'offers_in_confirmation_emails',
      desc: '',
      args: [],
    );
  }

  /// `Other product and deals in your confirmation emails.`
  String get other_product_and_deals {
    return Intl.message(
      'Other product and deals in your confirmation emails.',
      name: 'other_product_and_deals',
      desc: '',
      args: [],
    );
  }

  /// `Purchase confirmation emails`
  String get purchase_confirmation_emails {
    return Intl.message(
      'Purchase confirmation emails',
      name: 'purchase_confirmation_emails',
      desc: '',
      args: [],
    );
  }

  /// `You can’t unsubscribe to purchase confirmation emails.`
  String get you_cant_unsubscribe {
    return Intl.message(
      'You can’t unsubscribe to purchase confirmation emails.',
      name: 'you_cant_unsubscribe',
      desc: '',
      args: [],
    );
  }

  /// `Newsletters & services`
  String get newsletters_services {
    return Intl.message(
      'Newsletters & services',
      name: 'newsletters_services',
      desc: '',
      args: [],
    );
  }

  /// `Purchases`
  String get purchases {
    return Intl.message(
      'Purchases',
      name: 'purchases',
      desc: '',
      args: [],
    );
  }

  /// `Update your info and see how it’s used`
  String get personal_detail_desc {
    return Intl.message(
      'Update your info and see how it’s used',
      name: 'personal_detail_desc',
      desc: '',
      args: [],
    );
  }

  /// `Contact details`
  String get contact_details {
    return Intl.message(
      'Contact details',
      name: 'contact_details',
      desc: '',
      args: [],
    );
  }

  /// `We'll send a verification link to your new email address – check your inbox.`
  String get contact_details_desc {
    return Intl.message(
      'We\'ll send a verification link to your new email address – check your inbox.',
      name: 'contact_details_desc',
      desc: '',
      args: [],
    );
  }

  /// `Pressing "Send code" will text a 6-digit code to your phone, which you'll enter in the next step. `
  String get contact_details_desc_2 {
    return Intl.message(
      'Pressing "Send code" will text a 6-digit code to your phone, which you\'ll enter in the next step. ',
      name: 'contact_details_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resend_code {
    return Intl.message(
      'Resend code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Address 1`
  String get address_1 {
    return Intl.message(
      'Address 1',
      name: 'address_1',
      desc: '',
      args: [],
    );
  }

  /// `Address 2`
  String get address_2 {
    return Intl.message(
      'Address 2',
      name: 'address_2',
      desc: '',
      args: [],
    );
  }

  /// `Town/City`
  String get town_city {
    return Intl.message(
      'Town/City',
      name: 'town_city',
      desc: '',
      args: [],
    );
  }

  /// `State/Country`
  String get state_country {
    return Intl.message(
      'State/Country',
      name: 'state_country',
      desc: '',
      args: [],
    );
  }

  /// `Postcode`
  String get postcode {
    return Intl.message(
      'Postcode',
      name: 'postcode',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid name`
  String get please_enter_a_valid_name {
    return Intl.message(
      'Please enter a valid name',
      name: 'please_enter_a_valid_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid postcode`
  String get please_enter_a_valid_postcode {
    return Intl.message(
      'Please enter a valid postcode',
      name: 'please_enter_a_valid_postcode',
      desc: '',
      args: [],
    );
  }

  /// `Here are your quotes`
  String get single_trip_cover_here_your_quote {
    return Intl.message(
      'Here are your quotes',
      name: 'single_trip_cover_here_your_quote',
      desc: '',
      args: [],
    );
  }

  /// `Single trip cover`
  String get single_trip_cover {
    return Intl.message(
      'Single trip cover',
      name: 'single_trip_cover',
      desc: '',
      args: [],
    );
  }

  /// `Your trip details`
  String get your_trip_detail {
    return Intl.message(
      'Your trip details',
      name: 'your_trip_detail',
      desc: '',
      args: [],
    );
  }

  /// `Travellers`
  String get travellers {
    return Intl.message(
      'Travellers',
      name: 'travellers',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get sort {
    return Intl.message(
      'Sort',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Optional extras`
  String get optional_extras {
    return Intl.message(
      'Optional extras',
      name: 'optional_extras',
      desc: '',
      args: [],
    );
  }

  /// `More details`
  String get more_details {
    return Intl.message(
      'More details',
      name: 'more_details',
      desc: '',
      args: [],
    );
  }

  /// `© 2024 CoverGain Brokers Limited. All rights reserved. \n\nPlease note quotes are only available for residents of the Hong Kong and for trips which start from the Hong Kong.\n\nLyla is the brand for CoverGain Brokers Limited (registered in Hong Kong under company number XXXX) (“CoverGain”). CoverGain is an authorized insurance broker with Insurance Authority License Number XXXX whose business it is to help find the right cover, arrange insurance products and services for its clients.\n\n`
  String get quote_list_note {
    return Intl.message(
      '© 2024 CoverGain Brokers Limited. All rights reserved. \n\nPlease note quotes are only available for residents of the Hong Kong and for trips which start from the Hong Kong.\n\nLyla is the brand for CoverGain Brokers Limited (registered in Hong Kong under company number XXXX) (“CoverGain”). CoverGain is an authorized insurance broker with Insurance Authority License Number XXXX whose business it is to help find the right cover, arrange insurance products and services for its clients.\n\n',
      name: 'quote_list_note',
      desc: '',
      args: [],
    );
  }

  /// `Highest price`
  String get highest_price {
    return Intl.message(
      'Highest price',
      name: 'highest_price',
      desc: '',
      args: [],
    );
  }

  /// `Lowest price`
  String get lowest_price {
    return Intl.message(
      'Lowest price',
      name: 'lowest_price',
      desc: '',
      args: [],
    );
  }

  /// `Most discounted`
  String get most_discounted {
    return Intl.message(
      'Most discounted',
      name: 'most_discounted',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get selected {
    return Intl.message(
      'Selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `Filter your results`
  String get filter_your_results {
    return Intl.message(
      'Filter your results',
      name: 'filter_your_results',
      desc: '',
      args: [],
    );
  }

  /// `Show all`
  String get show_all {
    return Intl.message(
      'Show all',
      name: 'show_all',
      desc: '',
      args: [],
    );
  }

  /// `Cruise cover`
  String get cruise_cover {
    return Intl.message(
      'Cruise cover',
      name: 'cruise_cover',
      desc: '',
      args: [],
    );
  }

  /// `Rental vehicle excess cover`
  String get excess_cover {
    return Intl.message(
      'Rental vehicle excess cover',
      name: 'excess_cover',
      desc: '',
      args: [],
    );
  }

  /// `Vacation rental protection`
  String get rental_protection {
    return Intl.message(
      'Vacation rental protection',
      name: 'rental_protection',
      desc: '',
      args: [],
    );
  }

  /// `Golf cover`
  String get golf_cover {
    return Intl.message(
      'Golf cover',
      name: 'golf_cover',
      desc: '',
      args: [],
    );
  }

  /// `Adventure & extreme sports  protection`
  String get adventure_extreme {
    return Intl.message(
      'Adventure & extreme sports  protection',
      name: 'adventure_extreme',
      desc: '',
      args: [],
    );
  }

  /// `Winter sports protection`
  String get winter_sports {
    return Intl.message(
      'Winter sports protection',
      name: 'winter_sports',
      desc: '',
      args: [],
    );
  }

  /// `Personal liability protection`
  String get personal_protection {
    return Intl.message(
      'Personal liability protection',
      name: 'personal_protection',
      desc: '',
      args: [],
    );
  }

  /// `Gadget cover`
  String get gadget_cover {
    return Intl.message(
      'Gadget cover',
      name: 'gadget_cover',
      desc: '',
      args: [],
    );
  }

  /// `Pet care cover`
  String get pet_care_cover {
    return Intl.message(
      'Pet care cover',
      name: 'pet_care_cover',
      desc: '',
      args: [],
    );
  }

  /// `Include, exclude & show only`
  String get include_exclude_show {
    return Intl.message(
      'Include, exclude & show only',
      name: 'include_exclude_show',
      desc: '',
      args: [],
    );
  }

  /// `Reset filters`
  String get reset_filters {
    return Intl.message(
      'Reset filters',
      name: 'reset_filters',
      desc: '',
      args: [],
    );
  }

  /// `Update results`
  String get update_results {
    return Intl.message(
      'Update results',
      name: 'update_results',
      desc: '',
      args: [],
    );
  }

  /// `Protect your trip for`
  String get protect_your_trip {
    return Intl.message(
      'Protect your trip for',
      name: 'protect_your_trip',
      desc: '',
      args: [],
    );
  }

  /// `Select country`
  String get select_country {
    return Intl.message(
      'Select country',
      name: 'select_country',
      desc: '',
      args: [],
    );
  }

  /// `Hi, I’m Amber.`
  String get greeting {
    return Intl.message(
      'Hi, I’m Amber.',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `What type of cover would you like a quote for?`
  String get how_can_i_help {
    return Intl.message(
      'What type of cover would you like a quote for?',
      name: 'how_can_i_help',
      desc: '',
      args: [],
    );
  }

  /// `I live in `
  String get i_live_in {
    return Intl.message(
      'I live in ',
      name: 'i_live_in',
      desc: '',
      args: [],
    );
  }

  /// `Get your quote`
  String get get_your_quote {
    return Intl.message(
      'Get your quote',
      name: 'get_your_quote',
      desc: '',
      args: [],
    );
  }

  /// `Have a friend’s referral code?`
  String get friend_refer {
    return Intl.message(
      'Have a friend’s referral code?',
      name: 'friend_refer',
      desc: '',
      args: [],
    );
  }

  /// `Destinations to cover?`
  String get destination_heading {
    return Intl.message(
      'Destinations to cover?',
      name: 'destination_heading',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Asia`
  String get asia {
    return Intl.message(
      'Asia',
      name: 'asia',
      desc: '',
      args: [],
    );
  }

  /// `Worldwide`
  String get world_wide {
    return Intl.message(
      'Worldwide',
      name: 'world_wide',
      desc: '',
      args: [],
    );
  }

  /// `Where are you going?`
  String get where_are_you_going {
    return Intl.message(
      'Where are you going?',
      name: 'where_are_you_going',
      desc: '',
      args: [],
    );
  }

  /// `Included Asia countries covered`
  String get included_asia_cover_countries {
    return Intl.message(
      'Included Asia countries covered',
      name: 'included_asia_cover_countries',
      desc: '',
      args: [],
    );
  }

  /// `Included countries`
  String get included_countries {
    return Intl.message(
      'Included countries',
      name: 'included_countries',
      desc: '',
      args: [],
    );
  }

  /// `Excluded countries`
  String get excluded_countries {
    return Intl.message(
      'Excluded countries',
      name: 'excluded_countries',
      desc: '',
      args: [],
    );
  }

  /// `Excluded worldwide countries covered`
  String get excluded_worldwide_countries_covered {
    return Intl.message(
      'Excluded worldwide countries covered',
      name: 'excluded_worldwide_countries_covered',
      desc: '',
      args: [],
    );
  }

  /// `Annual cover`
  String get annual_cover {
    return Intl.message(
      'Annual cover',
      name: 'annual_cover',
      desc: '',
      args: [],
    );
  }

  /// `Recommended if you travel 2+ times per year.`
  String get recommended_if_you_travel {
    return Intl.message(
      'Recommended if you travel 2+ times per year.',
      name: 'recommended_if_you_travel',
      desc: '',
      args: [],
    );
  }

  /// `Destinations to cover?`
  String get destinations_to_cover {
    return Intl.message(
      'Destinations to cover?',
      name: 'destinations_to_cover',
      desc: '',
      args: [],
    );
  }

  /// `Traveling to multiple countries? Plug them in!`
  String get traveling_to_multiple_countries {
    return Intl.message(
      'Traveling to multiple countries? Plug them in!',
      name: 'traveling_to_multiple_countries',
      desc: '',
      args: [],
    );
  }

  /// `Select destination`
  String get select_destination {
    return Intl.message(
      'Select destination',
      name: 'select_destination',
      desc: '',
      args: [],
    );
  }

  /// `If you’re only going away for less then 90 days.`
  String get if_youre_only_going {
    return Intl.message(
      'If you’re only going away for less then 90 days.',
      name: 'if_youre_only_going',
      desc: '',
      args: [],
    );
  }

  /// `Enter Countries`
  String get enter_countries {
    return Intl.message(
      'Enter Countries',
      name: 'enter_countries',
      desc: '',
      args: [],
    );
  }

  /// `Travel Disruption option`
  String get travel_disruption_option {
    return Intl.message(
      'Travel Disruption option',
      name: 'travel_disruption_option',
      desc: '',
      args: [],
    );
  }

  /// `Vacation rental protection`
  String get vacation_rental_protection {
    return Intl.message(
      'Vacation rental protection',
      name: 'vacation_rental_protection',
      desc: '',
      args: [],
    );
  }

  /// `Personal liability option`
  String get personal_liability_option {
    return Intl.message(
      'Personal liability option',
      name: 'personal_liability_option',
      desc: '',
      args: [],
    );
  }

  /// `Adventure and extreme sports`
  String get adventure_and_extreme_sports {
    return Intl.message(
      'Adventure and extreme sports',
      name: 'adventure_and_extreme_sports',
      desc: '',
      args: [],
    );
  }

  /// `Single item cover`
  String get single_item_cover {
    return Intl.message(
      'Single item cover',
      name: 'single_item_cover',
      desc: '',
      args: [],
    );
  }

  /// `Excess waver`
  String get excess_waver {
    return Intl.message(
      'Excess waver',
      name: 'excess_waver',
      desc: '',
      args: [],
    );
  }

  /// `Car hire Excess waiver`
  String get car_hire_excess_waiver {
    return Intl.message(
      'Car hire Excess waiver',
      name: 'car_hire_excess_waiver',
      desc: '',
      args: [],
    );
  }

  /// `Do you also want additional cover included in the quote:`
  String get do_you_also_want {
    return Intl.message(
      'Do you also want additional cover included in the quote:',
      name: 'do_you_also_want',
      desc: '',
      args: [],
    );
  }

  /// `from\n\$1180`
  String get from_1180 {
    return Intl.message(
      'from\\n\\\$1180',
      name: 'from_1180',
      desc: '',
      args: [],
    );
  }

  /// `Select the destinations to cover.`
  String get select_the_destinations_to_cover {
    return Intl.message(
      'Select the destinations to cover.',
      name: 'select_the_destinations_to_cover',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Verified`
  String get verified {
    return Intl.message(
      'Verified',
      name: 'verified',
      desc: '',
      args: [],
    );
  }

  /// `The email address you use to sign in and where we send all polices too.`
  String get the_email_address_you_use_to_sign {
    return Intl.message(
      'The email address you use to sign in and where we send all polices too.',
      name: 'the_email_address_you_use_to_sign',
      desc: '',
      args: [],
    );
  }

  /// `The mobile number is where we will send messages too.`
  String get the_mobile_number_is_where_we_will_send_messages_too {
    return Intl.message(
      'The mobile number is where we will send messages too.',
      name: 'the_mobile_number_is_where_we_will_send_messages_too',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otp_verification {
    return Intl.message(
      'OTP Verification',
      name: 'otp_verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP sent to`
  String get enter_the_otp_sent_to {
    return Intl.message(
      'Enter the OTP sent to',
      name: 'enter_the_otp_sent_to',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t you receive the OTP?`
  String get didnt_you_receive_the_otp {
    return Intl.message(
      'Didn’t you receive the OTP?',
      name: 'didnt_you_receive_the_otp',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get resend_otp {
    return Intl.message(
      'Resend OTP',
      name: 'resend_otp',
      desc: '',
      args: [],
    );
  }

  /// `per year`
  String get per_year {
    return Intl.message(
      'per year',
      name: 'per_year',
      desc: '',
      args: [],
    );
  }

  /// `per day`
  String get per_day {
    return Intl.message(
      'per day',
      name: 'per_day',
      desc: '',
      args: [],
    );
  }

  /// `We will email you your policy wording when your policy is activated.`
  String get we_will_email_you_your {
    return Intl.message(
      'We will email you your policy wording when your policy is activated.',
      name: 'we_will_email_you_your',
      desc: '',
      args: [],
    );
  }

  /// `Your price includes the HK Insurance Premium Levy.`
  String get your_price_includes_the_HK {
    return Intl.message(
      'Your price includes the HK Insurance Premium Levy.',
      name: 'your_price_includes_the_HK',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Purchase`
  String get confirm_purchase {
    return Intl.message(
      'Confirm Purchase',
      name: 'confirm_purchase',
      desc: '',
      args: [],
    );
  }

  /// `Not ready to buy?`
  String get not_ready_to_buy {
    return Intl.message(
      'Not ready to buy?',
      name: 'not_ready_to_buy',
      desc: '',
      args: [],
    );
  }

  /// `Click`
  String get click {
    return Intl.message(
      'Click',
      name: 'click',
      desc: '',
      args: [],
    );
  }

  /// `here`
  String get here {
    return Intl.message(
      'here',
      name: 'here',
      desc: '',
      args: [],
    );
  }

  /// `to email your quote`
  String get to_email_your_quote {
    return Intl.message(
      'to email your quote',
      name: 'to_email_your_quote',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of business`
  String get terms_of_business {
    return Intl.message(
      'Terms of business',
      name: 'terms_of_business',
      desc: '',
      args: [],
    );
  }

  /// `Our`
  String get our {
    return Intl.message(
      'Our',
      name: 'our',
      desc: '',
      args: [],
    );
  }

  /// `are`
  String get are {
    return Intl.message(
      'are',
      name: 'are',
      desc: '',
      args: [],
    );
  }

  /// `available for you to read here`
  String get available_for_you_to_read_here {
    return Intl.message(
      'available for you to read here',
      name: 'available_for_you_to_read_here',
      desc: '',
      args: [],
    );
  }

  /// `Here’s your quote`
  String get here_your_quote {
    return Intl.message(
      'Here’s your quote',
      name: 'here_your_quote',
      desc: '',
      args: [],
    );
  }

  /// `Annual trip cover`
  String get annual_trip_cover {
    return Intl.message(
      'Annual trip cover',
      name: 'annual_trip_cover',
      desc: '',
      args: [],
    );
  }

  /// `Asia superior travel insurance`
  String get asia_superior_travel_insurance {
    return Intl.message(
      'Asia superior travel insurance',
      name: 'asia_superior_travel_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Trip coverage details`
  String get trip_coverage_details {
    return Intl.message(
      'Trip coverage details',
      name: 'trip_coverage_details',
      desc: '',
      args: [],
    );
  }

  /// `Name:`
  String get name {
    return Intl.message(
      'Name:',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Policy:`
  String get policy {
    return Intl.message(
      'Policy:',
      name: 'policy',
      desc: '',
      args: [],
    );
  }

  /// `Plan:`
  String get plan {
    return Intl.message(
      'Plan:',
      name: 'plan',
      desc: '',
      args: [],
    );
  }

  /// `Destination:`
  String get destination {
    return Intl.message(
      'Destination:',
      name: 'destination',
      desc: '',
      args: [],
    );
  }

  /// `Policy start date:`
  String get policy_start_date {
    return Intl.message(
      'Policy start date:',
      name: 'policy_start_date',
      desc: '',
      args: [],
    );
  }

  /// `Policy end date:`
  String get policy_end_date {
    return Intl.message(
      'Policy end date:',
      name: 'policy_end_date',
      desc: '',
      args: [],
    );
  }

  /// `Downloads`
  String get downloads {
    return Intl.message(
      'Downloads',
      name: 'downloads',
      desc: '',
      args: [],
    );
  }

  /// `Benefits schedule`
  String get benefits_schedule {
    return Intl.message(
      'Benefits schedule',
      name: 'benefits_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Policy wording`
  String get policy_wording {
    return Intl.message(
      'Policy wording',
      name: 'policy_wording',
      desc: '',
      args: [],
    );
  }

  /// `Covid 19 extension`
  String get covid_19_extension {
    return Intl.message(
      'Covid 19 extension',
      name: 'covid_19_extension',
      desc: '',
      args: [],
    );
  }

  /// `What’s covered?`
  String get whats_covered {
    return Intl.message(
      'What’s covered?',
      name: 'whats_covered',
      desc: '',
      args: [],
    );
  }

  /// `Details about your policy.`
  String get details_about_your_policy {
    return Intl.message(
      'Details about your policy.',
      name: 'details_about_your_policy',
      desc: '',
      args: [],
    );
  }

  /// `Here's your quote`
  String get single_trip_cover_here_your_quote_2 {
    return Intl.message(
      'Here\'s your quote',
      name: 'single_trip_cover_here_your_quote_2',
      desc: '',
      args: [],
    );
  }

  /// `Rental vehicle excess cover`
  String get rental_vehicle_excess_cover {
    return Intl.message(
      'Rental vehicle excess cover',
      name: 'rental_vehicle_excess_cover',
      desc: '',
      args: [],
    );
  }

  /// `When you rent a motor vehicle overseas, the total rental price usually includes a Collision Damage Waiver (CDW) element. This means that if the vehicle is accidentally damaged by you or a third party, you will not be liable to pay the full cost of the repair. However, you will often be liable for a portion of the repair cost – this is usually called the ‘Collision Damage Waiver Excess’.`
  String get rental_vehicle_excess_cover_content {
    return Intl.message(
      'When you rent a motor vehicle overseas, the total rental price usually includes a Collision Damage Waiver (CDW) element. This means that if the vehicle is accidentally damaged by you or a third party, you will not be liable to pay the full cost of the repair. However, you will often be liable for a portion of the repair cost – this is usually called the ‘Collision Damage Waiver Excess’.',
      name: 'rental_vehicle_excess_cover_content',
      desc: '',
      args: [],
    );
  }

  /// `‘Rental Vehicle Excess’ coverage. In the event of loss of or damage to the vehicle, you will be reimbursed the excess amount payable to the rental company up to HK$5,000.`
  String get rental_vehicle_excess_cover_content_2 {
    return Intl.message(
      '‘Rental Vehicle Excess’ coverage. In the event of loss of or damage to the vehicle, you will be reimbursed the excess amount payable to the rental company up to HK\$5,000.',
      name: 'rental_vehicle_excess_cover_content_2',
      desc: '',
      args: [],
    );
  }

  /// `Add to plan for`
  String get add_to_plan_for {
    return Intl.message(
      'Add to plan for',
      name: 'add_to_plan_for',
      desc: '',
      args: [],
    );
  }

  /// `Choose Date`
  String get choose_date {
    return Intl.message(
      'Choose Date',
      name: 'choose_date',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get From {
    return Intl.message(
      'From',
      name: 'From',
      desc: '',
      args: [],
    );
  }

  /// `Adventure & extreme sports protection`
  String get adventure_extreme_sports_protection {
    return Intl.message(
      'Adventure & extreme sports protection',
      name: 'adventure_extreme_sports_protection',
      desc: '',
      args: [],
    );
  }

  /// `Coverage for medical expenses if you become injured while participating in adventure or extreme sports as defined in the plan on the same basis as all other injuries.`
  String get adventure_extreme_content {
    return Intl.message(
      'Coverage for medical expenses if you become injured while participating in adventure or extreme sports as defined in the plan on the same basis as all other injuries.',
      name: 'adventure_extreme_content',
      desc: '',
      args: [],
    );
  }

  /// `Add to plan`
  String get add_to_plan {
    return Intl.message(
      'Add to plan',
      name: 'add_to_plan',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `Let's confirm your basic information`
  String get lets_confirm_your_basic_info {
    return Intl.message(
      'Let\'s confirm your basic information',
      name: 'lets_confirm_your_basic_info',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions apply`
  String get term_and_conditions_apply {
    return Intl.message(
      'Terms & Conditions apply',
      name: 'term_and_conditions_apply',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `ID Card number`
  String get id_card_number {
    return Intl.message(
      'ID Card number',
      name: 'id_card_number',
      desc: '',
      args: [],
    );
  }

  /// `ID Card number*`
  String get id_card_number_require {
    return Intl.message(
      'ID Card number*',
      name: 'id_card_number_require',
      desc: '',
      args: [],
    );
  }

  /// `Enter ID card number`
  String get enter_id_card_number {
    return Intl.message(
      'Enter ID card number',
      name: 'enter_id_card_number',
      desc: '',
      args: [],
    );
  }

  /// `Check pricing`
  String get check_pricing {
    return Intl.message(
      'Check pricing',
      name: 'check_pricing',
      desc: '',
      args: [],
    );
  }

  /// `Order Placed`
  String get payment_order_placed {
    return Intl.message(
      'Order Placed',
      name: 'payment_order_placed',
      desc: '',
      args: [],
    );
  }

  /// `You will be receiving soon a confirmation email, along with your policies.`
  String get payment_inform_confirm_email {
    return Intl.message(
      'You will be receiving soon a confirmation email, along with your policies.',
      name: 'payment_inform_confirm_email',
      desc: '',
      args: [],
    );
  }

  /// `Remove traveller`
  String get btn_remove_traveller {
    return Intl.message(
      'Remove traveller',
      name: 'btn_remove_traveller',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get txt_privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'txt_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Effective Date: {value}`
  String txt_effective_date(String value) {
    return Intl.message(
      'Effective Date: $value',
      name: 'txt_effective_date',
      desc: '',
      args: [value],
    );
  }

  /// `Terms of Business`
  String get txt_terms_of_business {
    return Intl.message(
      'Terms of Business',
      name: 'txt_terms_of_business',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get btn_close {
    return Intl.message(
      'Close',
      name: 'btn_close',
      desc: '',
      args: [],
    );
  }

  /// `Hi {userName}, Let’s get you covered.`
  String txt_hi_user_name_let_get_you_covered(String userName) {
    return Intl.message(
      'Hi $userName, Let’s get you covered.',
      name: 'txt_hi_user_name_let_get_you_covered',
      desc: '',
      args: [userName],
    );
  }

  /// `Please select date of birth`
  String get msg_error_please_select_date_of_birth {
    return Intl.message(
      'Please select date of birth',
      name: 'msg_error_please_select_date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Add one person to cover`
  String get msg_error_add_one_person_to_cover {
    return Intl.message(
      'Add one person to cover',
      name: 'msg_error_add_one_person_to_cover',
      desc: '',
      args: [],
    );
  }

  /// `{prefixSymbol}Go Back`
  String txt_go_back(String prefixSymbol) {
    return Intl.message(
      '${prefixSymbol}Go Back',
      name: 'txt_go_back',
      desc: '',
      args: [prefixSymbol],
    );
  }

  /// `Go Forward{suffixSymbol}`
  String txt_go_forward(String suffixSymbol) {
    return Intl.message(
      'Go Forward$suffixSymbol',
      name: 'txt_go_forward',
      desc: '',
      args: [suffixSymbol],
    );
  }

  /// `Hi {userName}, let’s get you both covered.`
  String txt_hi_user_name_let_get_you_both_covered(String userName) {
    return Intl.message(
      'Hi $userName, let’s get you both covered.',
      name: 'txt_hi_user_name_let_get_you_both_covered',
      desc: '',
      args: [userName],
    );
  }

  /// `Hi {userName}, let’s get you and your family covered.`
  String txt_hi_user_name_let_get_you_and_your_family_covered(String userName) {
    return Intl.message(
      'Hi $userName, let’s get you and your family covered.',
      name: 'txt_hi_user_name_let_get_you_and_your_family_covered',
      desc: '',
      args: [userName],
    );
  }

  /// `Hi {userName}, let’s get you and your group covered.`
  String txt_hi_user_name_let_get_you_and_your_group_covered(String userName) {
    return Intl.message(
      'Hi $userName, let’s get you and your group covered.',
      name: 'txt_hi_user_name_let_get_you_and_your_group_covered',
      desc: '',
      args: [userName],
    );
  }

  /// `Next`
  String get btn_next {
    return Intl.message(
      'Next',
      name: 'btn_next',
      desc: '',
      args: [],
    );
  }

  /// `Travel Insurance Purchase Journey`
  String get txt_travel_insurance_purchase_journey {
    return Intl.message(
      'Travel Insurance Purchase Journey',
      name: 'txt_travel_insurance_purchase_journey',
      desc: '',
      args: [],
    );
  }

  /// `Combining InsurTech and TravTech to deliver amazing customer experiences across the travel insurance ecosytem.`
  String get txt_combining_insurtech_and_travtech {
    return Intl.message(
      'Combining InsurTech and TravTech to deliver amazing customer experiences across the travel insurance ecosytem.',
      name: 'txt_combining_insurtech_and_travtech',
      desc: '',
      args: [],
    );
  }

  /// `Rental vehicle excess\ncover`
  String get txt_rental_vehicle_excess_cover {
    return Intl.message(
      'Rental vehicle excess\ncover',
      name: 'txt_rental_vehicle_excess_cover',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get txt_select_date {
    return Intl.message(
      'Select Date',
      name: 'txt_select_date',
      desc: '',
      args: [],
    );
  }

  /// `Add to plan for HK$`
  String get btn_add_to_plan_for_HK {
    return Intl.message(
      'Add to plan for HK\$',
      name: 'btn_add_to_plan_for_HK',
      desc: '',
      args: [],
    );
  }

  /// `When you rent a motor vehicle overseas, the total rental price usually includes a Collision Damage Waiver (CDW) element. This means that if the vehicle is accidentally damaged by you or a third party, you will not be liable to pay the full cost of the repair. However, you will often be liable for a portion of the repair cost – this is usually called the ‘Collision Damage Waiver Excess’. ‘Rental Vehicle Excess’ coverage. In the event of loss of or damage to the vehicle, you will be reimbursed the excess amount payable to the rental company up to {money}.`
  String txt_vehicle_policy(String money) {
    return Intl.message(
      'When you rent a motor vehicle overseas, the total rental price usually includes a Collision Damage Waiver (CDW) element. This means that if the vehicle is accidentally damaged by you or a third party, you will not be liable to pay the full cost of the repair. However, you will often be liable for a portion of the repair cost – this is usually called the ‘Collision Damage Waiver Excess’. ‘Rental Vehicle Excess’ coverage. In the event of loss of or damage to the vehicle, you will be reimbursed the excess amount payable to the rental company up to $money.',
      name: 'txt_vehicle_policy',
      desc: '',
      args: [money],
    );
  }

  /// `Plan B`
  String get txt_plan_b {
    return Intl.message(
      'Plan B',
      name: 'txt_plan_b',
      desc: '',
      args: [],
    );
  }

  /// `Your health`
  String get txt_your_health {
    return Intl.message(
      'Your health',
      name: 'txt_your_health',
      desc: '',
      args: [],
    );
  }

  /// `See all health coverage`
  String get txt_see_all_health_coverage {
    return Intl.message(
      'See all health coverage',
      name: 'txt_see_all_health_coverage',
      desc: '',
      args: [],
    );
  }

  /// `Your trip`
  String get txt_your_trip {
    return Intl.message(
      'Your trip',
      name: 'txt_your_trip',
      desc: '',
      args: [],
    );
  }

  /// `See all trip coverage`
  String get txt_see_all_trip_coverage {
    return Intl.message(
      'See all trip coverage',
      name: 'txt_see_all_trip_coverage',
      desc: '',
      args: [],
    );
  }

  /// `Your stuff`
  String get txt_your_stuff {
    return Intl.message(
      'Your stuff',
      name: 'txt_your_stuff',
      desc: '',
      args: [],
    );
  }

  /// `See all personal belongings coverage`
  String get txt_see_all_personal_belongings_coverage {
    return Intl.message(
      'See all personal belongings coverage',
      name: 'txt_see_all_personal_belongings_coverage',
      desc: '',
      args: [],
    );
  }

  /// `Included extras`
  String get txt_included_extras {
    return Intl.message(
      'Included extras',
      name: 'txt_included_extras',
      desc: '',
      args: [],
    );
  }

  /// `See all included extras`
  String get txt_see_all_included_extras {
    return Intl.message(
      'See all included extras',
      name: 'txt_see_all_included_extras',
      desc: '',
      args: [],
    );
  }

  /// `What can you add on?`
  String get txt_what_can_you_add_on {
    return Intl.message(
      'What can you add on?',
      name: 'txt_what_can_you_add_on',
      desc: '',
      args: [],
    );
  }

  /// `Get Covered for {money}`
  String txt_get_covered_for(String money) {
    return Intl.message(
      'Get Covered for $money',
      name: 'txt_get_covered_for',
      desc: '',
      args: [money],
    );
  }

  /// `Traveller`
  String get txt_traveler {
    return Intl.message(
      'Traveller',
      name: 'txt_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get txt_already_have_an_account {
    return Intl.message(
      'Already have an account?',
      name: 'txt_already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign-in`
  String get txt_sign_in {
    return Intl.message(
      'Sign-in',
      name: 'txt_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Create an account.`
  String get txt_create_an_account {
    return Intl.message(
      'Create an account.',
      name: 'txt_create_an_account',
      desc: '',
      args: [],
    );
  }

  /// `It’s faster and could be cheaper for you.`
  String get txt_its_faster_and_could_be_cheaper_for_you {
    return Intl.message(
      'It’s faster and could be cheaper for you.',
      name: 'txt_its_faster_and_could_be_cheaper_for_you',
      desc: '',
      args: [],
    );
  }

  /// `Your entered email address is where we will send you an email with your quote and policy information. From time to time we'd like to contact you regarding other products and services. If you would like to opt out of specific channels, tick here.`
  String get txt_email_address_policy {
    return Intl.message(
      'Your entered email address is where we will send you an email with your quote and policy information. From time to time we\'d like to contact you regarding other products and services. If you would like to opt out of specific channels, tick here.',
      name: 'txt_email_address_policy',
      desc: '',
      args: [],
    );
  }

  /// `When would you like cover to start and end?`
  String get txt_cover_picker_description {
    return Intl.message(
      'When would you like cover to start and end?',
      name: 'txt_cover_picker_description',
      desc: '',
      args: [],
    );
  }

  /// `Until`
  String get txt_until {
    return Intl.message(
      'Until',
      name: 'txt_until',
      desc: '',
      args: [],
    );
  }

  /// `Just the one`
  String get txt_just_the_one {
    return Intl.message(
      'Just the one',
      name: 'txt_just_the_one',
      desc: '',
      args: [],
    );
  }

  /// `We’re two`
  String get txt_we_are_two {
    return Intl.message(
      'We’re two',
      name: 'txt_we_are_two',
      desc: '',
      args: [],
    );
  }

  /// `We’re a family`
  String get txt_we_are_a_family {
    return Intl.message(
      'We’re a family',
      name: 'txt_we_are_a_family',
      desc: '',
      args: [],
    );
  }

  /// `We’re a group`
  String get txt_we_are_a_group {
    return Intl.message(
      'We’re a group',
      name: 'txt_we_are_a_group',
      desc: '',
      args: [],
    );
  }

  /// `Whose going to need cover on this trip?`
  String get txt_whose_going_to_need_cover_on_this_trip {
    return Intl.message(
      'Whose going to need cover on this trip?',
      name: 'txt_whose_going_to_need_cover_on_this_trip',
      desc: '',
      args: [],
    );
  }

  /// `Whose travelling?`
  String get txt_whose_travelling {
    return Intl.message(
      'Whose travelling?',
      name: 'txt_whose_travelling',
      desc: '',
      args: [],
    );
  }

  /// `We need some details from you.`
  String get txt_we_need_some_details_from_you {
    return Intl.message(
      'We need some details from you.',
      name: 'txt_we_need_some_details_from_you',
      desc: '',
      args: [],
    );
  }

  /// `Second traveller`
  String get txt_second_traveller {
    return Intl.message(
      'Second traveller',
      name: 'txt_second_traveller',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the`
  String get txt_i_agree_to {
    return Intl.message(
      'I agree to the',
      name: 'txt_i_agree_to',
      desc: '',
      args: [],
    );
  }

  /// `Third Traveller`
  String get txt_third_traveler {
    return Intl.message(
      'Third Traveller',
      name: 'txt_third_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Forth Traveller`
  String get txt_forth_traveler {
    return Intl.message(
      'Forth Traveller',
      name: 'txt_forth_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Fifth Traveller`
  String get txt_fifth_traveler {
    return Intl.message(
      'Fifth Traveller',
      name: 'txt_fifth_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Sixth Traveller`
  String get txt_sixth_traveler {
    return Intl.message(
      'Sixth Traveller',
      name: 'txt_sixth_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Seventh Traveller`
  String get txt_seventh_traveler {
    return Intl.message(
      'Seventh Traveller',
      name: 'txt_seventh_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Eight Traveller`
  String get txt_eight_traveler {
    return Intl.message(
      'Eight Traveller',
      name: 'txt_eight_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Ninth Traveller`
  String get txt_ninth_traveler {
    return Intl.message(
      'Ninth Traveller',
      name: 'txt_ninth_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Tenth Traveller`
  String get txt_tenth_traveler {
    return Intl.message(
      'Tenth Traveller',
      name: 'txt_tenth_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Eleven Traveller`
  String get txt_eleven_traveler {
    return Intl.message(
      'Eleven Traveller',
      name: 'txt_eleven_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Twelve Traveller`
  String get txt_twelve_traveler {
    return Intl.message(
      'Twelve Traveller',
      name: 'txt_twelve_traveler',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth*`
  String get txt_date_of_birth_mandatory {
    return Intl.message(
      'Date of Birth*',
      name: 'txt_date_of_birth_mandatory',
      desc: '',
      args: [],
    );
  }

  /// `Invalid ID card Number`
  String get msg_invalid_id_card_number {
    return Intl.message(
      'Invalid ID card Number',
      name: 'msg_invalid_id_card_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid ID card Number`
  String get msg_please_enter_a_valid_id_card_number {
    return Intl.message(
      'Please enter a valid ID card Number',
      name: 'msg_please_enter_a_valid_id_card_number',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Code`
  String get msg_invalid_code {
    return Intl.message(
      'Invalid Code',
      name: 'msg_invalid_code',
      desc: '',
      args: [],
    );
  }

  /// `Email*`
  String get txt_email_mandatory {
    return Intl.message(
      'Email*',
      name: 'txt_email_mandatory',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get txt_enter_email_hint {
    return Intl.message(
      'Enter email',
      name: 'txt_enter_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get btn_remove {
    return Intl.message(
      'Remove',
      name: 'btn_remove',
      desc: '',
      args: [],
    );
  }

  /// `Add traveller`
  String get txt_add_traveler {
    return Intl.message(
      'Add traveller',
      name: 'txt_add_traveler',
      desc: '',
      args: [],
    );
  }

  /// `HK${money}`
  String txt_hong_kong_money(String money) {
    return Intl.message(
      'HK\$$money',
      name: 'txt_hong_kong_money',
      desc: '',
      args: [money],
    );
  }

  /// `Emergency Accident`
  String get txt_emergency_accident {
    return Intl.message(
      'Emergency Accident',
      name: 'txt_emergency_accident',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get txt_recommended {
    return Intl.message(
      'Recommended',
      name: 'txt_recommended',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get txt_see_all {
    return Intl.message(
      'See all',
      name: 'txt_see_all',
      desc: '',
      args: [],
    );
  }

  /// `see more`
  String get txt_see_more {
    return Intl.message(
      'see more',
      name: 'txt_see_more',
      desc: '',
      args: [],
    );
  }

  /// `The`
  String get txt_the {
    return Intl.message(
      'The',
      name: 'txt_the',
      desc: '',
      args: [],
    );
  }

  /// `is available for you to read here. If you want to learn how Lyla decided which bundles to include alongside the Base Plan as well as the add-ons you can select, you can read about it in our FAQ.`
  String get txt_quote_detail_policy {
    return Intl.message(
      'is available for you to read here. If you want to learn how Lyla decided which bundles to include alongside the Base Plan as well as the add-ons you can select, you can read about it in our FAQ.',
      name: 'txt_quote_detail_policy',
      desc: '',
      args: [],
    );
  }

  /// `Access your policy anytime, no internet access required.`
  String get txt_policy_anytime {
    return Intl.message(
      'Access your policy anytime, no internet access required.',
      name: 'txt_policy_anytime',
      desc: '',
      args: [],
    );
  }

  /// `Submit a claim in no time at all and track its progress.`
  String get txt_submit_a_claim {
    return Intl.message(
      'Submit a claim in no time at all and track its progress.',
      name: 'txt_submit_a_claim',
      desc: '',
      args: [],
    );
  }

  /// `Use our Flight delay cover that automatically pays out on any flight delays that affect you`
  String get txt_human_support {
    return Intl.message(
      'Use our Flight delay cover that automatically pays out on any flight delays that affect you',
      name: 'txt_human_support',
      desc: '',
      args: [],
    );
  }

  /// `Time to download our mobile app`
  String get txt_time_to_download_our_mobile_app {
    return Intl.message(
      'Time to download our mobile app',
      name: 'txt_time_to_download_our_mobile_app',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get btn_done {
    return Intl.message(
      'Done',
      name: 'btn_done',
      desc: '',
      args: [],
    );
  }

  /// `Give us a share:`
  String get txt_give_us_a_share {
    return Intl.message(
      'Give us a share:',
      name: 'txt_give_us_a_share',
      desc: '',
      args: [],
    );
  }

  /// `Refer a friend, get paid`
  String get txt_refer_friend_desktop {
    return Intl.message(
      'Refer a friend, get paid',
      name: 'txt_refer_friend_desktop',
      desc: '',
      args: [],
    );
  }

  /// `Refer a friend,\nget paid`
  String get txt_refer_friend_mobile {
    return Intl.message(
      'Refer a friend,\nget paid',
      name: 'txt_refer_friend_mobile',
      desc: '',
      args: [],
    );
  }

  /// `For every friend you refer you get $50 refunded back instantly. And they get $50 off their policy. Go crazy. Refer as many friends as you like until your policy is free.`
  String get txt_every_friend {
    return Intl.message(
      'For every friend you refer you get \$50 refunded back instantly. And they get \$50 off their policy. Go crazy. Refer as many friends as you like until your policy is free.',
      name: 'txt_every_friend',
      desc: '',
      args: [],
    );
  }

  /// `Share the link below and they can buy their policy in no time at all.`
  String get txt_link_below {
    return Intl.message(
      'Share the link below and they can buy their policy in no time at all.',
      name: 'txt_link_below',
      desc: '',
      args: [],
    );
  }

  /// `Here's how it works:`
  String get txt_how_it_works {
    return Intl.message(
      'Here\'s how it works:',
      name: 'txt_how_it_works',
      desc: '',
      args: [],
    );
  }

  /// `You share your link with a friend`
  String get txt_you_share_your_link_with_a_friend {
    return Intl.message(
      'You share your link with a friend',
      name: 'txt_you_share_your_link_with_a_friend',
      desc: '',
      args: [],
    );
  }

  /// `A friend buys a policy using the link`
  String get txt_a_friend_buys_a_policy_using_the_link {
    return Intl.message(
      'A friend buys a policy using the link',
      name: 'txt_a_friend_buys_a_policy_using_the_link',
      desc: '',
      args: [],
    );
  }

  /// `Your friend gets a {money} discount off their policy`
  String txt_your_friend_gets_a_money_discount_off_their_policy(String money) {
    return Intl.message(
      'Your friend gets a $money discount off their policy',
      name: 'txt_your_friend_gets_a_money_discount_off_their_policy',
      desc: '',
      args: [money],
    );
  }

  /// `You instantly get {money} refunded off your policy`
  String txt_you_instantly_get_money_refunded_off_your_policy(String money) {
    return Intl.message(
      'You instantly get $money refunded off your policy',
      name: 'txt_you_instantly_get_money_refunded_off_your_policy',
      desc: '',
      args: [money],
    );
  }

  /// `Read more about the referral\ndiscounts with Lyla`
  String get txt_referral_about_mobile {
    return Intl.message(
      'Read more about the referral\ndiscounts with Lyla',
      name: 'txt_referral_about_mobile',
      desc: '',
      args: [],
    );
  }

  /// `Read more about the referral discounts with Lyla`
  String get txt_referral_about_desktop {
    return Intl.message(
      'Read more about the referral discounts with Lyla',
      name: 'txt_referral_about_desktop',
      desc: '',
      args: [],
    );
  }

  /// `Referral discount link`
  String get txt_referral_discount_link {
    return Intl.message(
      'Referral discount link',
      name: 'txt_referral_discount_link',
      desc: '',
      args: [],
    );
  }

  /// `Payment Information`
  String get txt_payment_information {
    return Intl.message(
      'Payment Information',
      name: 'txt_payment_information',
      desc: '',
      args: [],
    );
  }

  /// `Select your card`
  String get txt_select_your_card {
    return Intl.message(
      'Select your card',
      name: 'txt_select_your_card',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get txt_name {
    return Intl.message(
      'Name',
      name: 'txt_name',
      desc: '',
      args: [],
    );
  }

  /// `John Doe`
  String get txt_name_hint {
    return Intl.message(
      'John Doe',
      name: 'txt_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get txt_card_number {
    return Intl.message(
      'Card Number',
      name: 'txt_card_number',
      desc: '',
      args: [],
    );
  }

  /// `1234 5678 2468 1357`
  String get txt_card_number_hint {
    return Intl.message(
      '1234 5678 2468 1357',
      name: 'txt_card_number_hint',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get txt_cvv {
    return Intl.message(
      'CVV',
      name: 'txt_cvv',
      desc: '',
      args: [],
    );
  }

  /// `1234`
  String get txt_cvv_hint {
    return Intl.message(
      '1234',
      name: 'txt_cvv_hint',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get txt_expiration_date {
    return Intl.message(
      'Expiration Date',
      name: 'txt_expiration_date',
      desc: '',
      args: [],
    );
  }

  /// `08/2023`
  String get txt_expiration_date_hint {
    return Intl.message(
      '08/2023',
      name: 'txt_expiration_date_hint',
      desc: '',
      args: [],
    );
  }

  /// `Save credit card information`
  String get txt_save_credit_card_information {
    return Intl.message(
      'Save credit card information',
      name: 'txt_save_credit_card_information',
      desc: '',
      args: [],
    );
  }

  /// `Pay now`
  String get btn_pay_now {
    return Intl.message(
      'Pay now',
      name: 'btn_pay_now',
      desc: '',
      args: [],
    );
  }

  /// `Let's start payment`
  String get txt_lets_start_payment {
    return Intl.message(
      'Let\'s start payment',
      name: 'txt_lets_start_payment',
      desc: '',
      args: [],
    );
  }

  /// `How would you like to pay?`
  String get txt_how_would_you_like_to_pay {
    return Intl.message(
      'How would you like to pay?',
      name: 'txt_how_would_you_like_to_pay',
      desc: '',
      args: [],
    );
  }

  /// `Secure payments`
  String get txt_secure_payments {
    return Intl.message(
      'Secure payments',
      name: 'txt_secure_payments',
      desc: '',
      args: [],
    );
  }

  /// `Continue with`
  String get btn_continue_with {
    return Intl.message(
      'Continue with',
      name: 'btn_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Pay with`
  String get btn_pay_with {
    return Intl.message(
      'Pay with',
      name: 'btn_pay_with',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get txt_to {
    return Intl.message(
      'to',
      name: 'txt_to',
      desc: '',
      args: [],
    );
  }

  /// `email your quote`
  String get txt_email_your_quote {
    return Intl.message(
      'email your quote',
      name: 'txt_email_your_quote',
      desc: '',
      args: [],
    );
  }

  /// `Your quote`
  String get txt_your_quote {
    return Intl.message(
      'Your quote',
      name: 'txt_your_quote',
      desc: '',
      args: [],
    );
  }

  /// `You are a {countryName} resident. What we mean by “{countryName} resident”`
  String txt_policy_detail_one(String countryName) {
    return Intl.message(
      'You are a $countryName resident. What we mean by “$countryName resident”',
      name: 'txt_policy_detail_one',
      desc: '',
      args: [countryName],
    );
  }

  /// `You haven’t already started a trip you’d like cover for.`
  String get txt_policy_detail_two {
    return Intl.message(
      'You haven’t already started a trip you’d like cover for.',
      name: 'txt_policy_detail_two',
      desc: '',
      args: [],
    );
  }

  /// `You haven’t made more than 2 travel insurance claims in the past 3 years or had insurance refused, cancelled or had special terms imposed.`
  String get txt_policy_detail_three {
    return Intl.message(
      'You haven’t made more than 2 travel insurance claims in the past 3 years or had insurance refused, cancelled or had special terms imposed.',
      name: 'txt_policy_detail_three',
      desc: '',
      args: [],
    );
  }

  /// `Some boring, (but important), stuff before you checkout.`
  String get txt_some_but_important_boring_stuff_before_you {
    return Intl.message(
      'Some boring, (but important), stuff before you checkout.',
      name: 'txt_some_but_important_boring_stuff_before_you',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm the following is true:`
  String get txt_please_confirm_the_following_is_true {
    return Intl.message(
      'Please confirm the following is true:',
      name: 'txt_please_confirm_the_following_is_true',
      desc: '',
      args: [],
    );
  }

  /// `I confirm the above is true`
  String get txt_i_confirm_the_above_is_true {
    return Intl.message(
      'I confirm the above is true',
      name: 'txt_i_confirm_the_above_is_true',
      desc: '',
      args: [],
    );
  }

  /// `Exciting documents to acknowledge:`
  String get txt_exciting_documents_to_acknowledge {
    return Intl.message(
      'Exciting documents to acknowledge:',
      name: 'txt_exciting_documents_to_acknowledge',
      desc: '',
      args: [],
    );
  }

  /// `Read Terms & Conditions`
  String get txt_read_terms_and_conditions {
    return Intl.message(
      'Read Terms & Conditions',
      name: 'txt_read_terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Read Privacy Policy`
  String get txt_read_privacy_policy {
    return Intl.message(
      'Read Privacy Policy',
      name: 'txt_read_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `I accept the T&Cs and Privacy Policy`
  String get txt_i_accept_the_tcs_and_privacy_policy {
    return Intl.message(
      'I accept the T&Cs and Privacy Policy',
      name: 'txt_i_accept_the_tcs_and_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Proceed to payment`
  String get btn_proceed_to_payment {
    return Intl.message(
      'Proceed to payment',
      name: 'btn_proceed_to_payment',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get txt_skip {
    return Intl.message(
      'Skip',
      name: 'txt_skip',
      desc: '',
      args: [],
    );
  }

  /// `Personal and trip coverage details`
  String get txt_personal_and_trip_coverage_details {
    return Intl.message(
      'Personal and trip coverage details',
      name: 'txt_personal_and_trip_coverage_details',
      desc: '',
      args: [],
    );
  }

  /// `2 Traveller Name:`
  String get txt_2nd_traveller_name {
    return Intl.message(
      '2 Traveller Name:',
      name: 'txt_2nd_traveller_name',
      desc: '',
      args: [],
    );
  }

  /// `Traveller Name:`
  String get txt_traveller_name {
    return Intl.message(
      'Traveller Name:',
      name: 'txt_traveller_name',
      desc: '',
      args: [],
    );
  }

  /// `is available for you to`
  String get txt_is_available_for_you_to {
    return Intl.message(
      'is available for you to',
      name: 'txt_is_available_for_you_to',
      desc: '',
      args: [],
    );
  }

  /// `read here`
  String get txt_read_here {
    return Intl.message(
      'read here',
      name: 'txt_read_here',
      desc: '',
      args: [],
    );
  }

  /// `If you want to learn how Lyla decided which bundles to include alongside the Base Plan as well as the add-ons you can select, you can read about it in our FAQ`
  String get txt_if_you_want_to_learn {
    return Intl.message(
      'If you want to learn how Lyla decided which bundles to include alongside the Base Plan as well as the add-ons you can select, you can read about it in our FAQ',
      name: 'txt_if_you_want_to_learn',
      desc: '',
      args: [],
    );
  }

  /// `Purchase cover for`
  String get txt_purchase_cover_for {
    return Intl.message(
      'Purchase cover for',
      name: 'txt_purchase_cover_for',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to add gadget cover?`
  String get txt_would_you_like_to_add_gadget_cover {
    return Intl.message(
      'Would you like to add gadget cover?',
      name: 'txt_would_you_like_to_add_gadget_cover',
      desc: '',
      args: [],
    );
  }

  /// `Yes, I’d like to cover HK$10,000 worth of gadgets (HKD$150.00)`
  String get txt_gadget_answer {
    return Intl.message(
      'Yes, I’d like to cover HK\$10,000 worth of gadgets (HKD\$150.00)',
      name: 'txt_gadget_answer',
      desc: '',
      args: [],
    );
  }

  /// `Accidental or malicious damage`
  String get txt_accidental_or_malicious_damage {
    return Intl.message(
      'Accidental or malicious damage',
      name: 'txt_accidental_or_malicious_damage',
      desc: '',
      args: [],
    );
  }

  /// `This cover is available for an unlimited number of gadgets to provide cover for:`
  String get txt_unlimited_number {
    return Intl.message(
      'This cover is available for an unlimited number of gadgets to provide cover for:',
      name: 'txt_unlimited_number',
      desc: '',
      args: [],
    );
  }

  /// `Cover for course closure up to £1500`
  String get txt_cover_for_course_closure_up_to_1500 {
    return Intl.message(
      'Cover for course closure up to £1500',
      name: 'txt_cover_for_course_closure_up_to_1500',
      desc: '',
      args: [],
    );
  }

  /// `Benefits of this cover are per person and include:`
  String get txt_benefits_of_this_cover_are_per_person_and_include {
    return Intl.message(
      'Benefits of this cover are per person and include:',
      name: 'txt_benefits_of_this_cover_are_per_person_and_include',
      desc: '',
      args: [],
    );
  }

  /// `all law costs awarded to any claimant or incurred in the defence of any claim that is contested by us or with our consent.`
  String get txt_law_cost {
    return Intl.message(
      'all law costs awarded to any claimant or incurred in the defence of any claim that is contested by us or with our consent.',
      name: 'txt_law_cost',
      desc: '',
      args: [],
    );
  }

  /// `This option provides up to HK${money} protection against any incident for which you become legally liable for during your journey, to cover:`
  String txt_personal_liabilities_with_money(String money) {
    return Intl.message(
      'This option provides up to HK\$$money protection against any incident for which you become legally liable for during your journey, to cover:',
      name: 'txt_personal_liabilities_with_money',
      desc: '',
      args: [money],
    );
  }

  /// `Skiing and snowboarding in ski resorts`
  String get txt_skiing_and_snowboarding_in_ski_resorts {
    return Intl.message(
      'Skiing and snowboarding in ski resorts',
      name: 'txt_skiing_and_snowboarding_in_ski_resorts',
      desc: '',
      args: [],
    );
  }

  /// `Coverage for medical expenses if you become injured while participating in winter sports as defined in the plan on the same basis as all other injuries.`
  String get txt_winter_sports {
    return Intl.message(
      'Coverage for medical expenses if you become injured while participating in winter sports as defined in the plan on the same basis as all other injuries.',
      name: 'txt_winter_sports',
      desc: '',
      args: [],
    );
  }

  /// `B.A.S.E. jumping, Cliff diving`
  String get txt_jumping_cliff {
    return Intl.message(
      'B.A.S.E. jumping, Cliff diving',
      name: 'txt_jumping_cliff',
      desc: '',
      args: [],
    );
  }

  /// `Coverage for medical expenses if you become injured while participating in adventure or extreme sports as defined  in the plan on the same basis as all other injuries.`
  String get txt_adventure_sports_protection {
    return Intl.message(
      'Coverage for medical expenses if you become injured while participating in adventure or extreme sports as defined  in the plan on the same basis as all other injuries.',
      name: 'txt_adventure_sports_protection',
      desc: '',
      args: [],
    );
  }

  /// `Be reimbursed up to HK$[Insert amount] in repair/replacement costs if you accidentally damage the rental you're staying in, or its contents, while in-trip.`
  String get txt_rental_vacation {
    return Intl.message(
      'Be reimbursed up to HK\$[Insert amount] in repair/replacement costs if you accidentally damage the rental you\'re staying in, or its contents, while in-trip.',
      name: 'txt_rental_vacation',
      desc: '',
      args: [],
    );
  }

  /// `No Page Found`
  String get txt_no_page_found {
    return Intl.message(
      'No Page Found',
      name: 'txt_no_page_found',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get msg_error_something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'msg_error_something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `No Internet connection`
  String get msg_error_no_internet_connection {
    return Intl.message(
      'No Internet connection',
      name: 'msg_error_no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a mobile number`
  String get msg_error_please_enter_a_mobile_number {
    return Intl.message(
      'Please enter a mobile number',
      name: 'msg_error_please_enter_a_mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `No more then 90 days`
  String get msg_error_no_more_then_90_days {
    return Intl.message(
      'No more then 90 days',
      name: 'msg_error_no_more_then_90_days',
      desc: '',
      args: [],
    );
  }

  /// `Can't choose date`
  String get msg_error_cant_choose_date {
    return Intl.message(
      'Can\'t choose date',
      name: 'msg_error_cant_choose_date',
      desc: '',
      args: [],
    );
  }

  /// `Rental car care`
  String get txt_rental_car_care {
    return Intl.message(
      'Rental car care',
      name: 'txt_rental_car_care',
      desc: '',
      args: [],
    );
  }

  /// `Be reimbursed up to HK$400K in accidental damage and theft related to your rental vehicle.`
  String get txt_accidental_damage {
    return Intl.message(
      'Be reimbursed up to HK\$400K in accidental damage and theft related to your rental vehicle.',
      name: 'txt_accidental_damage',
      desc: '',
      args: [],
    );
  }

  /// `Please choose until date after from date`
  String get msg_error_please_choose_until_date_after_from_date {
    return Intl.message(
      'Please choose until date after from date',
      name: 'msg_error_please_choose_until_date_after_from_date',
      desc: '',
      args: [],
    );
  }

  /// `Enter number`
  String get txt_enter_number_hint {
    return Intl.message(
      'Enter number',
      name: 'txt_enter_number_hint',
      desc: '',
      args: [],
    );
  }

  /// `Mobile*`
  String get txt_mobile_mandatory {
    return Intl.message(
      'Mobile*',
      name: 'txt_mobile_mandatory',
      desc: '',
      args: [],
    );
  }

  /// `Title*`
  String get txt_title_mandatory {
    return Intl.message(
      'Title*',
      name: 'txt_title_mandatory',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get txt_basic_information {
    return Intl.message(
      'Basic Information',
      name: 'txt_basic_information',
      desc: '',
      args: [],
    );
  }

  /// `Travel insurance with multiple cover extensions`
  String get txt_travel_insurance_with_multiple_cover_extensions {
    return Intl.message(
      'Travel insurance with multiple cover extensions',
      name: 'txt_travel_insurance_with_multiple_cover_extensions',
      desc: '',
      args: [],
    );
  }

  /// `Flexibility to dynamically tailor protection and price`
  String get txt_flexibility_to_dynamically_tailor_protection_and_price {
    return Intl.message(
      'Flexibility to dynamically tailor protection and price',
      name: 'txt_flexibility_to_dynamically_tailor_protection_and_price',
      desc: '',
      args: [],
    );
  }

  /// `Easy self-service options to buy and manage insurance`
  String get txt_easy_self_service_options_to_buy_and_manage_insurance {
    return Intl.message(
      'Easy self-service options to buy and manage insurance',
      name: 'txt_easy_self_service_options_to_buy_and_manage_insurance',
      desc: '',
      args: [],
    );
  }

  /// `One app for all your travel insurance needs`
  String get txt_one_app_for_all_your_travel_insurance_needs {
    return Intl.message(
      'One app for all your travel insurance needs',
      name: 'txt_one_app_for_all_your_travel_insurance_needs',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sourced from multiple insurers a range of polices that can\nbe  personalized for your requirements`
  String get txt_covered_description {
    return Intl.message(
      'We’ve sourced from multiple insurers a range of polices that can\nbe  personalized for your requirements',
      name: 'txt_covered_description',
      desc: '',
      args: [],
    );
  }

  /// `Checking pricing and coverage`
  String get btn_checking_pricing_and_coverage {
    return Intl.message(
      'Checking pricing and coverage',
      name: 'btn_checking_pricing_and_coverage',
      desc: '',
      args: [],
    );
  }

  /// `Which policy is right for you`
  String get txt_which_policy_is_right_for_you {
    return Intl.message(
      'Which policy is right for you',
      name: 'txt_which_policy_is_right_for_you',
      desc: '',
      args: [],
    );
  }

  /// `The right insurance for you depends on how long you are travelling for, who\nwith, and what your travel itinerary is like`
  String get txt_policy_is_right_for_you_description {
    return Intl.message(
      'The right insurance for you depends on how long you are travelling for, who\nwith, and what your travel itinerary is like',
      name: 'txt_policy_is_right_for_you_description',
      desc: '',
      args: [],
    );
  }

  /// `How to get cheaper travel insurance`
  String get txt_how_to_get_cheaper_travel_insurance {
    return Intl.message(
      'How to get cheaper travel insurance',
      name: 'txt_how_to_get_cheaper_travel_insurance',
      desc: '',
      args: [],
    );
  }

  /// `Cheaper travel insurance isn’t always the best, but there are steps you can do to ensure you’ve\ngot the most appropriate cover for yourself and not pay for coverage you don’t need`
  String get txt_cheaper_travel_insurance_description {
    return Intl.message(
      'Cheaper travel insurance isn’t always the best, but there are steps you can do to ensure you’ve\ngot the most appropriate cover for yourself and not pay for coverage you don’t need',
      name: 'txt_cheaper_travel_insurance_description',
      desc: '',
      args: [],
    );
  }

  /// `Ready to check out what’s on offer? Next steps are.`
  String get txt_ready_to_check_out_what_on_offer {
    return Intl.message(
      'Ready to check out what’s on offer? Next steps are.',
      name: 'txt_ready_to_check_out_what_on_offer',
      desc: '',
      args: [],
    );
  }

  /// `The right insurance for you depends on how long you are travelling for, who with, and what your travel itinerary is like`
  String get txt_offer_description {
    return Intl.message(
      'The right insurance for you depends on how long you are travelling for, who with, and what your travel itinerary is like',
      name: 'txt_offer_description',
      desc: '',
      args: [],
    );
  }

  /// `Oh no, payment failed`
  String get title_payment_failed {
    return Intl.message(
      'Oh no, payment failed',
      name: 'title_payment_failed',
      desc: '',
      args: [],
    );
  }

  /// `Your payment has failed. Please close this pop-up and try again. Should the problem persist, please contact help@withlyla.com`
  String get description_payment_failed {
    return Intl.message(
      'Your payment has failed. Please close this pop-up and try again. Should the problem persist, please contact help@withlyla.com',
      name: 'description_payment_failed',
      desc: '',
      args: [],
    );
  }

  /// `We'd love to hear from you`
  String get lbl_contact_us {
    return Intl.message(
      'We\'d love to hear from you',
      name: 'lbl_contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get lbl_contact_us_2 {
    return Intl.message(
      'Contact us',
      name: 'lbl_contact_us_2',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get lbl_contact_us_phone {
    return Intl.message(
      'Phone',
      name: 'lbl_contact_us_phone',
      desc: '',
      args: [],
    );
  }

  /// `Monday to Friday (except public holidays)`
  String get lbl_contact_us_monday_friday {
    return Intl.message(
      'Monday to Friday (except public holidays)',
      name: 'lbl_contact_us_monday_friday',
      desc: '',
      args: [],
    );
  }

  /// `9am - 6 pm:`
  String get lbl_contact_us_9_6 {
    return Intl.message(
      '9am - 6 pm:',
      name: 'lbl_contact_us_9_6',
      desc: '',
      args: [],
    );
  }

  /// `International: `
  String get lbl_contact_us_international {
    return Intl.message(
      'International: ',
      name: 'lbl_contact_us_international',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get lbl_contact_us_email {
    return Intl.message(
      'Email',
      name: 'lbl_contact_us_email',
      desc: '',
      args: [],
    );
  }

  /// `For pre-trip or during trip questions:`
  String get lbl_contact_us_pre_trip {
    return Intl.message(
      'For pre-trip or during trip questions:',
      name: 'lbl_contact_us_pre_trip',
      desc: '',
      args: [],
    );
  }

  /// `For claims:`
  String get lbl_contact_us_for_claims {
    return Intl.message(
      'For claims:',
      name: 'lbl_contact_us_for_claims',
      desc: '',
      args: [],
    );
  }

  /// `Travel and insurance advisors:`
  String get lbl_contact_us_advisors {
    return Intl.message(
      'Travel and insurance advisors:',
      name: 'lbl_contact_us_advisors',
      desc: '',
      args: [],
    );
  }

  /// `Partnerships and collaborations:`
  String get lbl_contact_us_partnership {
    return Intl.message(
      'Partnerships and collaborations:',
      name: 'lbl_contact_us_partnership',
      desc: '',
      args: [],
    );
  }

  /// `© 2024 Travelbox Tech Limited. All rights reserved.`
  String get lbl_contact_us_copyright {
    return Intl.message(
      '© 2024 Travelbox Tech Limited. All rights reserved.',
      name: 'lbl_contact_us_copyright',
      desc: '',
      args: [],
    );
  }

  /// `Please note quotes are only available for residents of the Hong Kong and for trips which start from Hong Kong.`
  String get lbl_contact_us_copyright_2 {
    return Intl.message(
      'Please note quotes are only available for residents of the Hong Kong and for trips which start from Hong Kong.',
      name: 'lbl_contact_us_copyright_2',
      desc: '',
      args: [],
    );
  }

  /// `Lyla is the brand owned by Travelbox Tech Limited (registered in Hong Kong under company number CR3105973), working in partnership with i-Brokers Limited, an authorized insurance broker with Insurance Authority License Number FB1831, whose business it is to help find the right cover, arrange insurance products and services for its clients.`
  String get lbl_contact_us_copyright_3 {
    return Intl.message(
      'Lyla is the brand owned by Travelbox Tech Limited (registered in Hong Kong under company number CR3105973), working in partnership with i-Brokers Limited, an authorized insurance broker with Insurance Authority License Number FB1831, whose business it is to help find the right cover, arrange insurance products and services for its clients.',
      name: 'lbl_contact_us_copyright_3',
      desc: '',
      args: [],
    );
  }

  /// `Our`
  String get txt_our {
    return Intl.message(
      'Our',
      name: 'txt_our',
      desc: '',
      args: [],
    );
  }

  /// `apply`
  String get txt_apply {
    return Intl.message(
      'apply',
      name: 'txt_apply',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get txt_termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'txt_termsConditions',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
