class Quote {
  String? quoteId;
  String? name;
  String? shortDescription;
  List<CoverGroups>? coverGroups;
  List<CoverItemsIncludedInQuote>? coverItemsIncludedInQuote;
  AmountCovered? quotePrice;
  List<AddOnCoverItemsAvailable>? addOnCoverItemsAvailable;

  Quote(
      {quoteId,
      name,
      shortDescription,
      coverGroups,
      coverItemsIncludedInQuote,
      quotePrice,
      addOnCoverItemsAvailable});

  Quote.fromJson(Map<String, dynamic> json) {
    quoteId = json['quoteId'];
    name = json['name'];
    shortDescription = json['shortDescription'];
    if (json['coverGroups'] != null) {
      coverGroups = <CoverGroups>[];
      json['coverGroups'].forEach((v) {
        coverGroups!.add(CoverGroups.fromJson(v));
      });
    }
    if (json['coverItemsIncludedInQuote'] != null) {
      coverItemsIncludedInQuote = <CoverItemsIncludedInQuote>[];
      json['coverItemsIncludedInQuote'].forEach((v) {
        coverItemsIncludedInQuote!.add(CoverItemsIncludedInQuote.fromJson(v));
      });
    }
    quotePrice = json['quotePrice'] != null
        ? AmountCovered.fromJson(json['quotePrice'])
        : null;
    if (json['addOnCoverItemsAvailable'] != null) {
      addOnCoverItemsAvailable = <AddOnCoverItemsAvailable>[];
      json['addOnCoverItemsAvailable'].forEach((v) {
        addOnCoverItemsAvailable!.add(AddOnCoverItemsAvailable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quoteId'] = quoteId;
    data['name'] = name;
    data['shortDescription'] = shortDescription;
    if (coverGroups != null) {
      data['coverGroups'] = coverGroups!.map((v) => v.toJson()).toList();
    }
    if (coverItemsIncludedInQuote != null) {
      data['coverItemsIncludedInQuote'] =
          coverItemsIncludedInQuote!.map((v) => v.toJson()).toList();
    }
    if (quotePrice != null) {
      data['quotePrice'] = quotePrice!.toJson();
    }
    if (addOnCoverItemsAvailable != null) {
      data['addOnCoverItemsAvailable'] =
          addOnCoverItemsAvailable!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Quote &&
          runtimeType == other.runtimeType &&
          quoteId == other.quoteId &&
          name == other.name &&
          shortDescription == other.shortDescription &&
          coverGroups == other.coverGroups &&
          coverItemsIncludedInQuote == other.coverItemsIncludedInQuote &&
          quotePrice == other.quotePrice &&
          addOnCoverItemsAvailable == other.addOnCoverItemsAvailable;

  @override
  int get hashCode =>
      quoteId.hashCode ^
      name.hashCode ^
      shortDescription.hashCode ^
      coverGroups.hashCode ^
      coverItemsIncludedInQuote.hashCode ^
      quotePrice.hashCode ^
      addOnCoverItemsAvailable.hashCode;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    if (coverItems != null) {
      data['coverItems'] = coverItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoverGroups &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          coverItems == other.coverItems;

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ coverItems.hashCode;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    if (amountCovered != null) {
      data['amountCovered'] = amountCovered!.toJson();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoverItems &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          amountCovered == other.amountCovered;

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ amountCovered.hashCode;
}

class AmountCovered {
  num? amount;
  String? currency;

  AmountCovered({amount, currency});

  AmountCovered.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AmountCovered &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          currency == other.currency;

  @override
  int get hashCode => amount.hashCode ^ currency.hashCode;
}

class CoverItemsIncludedInQuote {
  String? id;
  String? name;
  AmountCovered? price;
  String? shortDescription;
  String? longDescription;

  CoverItemsIncludedInQuote(
      {id, name, price, shortDescription, longDescription});

  CoverItemsIncludedInQuote.fromJson(Map<String, dynamic> json) {
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoverItemsIncludedInQuote &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          price == other.price &&
          shortDescription == other.shortDescription &&
          longDescription == other.longDescription;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      shortDescription.hashCode ^
      longDescription.hashCode;
}

class AddOnCoverItemsAvailable {
  String? id;
  String? name;
  Price? price;
  String? shortDescription;
  String? longDescription;

  AddOnCoverItemsAvailable(
      {id, name, price, shortDescription, longDescription});

  AddOnCoverItemsAvailable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddOnCoverItemsAvailable &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          price == other.price &&
          shortDescription == other.shortDescription &&
          longDescription == other.longDescription;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      shortDescription.hashCode ^
      longDescription.hashCode;
}

class Price {
  num? amount;
  String? currency;

  Price({amount, currency});

  Price.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Price &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          currency == other.currency;

  @override
  int get hashCode => amount.hashCode ^ currency.hashCode;
}
