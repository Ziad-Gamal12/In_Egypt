import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Wishlist/domain/Entities/GetWishListResponseEntity.dart';
import 'package:in_egypt/Features/Wishlist/domain/Repos/WishListRepo.dart';
import 'package:in_egypt/core/Entities/FireStorePaginateResponse.dart';
import 'package:in_egypt/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';
import 'package:in_egypt/core/errors/Failures.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:in_egypt/core/models/PlaceModel.dart';
import 'package:in_egypt/core/services/DataBaseService.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';

class WishListRepoImp implements WishListRepo {
  final Databaseservice dataBaseService;

  WishListRepoImp({required this.dataBaseService});

  @override
  Future<Either<Failure, void>> addPlaceToWishList(
      {required String placeId}) async {
    try {
      final result = await dataBaseService.setData(
          requirements: FireStoreRequirmentsEntity(
              collection: Backendkeys.usersCollection,
              docId: getUserData().uid,
              subCollection: Backendkeys.wishlistSubCollection,
              subDocId: placeId),
          data: {"placeId": placeId});
      return Right(result);
    } on CustomException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure(message: "حدث خطأ ما"));
    }
  }

  Map<String, dynamic> getWishListPlaceIdsQuery = {
    "startAfter": null,
    "limit": 10
  };
  DocumentSnapshot? lastDocumentSnapshot;
  Future<Either<Failure, List<String>>> getWishListPlaceIds(
      {required bool isPaginated}) async {
    try {
      if (isPaginated) {
        getWishListPlaceIdsQuery["startAfter"] = lastDocumentSnapshot;
      } else {
        getWishListPlaceIdsQuery["startAfter"] = null;
      }
      FireStoreResponse result = await dataBaseService.getData(
          requirements: FireStoreRequirmentsEntity(
        collection: Backendkeys.usersCollection,
        docId: getUserData().uid,
        subCollection: Backendkeys.wishlistSubCollection,
      ));
      List placeIds = result.listData ?? [];
      if (placeIds.isNotEmpty && result.lastDocumentSnapshot != null) {
        lastDocumentSnapshot = result.lastDocumentSnapshot;
      }
      List<String> placesIds =
          placeIds.map((e) => e["placeId"] as String).toList();
      return Right(placesIds);
    } on CustomException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, GetWishListResponseEntity>> getWishList(
      {required bool isPaginated}) async {
    try {
      final result = await getWishListPlaceIds(isPaginated: isPaginated);
      return await result.fold((failure) async {
        return Left(failure);
      }, (placeIds) async {
        List<PlaceEntity> places = [];
        for (String id in placeIds) {
          FireStoreResponse response = await dataBaseService.getData(
              requirements: FireStoreRequirmentsEntity(
            collection: Backendkeys.placesCollection,
            docId: id,
          ));
          if (response.docData == null) {
            continue;
          }
          places.add(PlaceModel.fromJson(response.docData!).toEntity());
        }
        return Right(GetWishListResponseEntity(
            places: places, hasMore: placeIds.length == 10));
      });
    } on CustomException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, void>> removePlaceFromWishList(
      {required String placeId}) async {
    try {
      final result = await dataBaseService.deleteDoc(
          collectionKey: Backendkeys.usersCollection,
          docId: getUserData().uid,
          subCollectionKey: Backendkeys.wishlistSubCollection,
          subDocId: placeId);
      return Right(result);
    } on CustomException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, bool>> isPlaceAddedToWishList(
      {required String placeId}) async {
    try {
      final result = await dataBaseService.isDataExists(
          key: Backendkeys.usersCollection,
          docId: getUserData().uid,
          subCollectionKey: Backendkeys.wishlistSubCollection,
          subDocId: placeId);
      return Right(result);
    } on CustomException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure(message: "حدث خطأ ما"));
    }
  }
}
