import 'package:in_egypt/core/Entities/PlaceEntity.dart';

class GetWishListResponseEntity {
  final List<PlaceEntity> places;
  final bool hasMore;
  GetWishListResponseEntity({required this.places, required this.hasMore});
}
