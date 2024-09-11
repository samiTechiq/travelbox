

void main() {
  // late final StartEndPickerViewModel startEndPickerViewModel;
  // late final CoverQuoteViewModel coverQuoteViewModel;
  // late final Navigation navigation;
  // late final LoginViewmodel loginViewmodel;
  //
  // registerStub() {
  //   when(startEndPickerViewModel.startDate)
  //       .thenAnswer((realInvocation) => DateTime(2010));
  // }
  //
  // setUpAll(() {
  //   coverQuoteViewModel = MockCoverQuoteViewModel();
  //   startEndPickerViewModel = MockStartEndPickerViewModel();
  //   navigation = MockNavigation();
  //   loginViewmodel = MockLoginViewmodel();
  //
  //   sl.registerLazySingleton<StartEndPickerViewModel>(
  //       () => startEndPickerViewModel);
  //   sl.registerLazySingleton<CoverQuoteViewModel>(() => coverQuoteViewModel);
  //   sl.registerLazySingleton<Navigation>(() => navigation);
  //   sl.registerLazySingleton<LoginViewmodel>(() => loginViewmodel);
  //
  //   registerStub();
  // });
  //
  // testWidgets('check is button enabled until value is true',
  //     (WidgetTester tester) async {
  //   when(startEndPickerViewModel.isButtonEnabled()).thenReturn(true);
  //   when(coverQuoteViewModel.timeframeSelected)
  //       .thenAnswer((realInvocation) => AvailableCoversTimeFrame.annual);
  //   await tester.setScreenSize(width: 600);
  //   await tester.setResources();
  //
  //   await tester.testAppForWidgetTesting(const PickerScreen());
  //   final button = find.byKey(const ValueKey("button_container"));
  //   expect(tester.widget<GestureDetector>(button).onTap, isNotNull);
  // });
  //
  // testWidgets('check is button enabled until value is true',
  //     (WidgetTester tester) async {
  //   when(startEndPickerViewModel.isButtonEnabled()).thenReturn(true);
  //   when(coverQuoteViewModel.timeframeSelected)
  //       .thenAnswer((realInvocation) => AvailableCoversTimeFrame.single);
  //   await tester.setScreenSize(width: 600);
  //   await tester.setResources();
  //
  //   await tester.testAppForWidgetTesting(const PickerScreen());
  //   final button = find.byKey(const ValueKey("button_container"));
  //   expect(tester.widget<InkWell>(button).onTap, isNotNull);
  // });
  //
  // testWidgets('check is button disable until value not true',
  //     (WidgetTester tester) async {
  //   when(startEndPickerViewModel.isButtonEnabled()).thenReturn(false);
  //   when(coverQuoteViewModel.timeframeSelected)
  //       .thenAnswer((realInvocation) => AvailableCoversTimeFrame.annual);
  //   await tester.setScreenSize();
  //   await tester.setResources();
  //   await tester.testAppForWidgetTesting(const PickerScreen());
  //   final button = find.byKey(const ValueKey("button_container"));
  //   expect(tester.widget<InkWell>(button).onTap, isNull);
  // });
}
