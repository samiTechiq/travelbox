// Mocks generated by Mockito 5.4.0 from annotations
// in travelbox/test/demo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:travelbox/domain/data_source/remote/remote_data_source.dart'
as _i3;
import 'package:travelbox/features/cover_quote/model/country.dart' as _i11;
import 'package:travelbox/features/cover_quote/model/cover.dart' as _i6;
import 'package:travelbox/features/cover_quote/usecase/cover_usecase.dart'
as _i7;
import 'package:travelbox/features/cover_quote/usecase/get_counties_usecase.dart'
as _i12;
import 'package:travelbox/features/questions/model/quote_model.dart' as _i8;
import 'package:travelbox/features/questions/usecase/get_quote_usecase.dart'
as _i9;
import 'package:travelbox/features/questions/views/basic_info/usecase/basic_info_usecase.dart'
as _i5;
import 'package:travelbox/features/quote_details/model/order_model.dart' as _i2;
import 'package:travelbox/features/quote_details/usecase/order_usecase.dart'
as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeOrderModel_0 extends _i1.SmartFake implements _i2.OrderModel {
  _FakeOrderModel_0(
      Object parent,
      Invocation parentInvocation,
      ) : super(
    parent,
    parentInvocation,
  );
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i3.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String> userRegister(_i5.RegisterRequest? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #userRegister,
          [params],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<List<_i6.Cover>> getCovers(_i7.GetCoverRequest? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCovers,
          [params],
        ),
        returnValue: _i4.Future<List<_i6.Cover>>.value(<_i6.Cover>[]),
      ) as _i4.Future<List<_i6.Cover>>);
  @override
  _i4.Future<List<_i8.Quote>> getQuote(_i9.GetQuoteRequest? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getQuote,
          [params],
        ),
        returnValue: _i4.Future<List<_i8.Quote>>.value(<_i8.Quote>[]),
      ) as _i4.Future<List<_i8.Quote>>);
  @override
  _i4.Future<_i2.OrderModel> getOrder(_i10.GetOrderRequest? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getOrder,
          [params],
        ),
        returnValue: _i4.Future<_i2.OrderModel>.value(_FakeOrderModel_0(
          this,
          Invocation.method(
            #getOrder,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.OrderModel>);
  @override
  _i4.Future<List<_i11.CountryModel>> getCountries(
      _i12.GetCountriesRequest? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCountries,
          [params],
        ),
        returnValue:
        _i4.Future<List<_i11.CountryModel>>.value(<_i11.CountryModel>[]),
      ) as _i4.Future<List<_i11.CountryModel>>);
}