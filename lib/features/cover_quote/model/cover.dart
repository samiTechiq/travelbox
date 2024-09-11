// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cover.freezed.dart';
part 'cover.g.dart';

@Freezed(genericArgumentFactories: true)
class Cover with _$Cover {
  const factory Cover(
      {required String coverId,
      required List<AvailableCoverItems> availableCoverItems,
      String? name,
      String? shortDescription,
      required StartingPrice startingPrice}) = _Cover;

  factory Cover.fromJson(Map<String, Object?> json) => _$CoverFromJson(json);

  factory Cover.initial() => Cover(
      coverId: '',
      name: '',
      availableCoverItems: [AvailableCoverItems.initial()],
      startingPrice: StartingPrice.initial());

  @override
  Map<String, dynamic> toJson() {
    return toJson();
  }
}

@freezed
class StartingPrice with _$StartingPrice {
  const factory StartingPrice({required num amount, required String currency}) =
      _StartingPrice;

  factory StartingPrice.fromJson(Map<String, Object?> json) =>
      _$StartingPriceFromJson(json);

  factory StartingPrice.initial() =>
      const StartingPrice(amount: 0, currency: '');

  @override
  Map<String, dynamic> toJson() {
    return toJson();
  }
}

@unfreezed
class AvailableCoverItems with _$AvailableCoverItems {
  factory AvailableCoverItems(
      {required String name,
      required String id,
      @Default(false) bool isSelected}) = _AvailableCoverItems;

  factory AvailableCoverItems.fromJson(Map<String, Object?> json) =>
      _$AvailableCoverItemsFromJson(json);

  factory AvailableCoverItems.initial() =>
      AvailableCoverItems(name: '', id: '');

  @override
  Map<String, dynamic> toJson() {
    return toJson();
  }
}
