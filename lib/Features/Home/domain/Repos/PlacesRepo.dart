import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Home/domain/Entities/GetplacesResponseEntity.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/errors/Failures.dart';

abstract class PlacesRepo {
  Future<Either<Failure, GetplacesResponseEntity>> getNewestPlaces({
    required bool isPaginated,
  });
  Future<Either<Failure, GetplacesResponseEntity>> getPopularPlaces({
    required bool isPaginated,
  });
  Future<Either<Failure, List<PlaceEntity>>> searchPlaces({
    required String searchKey,
  });
}
