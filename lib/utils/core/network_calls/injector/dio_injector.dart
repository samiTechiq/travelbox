import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/resources/r.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: R.globals.baseUrl,
        ),
      );
}
