import 'package:mockito/mockito.dart';
import 'package:travelbox/utils/core/validator/validator.dart';

void main() {
  // late final BasicInfoViewModel viewModel;
  // late final Validator validator;
  // late final LoginViewmodel loginViewModel;
  //
  // void registerViewModel() {
  //   sl.registerLazySingleton<BasicInfoViewModel>(() => viewModel);
  //   sl.registerLazySingleton<Validator>(() => validator);
  //   sl.registerLazySingleton<LoginViewmodel>(() => loginViewModel);
  // }
  //
  // void registerStub() {
  //   when(viewModel.title).thenAnswer((realInvocation) => '');
  //   when(viewModel.acceptPolicy).thenAnswer((realInvocation) => false);
  //   when(viewModel.isButtonEnabled()).thenAnswer((realInvocation) => true);
  //   when(viewModel.phoneNumberError).thenAnswer((realInvocation) => null);
  //   when(loginViewModel.loginState).thenAnswer((realInvocation) => false);
  //   registerStubForName(validator);
  //   registerStubForEmail(validator);
  // }
  //
  // setUpAll(() {
  //   validator = MockValidator();
  //   viewModel = MockBasicInfoViewModel();
  //   loginViewModel = MockLoginViewmodel();
  //   registerViewModel();
  //   registerStub();
  // });
  //
  // group('widget test for name field validation', () {
  //   testWidgets('throw error if user enter number in name', (tester) async {
  //     final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.firstNameHint)),
  //         'John213');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_name), findsNWidgets(2));
  //   });
  //
  //   testWidgets('throw error if user enter space in name', (tester) async {
  //     final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.firstNameHint)),
  //         'John son');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_name), findsNWidgets(2));
  //   });
  //   testWidgets('throw error if user enter special character in name',
  //       (tester) async {
  //         final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.firstNameHint)),
  //         'John@');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_name), findsNWidgets(2));
  //   });
  //
  //   testWidgets(
  //       'throw success if user enter name without character,space & number',
  //       (tester) async {
  //         final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.firstNameHint)),
  //         'John');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_name), findsNWidgets(1));
  //   });
  // });
  //
  // group('widget test for surname field validation', () {
  //   testWidgets('throw error if user enter number in surname', (tester) async {
  //     final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.surNameHint)),
  //         'John213');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_name), findsNWidgets(2));
  //   });
  //
  //   testWidgets('throw error if user enter space in surname', (tester) async {
  //     final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.surNameHint)),
  //         'John son');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_name), findsNWidgets(2));
  //   });
  //   testWidgets('throw error if user enter special character in surname',
  //       (tester) async {
  //         final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.surNameHint)),
  //         'John@');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_name), findsNWidgets(2));
  //   });
  //
  //   testWidgets(
  //       'throw success if user enter surname without character,space & number',
  //       (tester) async {
  //         final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.surNameHint)), 'John');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_name), findsNWidgets(1));
  //   });
  // });
  //
  // group('widget test for email field validation', () {
  //   testWidgets('throw error if user enter number in email', (tester) async {
  //     final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.emailHint)),
  //         'John213');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_email), findsOneWidget);
  //   });
  //
  //   testWidgets('throw error if user enter space in email', (tester) async {
  //     final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.emailHint)),
  //         'John son');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_email), findsOneWidget);
  //   });
  //   testWidgets('throw error if user enter wrong email format', (tester) async {
  //     final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.emailHint)),
  //         'Johngmail.com');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_email), findsOneWidget);
  //   });
  //
  //   testWidgets('throw success if user enter correct email format',
  //       (tester) async {
  //         final expectAppLocalizations = await AppLocalizations.load(const Locale('en'));
  //     await tester.setScreenSize(
  //       height: 1000,
  //       width: 500,
  //     );
  //     await tester.setResources();
  //     await tester.testAppForWidgetTesting(const BasicInfoScreen());
  //
  //     await tester.enterText(
  //         find.byKey(ValueKey(R.stringRes.registerScreen.emailHint)),
  //         'John@gmal.com');
  //     await tester.ensureVisible(find.byType(GenericButton));
  //     await tester.tap(find.byType(GenericButton));
  //     await tester.pumpAndSettle();
  //
  //     expect(find.text(expectAppLocalizations.please_enter_a_valid_email), findsNothing);
  //   });
  // });
}

void registerStubForName(Validator validator) {
  when(validator.validateInput('John213',
          allowEmpty: true, pattern: ValidationPattern.name.pattern))
      .thenAnswer((realInvocation) => ValidationResult.invalid);
  when(validator.validateInput('Smith',
          allowEmpty: true, pattern: ValidationPattern.name.pattern))
      .thenAnswer((realInvocation) => ValidationResult.invalid);
  when(validator.validateInput('John son',
          allowEmpty: true, pattern: ValidationPattern.name.pattern))
      .thenAnswer((realInvocation) => ValidationResult.invalid);
  when(validator.validateInput('John@',
          allowEmpty: true, pattern: ValidationPattern.name.pattern))
      .thenAnswer((realInvocation) => ValidationResult.invalid);
  when(validator.validateInput('John',
          allowEmpty: true, pattern: ValidationPattern.name.pattern))
      .thenAnswer((realInvocation) => ValidationResult.valid);
  when(validator.validateInput('',
          allowEmpty: true, pattern: ValidationPattern.name.pattern))
      .thenAnswer((realInvocation) => ValidationResult.invalid);
  when(validator.validateInput('',
          allowEmpty: true, pattern: ValidationPattern.email.pattern))
      .thenAnswer((realInvocation) => ValidationResult.invalid);
  when(validator.validateInput('',
          allowEmpty: true, pattern: ValidationPattern.password.pattern))
      .thenAnswer((realInvocation) => ValidationResult.invalid);
}

void registerStubForEmail(Validator validator) {
  when(validator.validateInput('John213',
          allowEmpty: true, pattern: ValidationPattern.email.pattern))
      .thenAnswer((realInvocation) => ValidationResult.invalid);
  when(validator.validateInput('John son',
          allowEmpty: true, pattern: ValidationPattern.email.pattern))
      .thenAnswer((realInvocation) => ValidationResult.invalid);
  when(validator.validateInput('Johngmail.com',
          allowEmpty: true, pattern: ValidationPattern.email.pattern))
      .thenAnswer((realInvocation) => ValidationResult.invalid);
  when(validator.validateInput('John@gmal.com',
          allowEmpty: true, pattern: ValidationPattern.email.pattern))
      .thenAnswer((realInvocation) => ValidationResult.valid);
}
