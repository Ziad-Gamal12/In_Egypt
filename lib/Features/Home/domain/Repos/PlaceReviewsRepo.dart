import 'package:dartz/dartz.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt/core/errors/Failures.dart';

abstract class PlaceReviewsRepo {
  Future<Either<Failure, void>> addReview(
      {required String placeId, required PlaceReviewEntity review});
}
