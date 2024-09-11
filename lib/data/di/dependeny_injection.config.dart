// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i28;
import 'package:dio/dio.dart' as _i25;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i30;
import 'package:logger/logger.dart' as _i29;
import 'package:travelbox/data/data_source/adyen/adyen_data_source_imp.dart'
    as _i43;
import 'package:travelbox/data/data_source/network_connection/network_connection_imp.dart'
    as _i41;
import 'package:travelbox/data/data_source/remote_data_source/remote_data_source_imp.dart'
    as _i45;
import 'package:travelbox/data/di/register_modules.dart' as _i64;
import 'package:travelbox/data/mapper/connection_type_mapper.dart' as _i33;
import 'package:travelbox/data/repository/adyen_repository/adyen_repository_imp.dart'
    as _i47;
import 'package:travelbox/data/repository/repository_imp.dart' as _i49;
import 'package:travelbox/domain/data_source/adyen/adyen_data_source.dart'
    as _i42;
import 'package:travelbox/domain/data_source/network_connection/network_connection.dart'
    as _i40;
import 'package:travelbox/domain/data_source/remote/remote_data_source.dart'
    as _i44;
import 'package:travelbox/domain/mapper/mapper.dart' as _i31;
import 'package:travelbox/domain/model/connection_type/connection_type.dart'
    as _i32;
import 'package:travelbox/domain/network/network.dart' as _i35;
import 'package:travelbox/domain/network/network_imp.dart' as _i36;
import 'package:travelbox/domain/repository/adyen_repository/adyen_repository.dart'
    as _i46;
import 'package:travelbox/domain/repository/repository.dart' as _i48;
import 'package:travelbox/features/account_settings/viewmodel/account_settings_viewmodel.dart'
    as _i15;
import 'package:travelbox/features/change_language/viewmodel/change_language_viewmodel.dart'
    as _i6;
import 'package:travelbox/features/check_email/viewmodel/check_mail_viewmodel.dart'
    as _i13;
import 'package:travelbox/features/cover_quote/usecase/cover_usecase.dart'
    as _i52;
import 'package:travelbox/features/cover_quote/usecase/get_counties_usecase.dart'
    as _i51;
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart'
    as _i61;
import 'package:travelbox/features/forgot_password/viewmodel/forgot_password_viewmodel.dart'
    as _i8;
import 'package:travelbox/features/home/viewmodel/home_viewmodel.dart' as _i5;
import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart'
    as _i18;
import 'package:travelbox/features/notifications/viewmodel/notifications_viewmodel.dart'
    as _i17;
import 'package:travelbox/features/onboarding/viewmodel/onboarding_viewmodel.dart'
    as _i19;
import 'package:travelbox/features/otp/view_model/otp_viewmodel.dart' as _i10;
import 'package:travelbox/features/payment/usecase/get_payment_methods_usecase.dart'
    as _i56;
import 'package:travelbox/features/payment/usecase/make_payment_usecase.dart'
    as _i55;
import 'package:travelbox/features/payment/viewmodel/payment_information_screen_viewmodel.dart'
    as _i62;
import 'package:travelbox/features/personal_detail/viewmodel/personal_detail_viewmodel.dart'
    as _i12;
import 'package:travelbox/features/policy_confirm/viewmodel/policy_confirm_viewmodel.dart'
    as _i4;
import 'package:travelbox/features/preferences/viewmodel/preferences_viewmodel.dart'
    as _i7;
import 'package:travelbox/features/profile/viewmodel/profile_view_model.dart'
    as _i14;
import 'package:travelbox/features/questions/usecase/get_quote_usecase.dart'
    as _i54;
import 'package:travelbox/features/questions/viewmodel/common_quote_viewmodel.dart'
    as _i20;
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart'
    as _i21;
import 'package:travelbox/features/questions/views/basic_info/usecase/basic_info_usecase.dart'
    as _i53;
import 'package:travelbox/features/questions/views/basic_info/viewmodel/basic_info_viewmodel.dart'
    as _i23;
import 'package:travelbox/features/questions/views/both_cover_detail/viewmodel/both_cover_detail_viewmodel.dart'
    as _i24;
import 'package:travelbox/features/questions/views/cover_details/viewmodel/cover_detail_viewmodel.dart'
    as _i60;
import 'package:travelbox/features/questions/views/cover_details/widgets/viewmodel/cover_detail_card_fields_viewmodel.dart'
    as _i3;
import 'package:travelbox/features/questions/views/family_group_cover_details/viewmodel/family_cover_detail_viewmodel.dart'
    as _i58;
