// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';

class DioService {
  final Dio dio;
  DioService({required this.dio});

  Future<Map<String, dynamic>> getData({
    required String fullUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await dio.get(
        fullUrl,
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
    required String fullUrl,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await dio.post(
        fullUrl,
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
