import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Wishlist/domain/Entities/GetWishListResponseEntity.dart';
import 'package:in_egypt/core/errors/Failures.dart';

abstract class WishListRepo {
  Future<Either<Failure, void>> addPlaceToWishList({required String placeId});

  Future<Either<Failure, void>> removePlaceFromWishList(
      {required String placeId});

  Future<Either<Failure, GetWishListResponseEntity>> getWishList(
      {required bool isPaginated});

  Future<Either<Failure, bool>> isPlaceAddedToWishList({
    required String placeId,
  });
}
