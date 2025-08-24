import 'package:dartz/dartz.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/errors/Failures.dart';

abstract class BookingsRepo {
  Future<Either<Failure, String>> generateAndUploadQrCode({required String id});
  Future<Either<Failure, void>> addBooking(
      {required BookingEntity bookingEntity});
}