import 'package:travelbox/features/questions/views/second_traveler_detail/viewmodel/second_travel_cover_detail_viewmodel.dart'
    as _i59;
import 'package:travelbox/features/questions/views/start_end_picker_screen/viewmodel/start_end_picker_viewmodel.dart'
    as _i22;
import 'package:travelbox/features/quote_details/usecase/order_usecase.dart'
    as _i50;
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart'
    as _i57;
import 'package:travelbox/features/quote_more_detail/viewmodel/gadget_cover_viewmodel.dart'
    as _i11;
import 'package:travelbox/features/quote_purchase_details/viewmodel/quote_purchase_details_viewmodel.dart'
    as _i16;
import 'package:travelbox/features/security/viewmodel/security_viewmodel.dart'
    as _i9;
import 'package:travelbox/utils/core/go_router/routes_navigation.dart' as _i37;
import 'package:travelbox/utils/core/network_calls/injector/dio_injector.dart'
    as _i63;
import 'package:travelbox/utils/core/network_calls/wrapper/dio_wrapper/network_call_wrapper.dart'
    as _i39;
import 'package:travelbox/utils/core/network_calls/wrapper/dio_wrapper/wrapper_error_handler.dart'
    as _i38;
import 'package:travelbox/utils/core/store/common_shared_perferences.dart'
    as _i26;
import 'package:travelbox/utils/core/store/sdk_shared_preferences_impl.dart'
    as _i27;
