import 'package:dartz/dartz.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/PaymentMethodEntity.dart';
import 'package:in_egypt/core/errors/Failures.dart';

abstract class PaymentRepo {
  Future<Either<Failure, PaymentMethodEntity>> fetchPaymentMethods();
}
