// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:provider/provider.dart';
// import 'package:travelbox/data/di/dependeny_injection.dart';
// import 'package:travelbox/features/cover_quote/model/country_data.dart';
// import 'package:travelbox/features/cover_quote/model/cover.dart';
// import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
// import 'package:travelbox/features/cover_quote/widget/expension_card.dart';
// import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart';
// import 'package:travelbox/utils/widgets/checkbox/app_radio_button.dart';
//
// import '../../../demo_test.mocks.dart';
// import '../../../mocks/generated_mocks/cover_quote_viewmodel.mocks.dart';
// import '../../../utils/material_app.dart';


void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  // late final LoginViewmodel loginViewModel;
  // late final CoverQuoteViewModel coverQuoteViewModel;
  //
  // setUpAll(() {
  //   coverQuoteViewModel = MockCoverQuoteViewModel();
  //   loginViewModel = MockLoginViewmodel();
  //
  //   sl.registerLazySingleton<CoverQuoteViewModel>(() => coverQuoteViewModel);
  //   sl.registerLazySingleton<LoginViewmodel>(() => loginViewModel);
  // });
  //
  // group(
  //   'test cases for expansion card',
  //   () {
  //     testWidgets(
  //       'ExpansionCard toggles isExpanded',
  //           (WidgetTester tester) async {
  //         when(coverQuoteViewModel.destinationRegionAnnual)
  //             .thenAnswer((realInvocation) => DestinationRegionAnnual.asia);
  //
  //         when(coverQuoteViewModel.selectedCountry).thenAnswer((_) => CountryData(
  //           'Hong Kong',
  //           code: 'HK',
  //           flag: '🇭🇰',
  //         ));
  //         Cover cover = Cover(
  //             coverId: '1',
  //             availableCoverItems: [],
  //             startingPrice: StartingPrice.initial());
  //         // Create a GlobalKey to reference the ExpansionCard's State object
  //         final GlobalKey<ExpansionCardMobileContentState> expansionCardKey =
  //         GlobalKey();
  //
  //         await tester.setScreenSize();
  //         await tester.setResources();
  //         // Create a new ExpansionCard widget
  //         final card = ChangeNotifierProvider.value(
  //           value: coverQuoteViewModel,
  //           builder: (context, child) {
  //             return ExpansionCard(
  //               key: expansionCardKey,
  //               heading: 'annual',
  //               data: [
  //                 AvailableCoverItems(name: '1', id: '1'),
  //                 AvailableCoverItems(name: '2', id: '2'),
  //                 AvailableCoverItems(name: '4', id: '4'),
  //               ],
  //               cover: Cover(
  //                 coverId: '1',
  //                 startingPrice: StartingPrice.initial(),
  //                 availableCoverItems: [],
  //               ),
  //               onCoverSelected: (value) async {
  //                 cover = value;
  //               },
  //               isSelected: cover.coverId == '1',
  //               includedCountries: const [],
  //               excludedCountries: const [],
  //             );
  //           },
  //         );
  //
  //         // Add the card to a test widget tree
  //         await tester.testAppForWidgetTesting(Material(child: card));
  //
  //         // Simulate a tap on the card's button
  //         await tester.tap(find.byKey(const Key("expand_button")));
  //
  //         // Rebuild the widget tree
  //         await tester.pumpAndSettle();
  //
  //         // expect to find arrowUp icon widget
  //         // it means the expension_card is expanded
  //         expect(find.byKey(const Key("arrow_up")), findsOneWidget);
  //       },
  //     );
  //
  //     testWidgets('do ExpansionCard displays starting amount with currency symbol',
  //             (WidgetTester tester) async {
  //           when(sl<CoverQuoteViewModel>().destinationRegionAnnual)
  //               .thenAnswer((realInvocation) => DestinationRegionAnnual.asia);
  //           when(coverQuoteViewModel.selectedCountry).thenAnswer((_) => CountryData(
  //             'Hong Kong',
  //             code: 'HK',
  //             flag: '🇭🇰',
  //           ));
  //           // Create a GlobalKey to reference the ExpansionCard's State object
  //           final GlobalKey<ExpansionCardMobileContentState> expansionCardKey =
  //           GlobalKey();
  //
  //           await tester.setScreenSize();
  //           await tester.setResources();
  //           // Create a new ExpansionCard widget
  //           final card = ChangeNotifierProvider.value(
  //             value: coverQuoteViewModel,
  //             builder: (context, child) {
  //               return ExpansionCard(
  //                 key: expansionCardKey,
  //                 includedCountries: const [],
  //                 excludedCountries: const [],
  //                 data: [
  //                   AvailableCoverItems(name: '1', id: '1'),
  //                   AvailableCoverItems(name: '2', id: '2'),
  //                   AvailableCoverItems(name: '4', id: '4'),
  //                 ],
  //                 cover: Cover(
  //                     coverId: '1',
  //                     availableCoverItems: [],
  //                     startingPrice: StartingPrice.initial()),
  //                 onCoverSelected: (value) async {},
  //                 startingAmount: '100',
  //               );
  //             },
  //           );
  //
  //           // Add the card to a test widget tree
  //           await tester.testAppForWidgetTesting(Material(child: card));
  //
  //           expect(find.byType(GenericRadioButton), findsNWidgets(0));
  //
  //           // Simulate a tap on the card's button
  //           await tester.tap(find.byKey(const Key("expand_button")));
  //
  //           // Rebuild the widget tree
  //           await tester.pump();
  //
  //           expect(find.text('\$100/'), findsOneWidget);
  //         });
  //   },
  // );
}
