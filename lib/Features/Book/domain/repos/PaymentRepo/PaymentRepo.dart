import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Book/domain/entities/RequestPaymentMethodReponse.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/PaymentMethodEntity.dart';
import 'package:in_egypt/core/errors/Failures.dart';

abstract class PaymentRepo {
  Future<Either<Failure, PaymentMethodEntity>> fetchPaymentMethods();
  Future<Either<Failure, RequestPaymentMethodReponse>> requestPaymentMethod(
      {required BookingEntity bookingEntity, required int methodId});
}
