// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cover.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cover _$CoverFromJson(
  Map<String, dynamic> json,
) {
  return _Cover.fromJson(
    json,
  );
}

/// @nodoc
mixin _$Cover {
  String get coverId => throw _privateConstructorUsedError;
  List<AvailableCoverItems> get availableCoverItems =>
      throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get shortDescription => throw _privateConstructorUsedError;
  StartingPrice get startingPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoverCopyWith<Cover> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoverCopyWith<$Res> {
  factory $CoverCopyWith(Cover value, $Res Function(Cover) then) =
      _$CoverCopyWithImpl<$Res, Cover>;
  @useResult
  $Res call(
      {String coverId,
      List<AvailableCoverItems> availableCoverItems,
      String? name,
      String? shortDescription,
      StartingPrice startingPrice});

  $StartingPriceCopyWith<$Res> get startingPrice;
}

/// @nodoc
class _$CoverCopyWithImpl<$Res, $Val extends Cover>
    implements $CoverCopyWith<$Res> {
  _$CoverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coverId = null,
    Object? availableCoverItems = null,
    Object? name = freezed,
    Object? shortDescription = freezed,
    Object? startingPrice = null,
  }) {
    return _then(_value.copyWith(
      coverId: null == coverId
          ? _value.coverId
          : coverId // ignore: cast_nullable_to_non_nullable
              as String,
      availableCoverItems: null == availableCoverItems
          ? _value.availableCoverItems
          : availableCoverItems // ignore: cast_nullable_to_non_nullable
              as List<AvailableCoverItems>,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      startingPrice: null == startingPrice
          ? _value.startingPrice
          : startingPrice // ignore: cast_nullable_to_non_nullable
              as StartingPrice,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StartingPriceCopyWith<$Res> get startingPrice {
    return $StartingPriceCopyWith<$Res>(_value.startingPrice, (value) {
      return _then(_value.copyWith(startingPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoverImplCopyWith<$Res> implements $CoverCopyWith<$Res> {
  factory _$$CoverImplCopyWith(
          _$CoverImpl value, $Res Function(_$CoverImpl) then) =
      __$$CoverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String coverId,
      List<AvailableCoverItems> availableCoverItems,
      String? name,
      String? shortDescription,
      StartingPrice startingPrice});

  @override
  $StartingPriceCopyWith<$Res> get startingPrice;
}

/// @nodoc
class __$$CoverImplCopyWithImpl<$Res>
    extends _$CoverCopyWithImpl<$Res, _$CoverImpl>
    implements _$$CoverImplCopyWith<$Res> {
  __$$CoverImplCopyWithImpl(
      _$CoverImpl _value, $Res Function(_$CoverImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coverId = null,
    Object? availableCoverItems = null,
    Object? name = freezed,
    Object? shortDescription = freezed,
    Object? startingPrice = null,
  }) {
    return _then(_$CoverImpl(
      coverId: null == coverId
          ? _value.coverId
          : coverId // ignore: cast_nullable_to_non_nullable
              as String,
      availableCoverItems: null == availableCoverItems
          ? _value._availableCoverItems
          : availableCoverItems // ignore: cast_nullable_to_non_nullable
              as List<AvailableCoverItems>,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      startingPrice: null == startingPrice
          ? _value.startingPrice
          : startingPrice // ignore: cast_nullable_to_non_nullable
              as StartingPrice,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoverImpl with DiagnosticableTreeMixin implements _Cover {
  const _$CoverImpl(
      {required this.coverId,
      required final List<AvailableCoverItems> availableCoverItems,
      this.name,
      this.shortDescription,
      required this.startingPrice})
      : _availableCoverItems = availableCoverItems;

  factory _$CoverImpl.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$$CoverImplFromJson(
        json,
      );

  @override
  final String coverId;
  final List<AvailableCoverItems> _availableCoverItems;
  @override
  List<AvailableCoverItems> get availableCoverItems {
    if (_availableCoverItems is EqualUnmodifiableListView)
      return _availableCoverItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableCoverItems);
  }

  @override
  final String? name;
  @override
  final String? shortDescription;
  @override
  final StartingPrice startingPrice;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Cover(coverId: $coverId, availableCoverItems: $availableCoverItems, name: $name, shortDescription: $shortDescription, startingPrice: $startingPrice)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Cover'))
      ..add(DiagnosticsProperty('coverId', coverId))
      ..add(DiagnosticsProperty('availableCoverItems', availableCoverItems))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('shortDescription', shortDescription))
      ..add(DiagnosticsProperty('startingPrice', startingPrice));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoverImpl &&
            (identical(other.coverId, coverId) || other.coverId == coverId) &&
            const DeepCollectionEquality()
                .equals(other._availableCoverItems, _availableCoverItems) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.startingPrice, startingPrice) ||
                other.startingPrice == startingPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      coverId,
      const DeepCollectionEquality().hash(_availableCoverItems),
      name,
      shortDescription,
      startingPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoverImplCopyWith<_$CoverImpl> get copyWith =>
      __$$CoverImplCopyWithImpl<_$CoverImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoverImplToJson(
      this,
    );
  }
}

abstract class _Cover implements Cover {
  const factory _Cover(
      {required final String coverId,
      required final List<AvailableCoverItems> availableCoverItems,
      final String? name,
      final String? shortDescription,
      required final StartingPrice startingPrice}) = _$CoverImpl;

  factory _Cover.fromJson(
    Map<String, dynamic> json,
  ) = _$CoverImpl.fromJson;

  @override
  String get coverId;
  @override
  List<AvailableCoverItems> get availableCoverItems;
  @override
  String? get name;
  @override
  String? get shortDescription;
  @override
  StartingPrice get startingPrice;
  @override
  @JsonKey(ignore: true)
  _$$CoverImplCopyWith<_$CoverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StartingPrice _$StartingPriceFromJson(Map<String, dynamic> json) {
  return _StartingPrice.fromJson(json);
}

/// @nodoc
mixin _$StartingPrice {
  num get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartingPriceCopyWith<StartingPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartingPriceCopyWith<$Res> {
  factory $StartingPriceCopyWith(
          StartingPrice value, $Res Function(StartingPrice) then) =
      _$StartingPriceCopyWithImpl<$Res, StartingPrice>;
  @useResult
  $Res call({num amount, String currency});
}

/// @nodoc
class _$StartingPriceCopyWithImpl<$Res, $Val extends StartingPrice>
    implements $StartingPriceCopyWith<$Res> {
  _$StartingPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartingPriceImplCopyWith<$Res>
    implements $StartingPriceCopyWith<$Res> {
  factory _$$StartingPriceImplCopyWith(
          _$StartingPriceImpl value, $Res Function(_$StartingPriceImpl) then) =
      __$$StartingPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num amount, String currency});
}

/// @nodoc
class __$$StartingPriceImplCopyWithImpl<$Res>
    extends _$StartingPriceCopyWithImpl<$Res, _$StartingPriceImpl>
    implements _$$StartingPriceImplCopyWith<$Res> {
  __$$StartingPriceImplCopyWithImpl(
      _$StartingPriceImpl _value, $Res Function(_$StartingPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? currency = null,
  }) {
    return _then(_$StartingPriceImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartingPriceImpl
    with DiagnosticableTreeMixin
    implements _StartingPrice {
  const _$StartingPriceImpl({required this.amount, required this.currency});

  factory _$StartingPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartingPriceImplFromJson(json);

  @override
  final num amount;
  @override
  final String currency;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartingPrice(amount: $amount, currency: $currency)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartingPrice'))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('currency', currency));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartingPriceImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartingPriceImplCopyWith<_$StartingPriceImpl> get copyWith =>
      __$$StartingPriceImplCopyWithImpl<_$StartingPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartingPriceImplToJson(
      this,
    );
  }
}

abstract class _StartingPrice implements StartingPrice {
  const factory _StartingPrice(
      {required final num amount,
      required final String currency}) = _$StartingPriceImpl;

  factory _StartingPrice.fromJson(Map<String, dynamic> json) =
      _$StartingPriceImpl.fromJson;

  @override
  num get amount;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$StartingPriceImplCopyWith<_$StartingPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AvailableCoverItems _$AvailableCoverItemsFromJson(Map<String, dynamic> json) {
  return _AvailableCoverItems.fromJson(json);
}

/// @nodoc
mixin _$AvailableCoverItems {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  set isSelected(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailableCoverItemsCopyWith<AvailableCoverItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableCoverItemsCopyWith<$Res> {
  factory $AvailableCoverItemsCopyWith(
          AvailableCoverItems value, $Res Function(AvailableCoverItems) then) =
      _$AvailableCoverItemsCopyWithImpl<$Res, AvailableCoverItems>;
  @useResult
  $Res call({String name, String id, bool isSelected});
}

/// @nodoc
class _$AvailableCoverItemsCopyWithImpl<$Res, $Val extends AvailableCoverItems>
    implements $AvailableCoverItemsCopyWith<$Res> {
  _$AvailableCoverItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableCoverItemsImplCopyWith<$Res>
    implements $AvailableCoverItemsCopyWith<$Res> {
  factory _$$AvailableCoverItemsImplCopyWith(_$AvailableCoverItemsImpl value,
          $Res Function(_$AvailableCoverItemsImpl) then) =
      __$$AvailableCoverItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id, bool isSelected});
}

/// @nodoc
class __$$AvailableCoverItemsImplCopyWithImpl<$Res>
    extends _$AvailableCoverItemsCopyWithImpl<$Res, _$AvailableCoverItemsImpl>
    implements _$$AvailableCoverItemsImplCopyWith<$Res> {
  __$$AvailableCoverItemsImplCopyWithImpl(_$AvailableCoverItemsImpl _value,
      $Res Function(_$AvailableCoverItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? isSelected = null,
  }) {
    return _then(_$AvailableCoverItemsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableCoverItemsImpl
    with DiagnosticableTreeMixin
    implements _AvailableCoverItems {
  _$AvailableCoverItemsImpl(
      {required this.name, required this.id, this.isSelected = false});

  factory _$AvailableCoverItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableCoverItemsImplFromJson(json);

  @override
  String name;
  @override
  String id;
  @override
  @JsonKey()
  bool isSelected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AvailableCoverItems(name: $name, id: $id, isSelected: $isSelected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AvailableCoverItems'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isSelected', isSelected));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableCoverItemsImplCopyWith<_$AvailableCoverItemsImpl> get copyWith =>
      __$$AvailableCoverItemsImplCopyWithImpl<_$AvailableCoverItemsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableCoverItemsImplToJson(
      this,
    );
  }
}

abstract class _AvailableCoverItems implements AvailableCoverItems {
  factory _AvailableCoverItems(
      {required String name,
      required String id,
      bool isSelected}) = _$AvailableCoverItemsImpl;

  factory _AvailableCoverItems.fromJson(Map<String, dynamic> json) =
      _$AvailableCoverItemsImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  String get id;
  set id(String value);
  @override
  bool get isSelected;
  set isSelected(bool value);
  @override
  @JsonKey(ignore: true)
  _$$AvailableCoverItemsImplCopyWith<_$AvailableCoverItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
