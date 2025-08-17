import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:in_egypt/Features/Book/domain/repos/PaymentRepo/PaymentRepo.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/PaymentMethodEntity.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';
import 'package:in_egypt/core/errors/Failures.dart';
import 'package:in_egypt/core/models/payment_method_model/payment_method_model.dart';
import 'package:in_egypt/core/services/DioService.dart';

class PaymentRepoImpl implements PaymentRepo {
  final DioService dioService;

  PaymentRepoImpl({required this.dioService});
  @override
  Future<Either<Failure, PaymentMethodEntity>> fetchPaymentMethods() async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $fawaterkTestaccessToken',
      };
      final result = await dioService.getData(
          url: "getPaymentmethods", options: Options(headers: headers));
      return Right(PaymentMethodModel.fromJson(result).toEntity());
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ApiException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }
}
