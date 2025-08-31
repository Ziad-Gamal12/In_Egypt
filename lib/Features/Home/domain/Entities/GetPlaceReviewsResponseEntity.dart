import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';

class GetPlaceReviewsResponseEntity {
  final List<PlaceReviewEntity> reviews;
  final bool hasMore;

  GetPlaceReviewsResponseEntity({required this.reviews, required this.hasMore});
}
