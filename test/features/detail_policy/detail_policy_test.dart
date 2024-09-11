

void main() {
  // late final Validator validator;
  // late final QuoteDetailViewModel viewModel;
  // late final BasicInfoViewModel basicInfoViewModel;
  // late final CoverQuoteViewModel coverQuoteViewModel;
  // late final StartEndPickerViewModel startEndPickerViewModel;
  // late final CoverDetailViewModel coverDetailViewModel;
  // late final BothCoverDetailViewModel bothCoveredDetailsViewModel;
  // late final SecondTravelCoverDetailsViewModel
  //     secondTravelCoverDetailsViewModel;
  // late final FamilyGroupCoverDetailViewModel familyGroupCoverDetailViewModel;
  // late final LoginViewmodel loginViewmodel;
  //
  // void registerViewModel() {
  //   sl.registerLazySingleton<Validator>(() => validator);
  //   sl.registerLazySingleton<QuoteDetailViewModel>(() => viewModel);
  //   sl.registerLazySingleton<FamilyGroupCoverDetailViewModel>(
  //       () => familyGroupCoverDetailViewModel);
  //   sl.registerLazySingleton<StartEndPickerViewModel>(
  //       () => startEndPickerViewModel);
  //   sl.registerLazySingleton<CoverDetailViewModel>(() => coverDetailViewModel);
  //   sl.registerLazySingleton<CoverQuoteViewModel>(() => coverQuoteViewModel);
  //   sl.registerLazySingleton<BasicInfoViewModel>(() => basicInfoViewModel);
  //   sl.registerLazySingleton<SecondTravelCoverDetailsViewModel>(
  //       () => secondTravelCoverDetailsViewModel);
  //   sl.registerLazySingleton<BothCoverDetailViewModel>(
  //       () => bothCoveredDetailsViewModel);
  //   sl.registerLazySingleton<LoginViewmodel>(() => loginViewmodel);
  //
  //   when(viewModel.currency).thenAnswer((realInvocation) => 'HKD');
  //   when(viewModel.totalPrice).thenAnswer((realInvocation) => 100);
  //   when(viewModel.order).thenAnswer((realInvocation) => OrderModel());
  //   when(basicInfoViewModel.firstName).thenAnswer((realInvocation) => 'Ahmad');
  //   when(basicInfoViewModel.surname).thenAnswer((realInvocation) => 'hassan');
  //   when(coverQuoteViewModel.timeframeSelected)
  //       .thenAnswer((realInvocation) => AvailableCoversTimeFrame.single);
  //   when(coverQuoteViewModel.selectedCountry).thenAnswer((realInvocation) =>
  //       CountryData('Pakistan', code: '', flag: ''));
  //   when(startEndPickerViewModel.startDate)
  //       .thenAnswer((realInvocation) => DateTime(2021, 10, 10));
  //   when(startEndPickerViewModel.endDate)
  //       .thenAnswer((realInvocation) => DateTime(2021, 10, 20));
  //   when(coverDetailViewModel.dateOfBirth)
  //       .thenAnswer((realInvocation) => '01/01/2010');
  //   when(secondTravelCoverDetailsViewModel.firstNameController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: "ahmad"));
  //   when(secondTravelCoverDetailsViewModel.lastNameController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: "hasan"));
  //   when(bothCoveredDetailsViewModel.dateOfBirth)
  //       .thenAnswer((realInvocation) => '01/01/2012');
  //   when(secondTravelCoverDetailsViewModel.dateOfBirth)
  //       .thenAnswer((realInvocation) => '01/01/2012');
  //   when(familyGroupCoverDetailViewModel.attendee)
  //       .thenAnswer((realInvocation) => []);
  // }
  //
  // setUpAll(() {
  //   validator = MockValidator();
  //   viewModel = MockQuoteDetailViewModel();
  //   basicInfoViewModel = MockBasicInfoViewModel();
  //   startEndPickerViewModel = MockStartEndPickerViewModel();
  //   coverQuoteViewModel = MockCoverQuoteViewModel();
  //   coverDetailViewModel = MockCoverDetailViewModel();
  //   bothCoveredDetailsViewModel = MockBothCoverDetailViewModel();
  //   secondTravelCoverDetailsViewModel = MockSecondTravelCoverDetailsViewModel();
  //   familyGroupCoverDetailViewModel = MockFamilyGroupCoverDetailViewModel();
  //   loginViewmodel = MockLoginViewmodel();
  //
  //   registerViewModel();
  // });
  //
  // testWidgets('verify that user can click on button', (tester) async {
  //   await tester.setScreenSize(
  //     height: 1000,
  //     width: 600,
  //   );
  //   await tester.setResources();
  //   await tester.testAppForWidgetTesting(const DetailPolicyScreen());
  //   final button = find.byKey(const ValueKey("button_container"));
  //   expect(tester.widget<InkWell>(button).onTap, isNotNull);
  // });
}
