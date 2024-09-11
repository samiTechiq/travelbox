

void main() {
  // late final Validator validator;
  // late final SecondTravelCoverDetailsViewModel viewModel;
  // late final BasicInfoViewModel basicInfoViewModel;
  // late final LoginViewmodel loginViewmodel;
  //
  // void registerViewModel() {
  //   sl.registerLazySingleton<Validator>(() => validator);
  //   sl.registerLazySingleton<SecondTravelCoverDetailsViewModel>(
  //       () => viewModel);
  //
  //   sl.registerLazySingleton<BasicInfoViewModel>(() => basicInfoViewModel);
  //   sl.registerLazySingleton<LoginViewmodel>(() => loginViewmodel);
  // }
  //
  // void registerStub() {
  //   registerStubForName(validator);
  //   registerStubForEmail(validator);
  //   when(viewModel.agreeToTerms).thenReturn(true);
  //   when(viewModel.firstNameController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: 'John'));
  //   when(viewModel.lastNameController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: 'Smith'));
  //   when(viewModel.emailController).thenAnswer(
  //       (realInvocation) => TextEditingController(text: 'John@gmal.com'));
  //   when(basicInfoViewModel.firstName).thenAnswer((realInvocation) => 'Ahmad');
  //   when(viewModel.idCardController).thenAnswer(
  //       (realInvocation) => TextEditingController(text: '123123123123'));
  //   when(viewModel.idCardCodeController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: '123'));
  // }
  //
  // setUpAll(() {
  //   validator = MockValidator();
  //   viewModel = MockSecondTravelCoverDetailsViewModel();
  //   basicInfoViewModel = MockBasicInfoViewModel();
  //   loginViewmodel = MockLoginViewmodel();
  //   registerViewModel();
  //   registerStub();
  // });

  // group('widget test for name field validation', () {
  //   testWidgets('throw error if user enter numbers in name', (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.coverDetailScreen.firstName)),
  //         'John213');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid name'), findsNWidgets(2));
  //   });
  //   testWidgets('throw error if user enter characters in name', (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.coverDetailScreen.firstName)),
  //         'John@');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid name'), findsNWidgets(2));
  //   });
  //
  //   testWidgets('throw success if user enter characters correct name',
  //       (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.coverDetailScreen.firstName)),
  //         'John');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid name'), findsOneWidget);
  //   });
  // });
  // group('widget test for surname field validation', () {
  //   testWidgets('throw error if user enter numbers in surname', (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.coverDetailScreen.surName)),
  //         'John213');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid name'), findsOneWidget);
  //   });
  //   testWidgets('throw error if user enter characters in surName',
  //       (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.coverDetailScreen.surName)), 'John@');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid name'), findsOneWidget);
  //   });
  //   testWidgets('throw success if user enter characters correct surname',
  //       (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.coverDetailScreen.firstName)),
  //         'John');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid name'), findsOneWidget);
  //   });
  // });
  //
  // group('widget test for idCard field validation', () {
  //   testWidgets('throw error if user enter invalid in idCard', (tester) async {
  //     when(validator.validateInput('123',
  //             allowEmpty: true, pattern: ValidationPattern.idCard.pattern))
  //         .thenAnswer((realInvocation) => ValidationResult.invalid);
  //     await tester.setScreenSize(height: 1000, width: 500);
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(find.byKey(const ValueKey('idCard')), '123');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Invalid ID card Number'), findsOneWidget);
  //   });
  //
  //   testWidgets('throw error if user enter characters in idCard', (tester) async {
  //     when(validator.validateInput('123a',
  //         allowEmpty: true, pattern: ValidationPattern.idCard.pattern))
  //         .thenAnswer((realInvocation) => ValidationResult.invalid);
  //     await tester.setScreenSize(height: 1000, width: 500);
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(find.byKey(const ValueKey('idCard')), '123a');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Invalid ID card Number'), findsOneWidget);
  //   });
  //
  //   testWidgets('throw error if user enter space in idCard', (tester) async {
  //     when(validator.validateInput('12 3123',
  //         allowEmpty: true, pattern: ValidationPattern.idCard.pattern))
  //         .thenAnswer((realInvocation) => ValidationResult.invalid);
  //     await tester.setScreenSize(height: 1000, width: 500);
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(find.byKey(const ValueKey('idCard')), '12 3123');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Invalid ID card Number'), findsOneWidget);
  //   });
  //
  //   testWidgets('throw success if user enter correct IDCard format',
  //       (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(
  //         find.byKey(const ValueKey('idCard')), '123123123123');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Invalid ID card Number'), findsNothing);
  //   });
  // });
  //
  // group('widget test for idCardCode field validation', () {
  //   testWidgets('throw error if user enter invalid in idCardCode', (tester) async {
  //     when(validator.validateInput('12',
  //         allowEmpty: true, pattern: ValidationPattern.idCardCode.pattern))
  //         .thenAnswer((realInvocation) => ValidationResult.invalid);
  //     await tester.setScreenSize(height: 1000, width: 500);
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(find.byKey(const ValueKey('idCardCode')), '12');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Invalid Code'), findsOneWidget);
  //   });
  //
  //   testWidgets('throw error if user enter characters in idCardCode', (tester) async {
  //     when(validator.validateInput('123a',
  //         allowEmpty: true, pattern: ValidationPattern.idCardCode.pattern))
  //         .thenAnswer((realInvocation) => ValidationResult.invalid);
  //     await tester.setScreenSize(height: 1000, width: 500);
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(find.byKey(const ValueKey('idCardCode')), '123a');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Invalid Code'), findsOneWidget);
  //   });
  //
  //   testWidgets('throw error if user enter space in idCardCode', (tester) async {
  //     when(validator.validateInput('12 3123',
  //         allowEmpty: true, pattern: ValidationPattern.idCardCode.pattern))
  //         .thenAnswer((realInvocation) => ValidationResult.invalid);
  //     await tester.setScreenSize(height: 1000, width: 500);
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(find.byKey(const ValueKey('idCardCode')), '12 3123');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Invalid Code'), findsOneWidget);
  //   });
  //
  //   testWidgets('throw success if user enter correct IDCardCode format',
  //       (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //     await tester.enterText(find.byKey(const ValueKey('idCardCode')), '123');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Invalid Code'), findsNothing);
  //   });
  // });
  //
  // testWidgets('email field is enable for second traveler detail screen',
  //     (tester) async {
  //   await tester.setScreenSize(
  //     height: 1000,
  //     width: 500,
  //   );
  //   await tester.setResources();
  //   await tester.testAppForWidgetTesting(const SecondCoveredDetailed());
  //
  //   final finder = find.byKey(ValueKey(R.stringRes.coverDetailScreen.email));
  //   expect(finder, findsOneWidget);
  // });
}