import 'package:travelbox/utils/core/validator/validator.dart' as _i34;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final registerModules = _$RegisterModules();
    gh.factory<_i3.CoverDetailCardsFieldViewModel>(
        () => _i3.CoverDetailCardsFieldViewModel());
    gh.lazySingleton<_i4.PolicyConfirmViewModel>(
        () => _i4.PolicyConfirmViewModel());
    gh.lazySingleton<_i5.HomeViewModel>(() => _i5.HomeViewModel());
    gh.lazySingleton<_i6.ChangeLanguageViewModel>(
        () => _i6.ChangeLanguageViewModel());
    gh.lazySingleton<_i7.PreferencesViewmodel>(
        () => _i7.PreferencesViewmodel());
    gh.lazySingleton<_i8.ForgotPasswordViewModel>(
        () => _i8.ForgotPasswordViewModel());
    gh.lazySingleton<_i9.SecurityViewmodel>(() => _i9.SecurityViewmodel());
    gh.lazySingleton<_i10.OtpViewmodel>(() => _i10.OtpViewmodel());
    gh.lazySingleton<_i11.GadgetCoverViewModel>(
        () => _i11.GadgetCoverViewModel());
    gh.lazySingleton<_i12.PersonalDetailViewmodel>(
        () => _i12.PersonalDetailViewmodel());
    gh.lazySingleton<_i13.CheckMailViewmodel>(() => _i13.CheckMailViewmodel());
    gh.lazySingleton<_i14.ProfileViewModel>(() => _i14.ProfileViewModel());
    gh.lazySingleton<_i15.AccountSettingsViewmodel>(
        () => _i15.AccountSettingsViewmodel());
    gh.lazySingleton<_i16.QuotePurchaseDetailsViewmodel>(
        () => _i16.QuotePurchaseDetailsViewmodel());
    gh.lazySingleton<_i17.NotificationsViewmodel>(
        () => _i17.NotificationsViewmodel());
    gh.lazySingleton<_i18.LoginViewmodel>(() => _i18.LoginViewmodel());
    gh.lazySingleton<_i19.OnboardingViewModel>(
        () => _i19.OnboardingViewModel());
    gh.lazySingleton<_i20.QuoteData>(() => _i20.QuoteData());
    gh.lazySingleton<_i21.AttendingCustomerViewModel>(
        () => _i21.AttendingCustomerViewModel());
    gh.lazySingleton<_i22.StartEndPickerViewModel>(
        () => _i22.StartEndPickerViewModel());
    gh.lazySingleton<_i23.BasicInfoViewModel>(() => _i23.BasicInfoViewModel());
    gh.lazySingleton<_i24.BothCoverDetailViewModel>(
        () => _i24.BothCoverDetailViewModel());
    gh.lazySingleton<_i25.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i26.CommonSharedPreferences>(
        () => _i26.CommonSharedPreferences());
    gh.lazySingleton<_i27.SDKSharedPreferencesImpl>(
        () => _i27.SDKSharedPreferencesImpl());
    gh.lazySingleton<_i28.Connectivity>(() => registerModules.connectivity);
    gh.lazySingleton<_i29.Logger>(() => registerModules.logger);
    gh.lazySingleton<_i30.InternetConnection>(
        () => registerModules.internetConnectionChecker);
    gh.singleton<_i31.Mapper<_i28.ConnectivityResult, _i32.ConnectionType>>(
        () => _i33.ConnectionTypeMapper());
    gh.lazySingleton<_i34.Validator>(() => _i34.ValidatorImp());
    gh.lazySingleton<_i35.NetworkInfo>(() => _i36.NetworkInfoImp(
        internetConnectionChecker: gh<_i30.InternetConnection>()));
    gh.lazySingleton<_i37.Navigation>(() => _i37.NavigationImpl());
    gh.lazySingleton<_i38.ErrorHandler>(() => _i38.ErrorHandlerImpl());
    gh.lazySingleton<_i39.NetworkCallsWrapper>(() => _i39.DioWrapperImpl(
          dio: gh<_i25.Dio>(),
          logger: gh<_i29.Logger>(),
          errorHandler: gh<_i38.ErrorHandler>(),
        ));
    gh.singleton<_i40.NetworkConnection>(() => _i41.NetworkConnectionImpl(
          gh<_i28.Connectivity>(),
          gh<_i31.Mapper<_i28.ConnectivityResult, _i32.ConnectionType>>(),
        ));
    gh.lazySingleton<_i42.AdyenDataSource>(
        () => _i43.AdyenDataSourceImp(http: gh<_i39.NetworkCallsWrapper>()));
    gh.lazySingleton<_i44.RemoteDataSource>(
        () => _i45.RemoteDataSourceImp(http: gh<_i39.NetworkCallsWrapper>()));
    gh.lazySingleton<_i46.AdyenRepository>(
        () => _i47.AdyenRepositoryImp(gh<_i42.AdyenDataSource>()));
    gh.lazySingleton<_i48.Repository>(() => _i49.RepositoryImp(
          remoteDataSource: gh<_i44.RemoteDataSource>(),
          networkInfo: gh<_i35.NetworkInfo>(),
        ));
    gh.lazySingleton<_i50.GetOrderUsecase>(
        () => _i50.GetOrderUsecase(gh<_i48.Repository>()));
    gh.lazySingleton<_i51.GetCountriesUsecase>(
        () => _i51.GetCountriesUsecase(gh<_i48.Repository>()));
    gh.lazySingleton<_i52.GetCoverQuoteUseCase>(
        () => _i52.GetCoverQuoteUseCase(gh<_i48.Repository>()));
    gh.lazySingleton<_i53.BasicInfoUsecase>(
        () => _i53.BasicInfoUsecase(gh<_i48.Repository>()));
    gh.lazySingleton<_i54.GetQuoteUsecase>(
        () => _i54.GetQuoteUsecase(gh<_i48.Repository>()));
    gh.lazySingleton<_i55.MakePaymentUsecase>(
        () => _i55.MakePaymentUsecase(gh<_i46.AdyenRepository>()));
    gh.lazySingleton<_i56.GetPaymentMethodsUseCase>(
        () => _i56.GetPaymentMethodsUseCase(gh<_i46.AdyenRepository>()));
    gh.lazySingleton<_i57.QuoteDetailViewModel>(() =>
        _i57.QuoteDetailViewModel(getOrderUsecase: gh<_i50.GetOrderUsecase>()));
    gh.lazySingleton<_i58.FamilyGroupCoverDetailViewModel>(() =>
        _i58.FamilyGroupCoverDetailViewModel(
            getQuoteUseCase: gh<_i54.GetQuoteUsecase>()));
    gh.lazySingleton<_i59.SecondTravelCoverDetailsViewModel>(() =>
        _i59.SecondTravelCoverDetailsViewModel(
            getQuoteUseCase: gh<_i54.GetQuoteUsecase>()));
    gh.lazySingleton<_i60.CoverDetailViewModel>(() =>
        _i60.CoverDetailViewModel(getQuoteUseCase: gh<_i54.GetQuoteUsecase>()));
    gh.lazySingleton<_i61.CoverQuoteViewModel>(() => _i61.CoverQuoteViewModel(
          getCoverQuoteUseCase: gh<_i52.GetCoverQuoteUseCase>(),
          getCountriesUseCase: gh<_i51.GetCountriesUsecase>(),
        ));
    gh.lazySingleton<_i62.PaymentInformationScreenViewModel>(
        () => _i62.PaymentInformationScreenViewModel(
              getPaymentMethods: gh<_i56.GetPaymentMethodsUseCase>(),
              makePaymentUsecase: gh<_i55.MakePaymentUsecase>(),
            ));
    return this;
  }
}

class _$DioModule extends _i63.DioModule {}

class _$RegisterModules extends _i64.RegisterModules {}
