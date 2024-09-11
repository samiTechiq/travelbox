

void main() {
  // late final Validator validator;
  // late final BothCoverDetailViewModel viewModel;
  // late final BasicInfoViewModel basicInfoViewModel;
  // late final LoginViewmodel loginViewmodel;
  //
  // void registerViewModel() {
  //   sl.registerLazySingleton<Validator>(() => validator);
  //   sl.registerLazySingleton<BothCoverDetailViewModel>(() => viewModel);
  //   sl.registerLazySingleton<BasicInfoViewModel>(() => basicInfoViewModel);
  //   sl.registerLazySingleton<LoginViewmodel>(() => loginViewmodel);
  // }
  //
  // void registerStub() {
  //   registerStubForName(validator);
  //   registerStubForEmail(validator);
  //   when(viewModel.isFormValid).thenReturn(true);
  //   when(viewModel.firstNameController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: 'John'));
  //   when(viewModel.lastNameController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: 'Smith'));
  //   when(viewModel.emailController).thenAnswer(
  //       (realInvocation) => TextEditingController(text: 'John@gmal.com'));
  //   when(basicInfoViewModel.firstName).thenAnswer((realInvocation) => 'Ahmad');
  //   when(basicInfoViewModel.surname).thenAnswer((realInvocation) => 'Hassan');
  //   when(basicInfoViewModel.email)
  //       .thenAnswer((realInvocation) => 'ahmadhassan136@gmail.com');
  //   when(viewModel.dateOfBirth).thenAnswer((realInvocation) => '1998-12-12');
  //   when(viewModel.idCardController).thenAnswer(
  //       (realInvocation) => TextEditingController(text: '123123123123'));
  //   when(viewModel.idCardCodeController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: '123'));
  // }
  //
  // setUpAll(() {
  //   validator = MockValidator();
  //   viewModel = MockBothCoverDetailViewModel();
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
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
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
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
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
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
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
  // group('widget test for surname field validation', () {
  //   testWidgets('throw error if user enter numbers in surname', (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
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
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
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
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
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
  // group('widget test for email field validation', () {
  //   testWidgets('throw error if user enter number in email', (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.coverDetailScreen.email)), 'John213');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid email'), findsOneWidget);
  //   });
  //
  //   testWidgets('throw error if user enter space in email', (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.coverDetailScreen.email)),
  //         'John son');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid email'), findsOneWidget);
  //   });
  //   testWidgets('throw error if user enter wrong email format', (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.coverDetailScreen.email)),
  //         'Johngmail.com');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid email'), findsOneWidget);
  //   });
  //
  //   testWidgets('throw success if user enter correct email format',
  //       (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.coverDetailScreen.email)),
  //         'John@gmal.com');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid email'), findsNothing);
  //   });
  // });
  //
  // group('widget test for idCard field validation', () {
  //   testWidgets('throw success if user enter correct IDCard format',
  //       (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
  //
  //     await tester.enterText(
  //         find.byKey(const ValueKey('idCard')), '123123123123');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid IDCard'), findsNothing);
  //   });
  // });
  //
  // group('widget test for idCardCode field validation', () {
  //   testWidgets('throw success if user enter correct IDCardCode format',
  //       (tester) async {
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BothCoveredDetails());
  //
  //     await tester.enterText(find.byKey(const ValueKey('idCardCode')), '123');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text('Please enter a valid IDCardCode'), findsNothing);
  //   });
  // });
  //
  // testWidgets('check button enable when user form is valid', (tester) async {
  //   when(viewModel.isFormValid).thenReturn(true);
  //   when(viewModel.firstNameController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: 'John'));
  //   when(viewModel.lastNameController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: 'Smith'));
  //   when(viewModel.emailController).thenAnswer(
  //       (realInvocation) => TextEditingController(text: 'johnsmith@gmail.com'));
  //   when(viewModel.idCardController).thenAnswer(
  //       (realInvocation) => TextEditingController(text: '123123123123'));
  //   when(viewModel.idCardCodeController)
  //       .thenAnswer((realInvocation) => TextEditingController(text: '123'));
  //   await tester.setScreenSize(
  //     height: 1000,
  //     width: 500,
  //   );
  //   await tester.setResources();
  //   await tester.testAppForWidgetTesting(const BothCoveredDetails());
  //   final button = find.byKey(const ValueKey("button_container"));
  //   expect(tester.widget<InkWell>(button).onTap, isNotNull);
  // });
}