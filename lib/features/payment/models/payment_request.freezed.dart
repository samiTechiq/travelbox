// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) {
  return _PaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$PaymentRequest {
  String get merchantAccount => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  String get returnUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentRequestCopyWith<PaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRequestCopyWith<$Res> {
  factory $PaymentRequestCopyWith(
          PaymentRequest value, $Res Function(PaymentRequest) then) =
      _$PaymentRequestCopyWithImpl<$Res, PaymentRequest>;
  @useResult
  $Res call(
      {String merchantAccount,
      PaymentMethod paymentMethod,
      Amount amount,
      String reference,
      String returnUrl});

  $PaymentMethodCopyWith<$Res> get paymentMethod;
  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class _$PaymentRequestCopyWithImpl<$Res, $Val extends PaymentRequest>
    implements $PaymentRequestCopyWith<$Res> {
  _$PaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantAccount = null,
    Object? paymentMethod = null,
    Object? amount = null,
    Object? reference = null,
    Object? returnUrl = null,
  }) {
    return _then(_value.copyWith(
      merchantAccount: null == merchantAccount
          ? _value.merchantAccount
          : merchantAccount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      returnUrl: null == returnUrl
          ? _value.returnUrl
          : returnUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res> get paymentMethod {
    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AmountCopyWith<$Res> get amount {
    return $AmountCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentRequestImplCopyWith<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  factory _$$PaymentRequestImplCopyWith(_$PaymentRequestImpl value,
          $Res Function(_$PaymentRequestImpl) then) =
      __$$PaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String merchantAccount,
      PaymentMethod paymentMethod,
      Amount amount,
      String reference,
      String returnUrl});

  @override
  $PaymentMethodCopyWith<$Res> get paymentMethod;
  @override
  $AmountCopyWith<$Res> get amount;
}

/// @nodoc
class __$$PaymentRequestImplCopyWithImpl<$Res>
    extends _$PaymentRequestCopyWithImpl<$Res, _$PaymentRequestImpl>
    implements _$$PaymentRequestImplCopyWith<$Res> {
  __$$PaymentRequestImplCopyWithImpl(
      _$PaymentRequestImpl _value, $Res Function(_$PaymentRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantAccount = null,
    Object? paymentMethod = null,
    Object? amount = null,
    Object? reference = null,
    Object? returnUrl = null,
  }) {
    return _then(_$PaymentRequestImpl(
      merchantAccount: null == merchantAccount
          ? _value.merchantAccount
          : merchantAccount // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      returnUrl: null == returnUrl
          ? _value.returnUrl
          : returnUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentRequestImpl implements _PaymentRequest {
  const _$PaymentRequestImpl(
      {required this.merchantAccount,
      required this.paymentMethod,
      required this.amount,
      required this.reference,
      required this.returnUrl});

  factory _$PaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentRequestImplFromJson(json);

  @override
  final String merchantAccount;
  @override
  final PaymentMethod paymentMethod;
  @override
  final Amount amount;
  @override
  final String reference;
  @override
  final String returnUrl;

  @override
  String toString() {
    return 'PaymentRequest(merchantAccount: $merchantAccount, paymentMethod: $paymentMethod, amount: $amount, reference: $reference, returnUrl: $returnUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentRequestImpl &&
            (identical(other.merchantAccount, merchantAccount) ||
                other.merchantAccount == merchantAccount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.returnUrl, returnUrl) ||
                other.returnUrl == returnUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, merchantAccount, paymentMethod,
      amount, reference, returnUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentRequestImplCopyWith<_$PaymentRequestImpl> get copyWith =>
      __$$PaymentRequestImplCopyWithImpl<_$PaymentRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentRequestImplToJson(
      this,
    );
  }
}

abstract class _PaymentRequest implements PaymentRequest {
  const factory _PaymentRequest(
      {required final String merchantAccount,
      required final PaymentMethod paymentMethod,
      required final Amount amount,
      required final String reference,
      required final String returnUrl}) = _$PaymentRequestImpl;

  factory _PaymentRequest.fromJson(Map<String, dynamic> json) =
      _$PaymentRequestImpl.fromJson;

  @override
  String get merchantAccount;
  @override
  PaymentMethod get paymentMethod;
  @override
  Amount get amount;
  @override
  String get reference;
  @override
  String get returnUrl;
  @override
  @JsonKey(ignore: true)
  _$$PaymentRequestImplCopyWith<_$PaymentRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Amount _$AmountFromJson(Map<String, dynamic> json) {
  return _Amount.fromJson(json);
}

/// @nodoc
mixin _$Amount {
  String get currency => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmountCopyWith<Amount> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountCopyWith<$Res> {
  factory $AmountCopyWith(Amount value, $Res Function(Amount) then) =
      _$AmountCopyWithImpl<$Res, Amount>;
  @useResult
  $Res call({String currency, String value});
}

/// @nodoc
class _$AmountCopyWithImpl<$Res, $Val extends Amount>
    implements $AmountCopyWith<$Res> {
  _$AmountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AmountImplCopyWith<$Res> implements $AmountCopyWith<$Res> {
  factory _$$AmountImplCopyWith(
          _$AmountImpl value, $Res Function(_$AmountImpl) then) =
      __$$AmountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currency, String value});
}

/// @nodoc
class __$$AmountImplCopyWithImpl<$Res>
    extends _$AmountCopyWithImpl<$Res, _$AmountImpl>
    implements _$$AmountImplCopyWith<$Res> {
  __$$AmountImplCopyWithImpl(
      _$AmountImpl _value, $Res Function(_$AmountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? value = null,
  }) {
    return _then(_$AmountImpl(
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AmountImpl implements _Amount {
  const _$AmountImpl({required this.currency, required this.value});

  factory _$AmountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AmountImplFromJson(json);

  @override
  final String currency;
  @override
  final String value;

  @override
  String toString() {
    return 'Amount(currency: $currency, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currency, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountImplCopyWith<_$AmountImpl> get copyWith =>
      __$$AmountImplCopyWithImpl<_$AmountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AmountImplToJson(
      this,
    );
  }
}

abstract class _Amount implements Amount {
  const factory _Amount(
      {required final String currency,
      required final String value}) = _$AmountImpl;

  factory _Amount.fromJson(Map<String, dynamic> json) = _$AmountImpl.fromJson;

  @override
  String get currency;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$AmountImplCopyWith<_$AmountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String get type => throw _privateConstructorUsedError;
  String get encryptedCardNumber => throw _privateConstructorUsedError;
  String get encryptedExpiryMonth => throw _privateConstructorUsedError;
  String get encryptedExpiryYear => throw _privateConstructorUsedError;
  String get encryptedSecurityCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call(
      {String type,
      String encryptedCardNumber,
      String encryptedExpiryMonth,
      String encryptedExpiryYear,
      String encryptedSecurityCode});
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? encryptedCardNumber = null,
    Object? encryptedExpiryMonth = null,
    Object? encryptedExpiryYear = null,
    Object? encryptedSecurityCode = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedCardNumber: null == encryptedCardNumber
          ? _value.encryptedCardNumber
          : encryptedCardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedExpiryMonth: null == encryptedExpiryMonth
          ? _value.encryptedExpiryMonth
          : encryptedExpiryMonth // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedExpiryYear: null == encryptedExpiryYear
          ? _value.encryptedExpiryYear
          : encryptedExpiryYear // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedSecurityCode: null == encryptedSecurityCode
          ? _value.encryptedSecurityCode
          : encryptedSecurityCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String encryptedCardNumber,
      String encryptedExpiryMonth,
      String encryptedExpiryYear,
      String encryptedSecurityCode});
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? encryptedCardNumber = null,
    Object? encryptedExpiryMonth = null,
    Object? encryptedExpiryYear = null,
    Object? encryptedSecurityCode = null,
  }) {
    return _then(_$PaymentMethodImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedCardNumber: null == encryptedCardNumber
          ? _value.encryptedCardNumber
          : encryptedCardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedExpiryMonth: null == encryptedExpiryMonth
          ? _value.encryptedExpiryMonth
          : encryptedExpiryMonth // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedExpiryYear: null == encryptedExpiryYear
          ? _value.encryptedExpiryYear
          : encryptedExpiryYear // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedSecurityCode: null == encryptedSecurityCode
          ? _value.encryptedSecurityCode
          : encryptedSecurityCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl implements _PaymentMethod {
  const _$PaymentMethodImpl(
      {required this.type,
      required this.encryptedCardNumber,
      required this.encryptedExpiryMonth,
      required this.encryptedExpiryYear,
      required this.encryptedSecurityCode});

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final String type;
  @override
  final String encryptedCardNumber;
  @override
  final String encryptedExpiryMonth;
  @override
  final String encryptedExpiryYear;
  @override
  final String encryptedSecurityCode;

  @override
  String toString() {
    return 'PaymentMethod(type: $type, encryptedCardNumber: $encryptedCardNumber, encryptedExpiryMonth: $encryptedExpiryMonth, encryptedExpiryYear: $encryptedExpiryYear, encryptedSecurityCode: $encryptedSecurityCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.encryptedCardNumber, encryptedCardNumber) ||
                other.encryptedCardNumber == encryptedCardNumber) &&
            (identical(other.encryptedExpiryMonth, encryptedExpiryMonth) ||
                other.encryptedExpiryMonth == encryptedExpiryMonth) &&
            (identical(other.encryptedExpiryYear, encryptedExpiryYear) ||
                other.encryptedExpiryYear == encryptedExpiryYear) &&
            (identical(other.encryptedSecurityCode, encryptedSecurityCode) ||
                other.encryptedSecurityCode == encryptedSecurityCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, encryptedCardNumber,
      encryptedExpiryMonth, encryptedExpiryYear, encryptedSecurityCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod(
      {required final String type,
      required final String encryptedCardNumber,
      required final String encryptedExpiryMonth,
      required final String encryptedExpiryYear,
      required final String encryptedSecurityCode}) = _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  String get type;
  @override
  String get encryptedCardNumber;
  @override
  String get encryptedExpiryMonth;
  @override
  String get encryptedExpiryYear;
  @override
  String get encryptedSecurityCode;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
