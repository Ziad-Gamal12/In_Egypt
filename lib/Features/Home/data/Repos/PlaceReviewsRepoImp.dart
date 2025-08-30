import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlaceReviewsRepo.dart';
import 'package:in_egypt/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';
import 'package:in_egypt/core/errors/Failures.dart';
import 'package:in_egypt/core/models/PlaceReviewModel.dart';
import 'package:in_egypt/core/services/DataBaseService.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';

class PlaceReviewsRepoImp implements PlaceReviewsRepo {
  final Databaseservice dataBaseService;

  PlaceReviewsRepoImp({required this.dataBaseService});

  @override
  Future<Either<Failure, void>> addReview(
      {required String placeId, required PlaceReviewEntity review}) async {
    try {
      final json = PlaceReviewModel.fromEntity(review).toJson();
      final result = await dataBaseService.setData(
          requirements: FireStoreRequirmentsEntity(
              collection: Backendkeys.placesCollection,
              docId: placeId,
              subCollection: Backendkeys.reviewsSubCollection,
              subDocId: review.user.uid),
          data: json);
      return right(result);
    } on CustomException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: "حدث خطأ ما"));
    }
  }
}
