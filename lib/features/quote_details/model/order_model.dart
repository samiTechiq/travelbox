// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter/foundation.dart';
//
// part 'order_model.freezed.dart';
//
// part 'order_model.g.dart';
//
// @freezed
// class OrderModel with _$OrderModel {
//   const factory OrderModel({
//     required String? order,
//     required String? name,
//     required String? shortDescription,
//     required List<CoverGroups> coverGroups,
//     // required List<CoverItems> coverItems,
//     // required AmountCovered amountCovered,
//   }) = _Order;
//
//   factory OrderModel.fromJson(Map<String, Object?> json) => _$OrderModelFromJson(json);
//
//   factory OrderModel.initial() => OrderModel(
//         order: '',
//         name: '',
//         shortDescription: '',
//         coverGroups: [],
//         // coverItems: [],
//         // amountCovered: AmountCovered.initial(),
//       );
// }
//
// @freezed
// class CoverGroups with _$CoverGroups {
//   const factory CoverGroups({
//     required String? name,
//     required String? description,
//     required List<CoverItems> coverItems,
//   }) = _CoverGroups;
//
//   factory CoverGroups.fromJson(Map<String, Object?> json) =>
//       _$CoverGroupsFromJson(json);
//
//   factory CoverGroups.initial() => const CoverGroups(
//         name: '',
//         coverItems: [],
//         description: '',
//       );
// }
//
// @freezed
// class CoverItems with _$CoverItems {
//   const factory CoverItems({
//     required String? name,
//     required String? description,
//     required AmountCovered amountCovered,
//   }) = _CoverItems;
//
//   factory CoverItems.fromJson(Map<String, Object?> json) =>
//       _$CoverItemsFromJson(json);
//
//   factory CoverItems.initial() => CoverItems(
//         name: '',
//         description: '',
//         amountCovered: AmountCovered.initial(),
//       );
// }
//
// @freezed
// class AmountCovered with _$AmountCovered {
//   const factory AmountCovered({required num amount, required String currency}) =
//       _AmountCovered;
//
//   factory AmountCovered.fromJson(Map<String, Object?> json) =>
//       _$AmountCoveredFromJson(json);
//
//   factory AmountCovered.initial() =>
//       const AmountCovered(amount: 0, currency: '');
// }
//

class OrderModel {
  String? orderId;
  String? name;
  String? shortDescription;
  List<CoverGroups>? coverGroups;
  List<MainCoverItems>? coverItems;
  AmountCovered? quotePrice;

  OrderModel(
      {orderId, name, shortDescription, coverGroups, coverItems, quotePrice});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    name = json['name'];
    shortDescription = json['shortDescription'];
    if (json['coverGroups'] != null) {
      coverGroups = <CoverGroups>[];
      json['coverGroups'].forEach((v) {
        coverGroups!.add(CoverGroups.fromJson(v));
      });
    }
    if (json['coverItems'] != null) {
      coverItems = <MainCoverItems>[];
      json['coverItems'].forEach((v) {
        coverItems!.add(MainCoverItems.fromJson(v));
      });
    }
    quotePrice = json['quotePrice'] != null
        ? AmountCovered.fromJson(json['quotePrice'])
        : null;
  }

  factory OrderModel.initial() => OrderModel(
        name: '',
        shortDescription: '',
        coverGroups: [],
        coverItems: [],
        quotePrice: AmountCovered.initial(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['name'] = name;
    data['shortDescription'] = shortDescription;
    if (coverGroups != null) {
      data['coverGroups'] = coverGroups!.map((v) => v.toJson()).toList();
    }
    if (coverItems != null) {
      data['coverItems'] = coverItems!.map((v) => v.toJson()).toList();
    }
    if (quotePrice != null) {
      data['quotePrice'] = quotePrice!.toJson();
    }
    return data;
  }
}

class CoverGroups {
  String? name;
  String? description;
  List<CoverItems>? coverItems;

  CoverGroups({name, description, coverItems});

  CoverGroups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    if (json['coverItems'] != null) {
      coverItems = <CoverItems>[];
      json['coverItems'].forEach((v) {
        coverItems!.add(CoverItems.fromJson(v));
      });
    }
  }

  factory CoverGroups.initial() => CoverGroups(
        name: '',
        coverItems: [],
        description: '',
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    if (coverItems != null) {
      data['coverItems'] = coverItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CoverItems {
  String? name;
  String? description;
  AmountCovered? amountCovered;

  CoverItems({name, description, amountCovered});

  CoverItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    amountCovered = json['amountCovered'] != null
        ? AmountCovered.fromJson(json['amountCovered'])
        : null;
  }

  factory CoverItems.initial() => CoverItems(
        name: '',
        description: '',
        amountCovered: AmountCovered.initial(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    if (amountCovered != null) {
      data['amountCovered'] = amountCovered!.toJson();
    }
    return data;
  }
}

class AmountCovered {
  num? amount;
  String? currency;

  AmountCovered({amount, currency});

  AmountCovered.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  factory AmountCovered.initial() => AmountCovered(amount: 0, currency: '');

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}

class MainCoverItems {
  String? id;
  String? name;
  AmountCovered? price;
  String? shortDescription;
  String? longDescription;

  MainCoverItems({id, name, price, shortDescription, longDescription});

  MainCoverItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price =
        json['price'] != null ? AmountCovered.fromJson(json['price']) : null;
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['shortDescription'] = shortDescription;
    data['longDescription'] = longDescription;
    return data;
  }
}
