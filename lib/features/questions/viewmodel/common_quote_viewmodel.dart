import 'package:injectable/injectable.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';

@lazySingleton
class QuoteData {
  late List<Quote> quotes = [
    Quote(
      quoteId: "112121",
      name: "Basic Cover",
      shortDescription: " Short Description",
      coverGroups: [
        CoverGroups(
            name: "Cover 1",
            description: "Cover Desctiption",
            coverItems: [
              CoverItems(
                  name: "Emergency accident",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  amountCovered:
                      AmountCovered(amount: 1200000, currency: "HKD")),
            ])
      ],
      coverItemsIncludedInQuote: CoverItemsIncludedInQuote(
          id: "1",
          name: "Item 1",
          price: AmountCovered(amount: 10, currency: "PKR"),
          shortDescription: "shoert description",
          longDescription: "Long desxriptin"),
      quotePrice: AmountCovered(amount: 100, currency: "HK"),
      addOnCoverItemsAvailable: AddOnCoverItemsAvailable(
          id: "1",
          name: "Item 1",
          price: AmountCovered(amount: 10, currency: "PKR"),
          shortDescription: "shoert description",
          longDescription: "Long desxriptin"),
    )
  ];

  void setQuotes(List<Quote> val) {
    quotes = val;
  }
}
