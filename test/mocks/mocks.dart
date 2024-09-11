import 'package:travelbox/features/cover_quote/usecase/cover_usecase.dart';
import 'package:travelbox/features/cover_quote/usecase/get_counties_usecase.dart';
import 'package:travelbox/features/questions/usecase/get_quote_usecase.dart';
import 'package:travelbox/features/questions/views/basic_info/usecase/basic_info_usecase.dart';

final registerRequest = RegisterRequest(
  title: 'Mr',
  firstName: 'Ahmad',
  surname: 'Hassan',
  email: 'ahmad@gmail.com',
  mobile: '08783923823',
  countryCodeOfResidence: 'Pk',
  password: 'ahmad123',
);

final getCoverRequest = GetCoverRequest(language: 'en', country: 'US');
final getCountryRequest = GetCountriesRequest(language: 'en', country: 'US');

final getQuoteRequest = GetQuoteRequest(
  accountId: '1234',
  coverId: 'ahadjsfa12331',
  includedCoverItemIds: ['123', '234'],
  countryOfResidence: 'PK',
  country: 'US',
  mobile: '+9234061536',
  language: 'en',
  coverStartDate: '2021-09-01',
  coverEndDate: '2021-09-30',
);

const getCoverJsonResponse = {
  "offers": [
    {
      "coverId": "abdcde-123456-abc",
      "name": "Annual Cover",
      "shortDescription": "Recommended if you travel 2+ times a year",
      "startingPrice": {"amount": 99.96, "currency": "USD"},
      "availableCoverItems": [
        {
          "id": "ABCDEF-12314567-ABCD",
          "name": "Cruise Cover",
          'isSelected': false
        }
      ]
    }
  ]
};

const geCountryJsonResponse = [
  {"countryName": "Pakistan", "countryCode": "PK", 'isSelected': false},
  {"countyName": "Hong Kong", "countryCode": "KH", 'isSelected': false},
];

const getQuoteJsonResponse = {
  "quotes": [
    {
      "quoteId": "abcdef-1234567-abc",
      "name": "Basic Cover",
      "shortDescription": "The basic plan covers what you need.",
      "coverGroups": [
        {
          "name": "string",
          "description": "string",
          "coverItems": [
            {
              "name": "string",
              "description": "string",
              "amountCovered": {"amount": 99.96, "currency": "USD"}
            }
          ]
        }
      ],
      "coverItemsIncludedInQuote": [
        {
          "id": "ABCDEF-12314567-ABCD",
          "name": "Cruise Cover",
          "price": {"amount": 99.96, "currency": "USD"},
          "shortDescription": "Go on a cruise during the period of your cover",
          "longDescription":
              "Cruise cover travel insurance can offer coverage for medical expenses, transfers/evacuations and repatriation if you become sick or have to be treated by an on-board doctor including if you need to be taken to the nearest medical facility."
        }
      ],
      "quotePrice": {"amount": 99.96, "currency": "USD"},
      "addOnCoverItemsAvailable": [
        {
          "id": "ABCDEF-12314567-ABCD",
          "name": "Cruise Cover",
          "price": {"amount": 99.96, "currency": "USD"},
          "shortDescription": "Go on a cruise during the period of your cover",
          "longDescription":
              "Cruise cover travel insurance can offer coverage for medical expenses, transfers/evacuations and repatriation if you become sick or have to be treated by an on-board doctor including if you need to be taken to the nearest medical facility."
        }
      ]
    }
  ]
};

const getQuoteWithoutListJsonResponse = {
  "quoteId": "abcdef-1234567-abc",
  "name": "Basic Cover",
  "shortDescription": "The basic plan covers what you need.",
  "coverGroups": [
    {
      "name": "string",
      "description": "string",
      "coverItems": [
        {
          "name": "string",
          "description": "string",
          "amountCovered": {"amount": 99.96, "currency": "USD"}
        }
      ]
    }
  ],
  "coverItemsIncludedInQuote": [
    {
      "id": "ABCDEF-12314567-ABCD",
      "name": "Cruise Cover",
      "price": {"amount": 99.96, "currency": "USD"},
      "shortDescription": "Go on a cruise during the period of your cover",
      "longDescription":
          "Cruise cover travel insurance can offer coverage for medical expenses, transfers/evacuations and repatriation if you become sick or have to be treated by an on-board doctor including if you need to be taken to the nearest medical facility."
    }
  ],
  "quotePrice": {"amount": 99.96, "currency": "USD"},
  "addOnCoverItemsAvailable": [
    {
      "id": "ABCDEF-12314567-ABCD",
      "name": "Cruise Cover",
      "price": {"amount": 99.96, "currency": "USD"},
      "shortDescription": "Go on a cruise during the period of your cover",
      "longDescription":
          "Cruise cover travel insurance can offer coverage for medical expenses, transfers/evacuations and repatriation if you become sick or have to be treated by an on-board doctor including if you need to be taken to the nearest medical facility."
    }
  ]
};
