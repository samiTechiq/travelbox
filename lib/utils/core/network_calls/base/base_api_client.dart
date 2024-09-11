// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
//
//
// import '../model/network_call_response.dart';
//
// abstract class BaseApiClient {
//   Future<NetworkCallResponse<T>> call<T>(Future<Response<T>> request);
// }
//
// @LazySingleton(as: BaseApiClient)
// class BaseApiClientImp extends BaseApiClient {
//   @override
//   Future<NetworkCallResponse<T>> call<T>(Future<Response<T>> request) async {
//     try {
//       final data = (await request).data as T;
//       return NetworkCallResponse.successful(data: data);
//     } on DioError catch (error) {
//       throw ServerException(error.message);
//     } catch (error) {
//       throw ServerException(error.toString());
//     }
//   }
// }
