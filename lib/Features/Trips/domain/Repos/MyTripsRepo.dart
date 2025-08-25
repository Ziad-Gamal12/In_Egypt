import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Trips/domain/Entities/GetMyTripsResponseEntity.dart';
import 'package:in_egypt/core/errors/Failures.dart';

abstract class MyTripsRepo {
  Future<Either<Failure, GetMyTripsResponseEntity>> getMyTrips(
      {required bool isPaginated});
}
