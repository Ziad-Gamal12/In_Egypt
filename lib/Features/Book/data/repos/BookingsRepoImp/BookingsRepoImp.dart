import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Book/domain/repos/BookingsRepo/BookingsRepo.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';
import 'package:in_egypt/core/errors/Failures.dart';
import 'package:in_egypt/core/models/BookingModel.dart';
import 'package:in_egypt/core/services/DataBaseService.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';

class BookingsRepoImp implements BookingsRepo {
  final Databaseservice databaseservice;
  BookingsRepoImp({required this.databaseservice});
  @override
  Future<Either<Failure, void>> addBooking(
      {required BookingEntity bookingEntity}) async {
    try {
      Map<String, dynamic> json =
          BookingModel.fromEntity(bookingEntity).toJson();
      final resulte = await databaseservice.setData(
          requirements: FireStoreRequirmentsEntity(
              collection: Backendkeys.bookingsCollection,
              docId: bookingEntity.id),
          data: json);
      return Right(null);
    } on CustomException catch (e) {
      log(e.message);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }
}
