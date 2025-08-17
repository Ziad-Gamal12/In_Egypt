import 'package:dio/dio.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';

class DioService {
  final Dio dio;
  DioService({required this.dio});
  String baseUrl = "https://staging.fawaterk.com/api/v2/";

  Future<Map<String, dynamic>> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await dio.get(
        "$baseUrl$url",
        queryParameters: queryParameters,
        options: options,
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw DioStatusHandler.handle(e);
    } catch (e) {
      throw CustomException(message: "حدث خطاء ما");
    }
  }

  Future<Map<String, dynamic>> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await dio.post(
        "$baseUrl$url",
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw DioStatusHandler.handle(e);
    } catch (e) {
      throw CustomException(message: "حدث خطاء ما");
    }
  }
}
