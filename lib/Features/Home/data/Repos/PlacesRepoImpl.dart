import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Home/domain/Entities/GetplacesResponseEntity.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt/core/Entities/FireStorePaginateResponse.dart';
import 'package:in_egypt/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';
import 'package:in_egypt/core/errors/Failures.dart';
import 'package:in_egypt/core/models/PlaceModel.dart';
import 'package:in_egypt/core/services/DataBaseService.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';

class PlacesRepoImpl implements PlacesRepo {
  final Databaseservice databaseservice;
  PlacesRepoImpl({required this.databaseservice});

  Map<String, dynamic> query = {
    "orderBy": "createdAt",
    "limit": 10,
    "startAfter": null,
  };
  DocumentSnapshot<Object?>? lastDocumentSnapshot;
  @override
  Future<Either<Failure, GetplacesResponseEntity>> getNewestPlaces({
    required bool isPaginated,
  }) async {
    try {
      if (isPaginated) {
        query["startAfter"] = lastDocumentSnapshot;
      } else {
        query["startAfter"] = null;
      }
      FireStoreResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.placesCollection,
        ),
        query: query,
      );

      final placesData = response.listData ?? [];

      if (placesData.isNotEmpty && response.lastDocumentSnapshot != null) {
        lastDocumentSnapshot = response.lastDocumentSnapshot;
      }

      List<PlaceEntity> placesEntity =
          placesData.map((e) => PlaceModel.fromJson(e).toEntity()).toList();

      bool hasMore = response.hasMore ?? placesData.length == query["limit"];

      return right(
        GetplacesResponseEntity(places: placesEntity, hasMore: hasMore),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PlaceEntity>>> searchPlaces({
    required String searchKey,
  }) async {
    try {
      FireStoreResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.placesCollection,
        ),
        query: {"searchField": "name", "searchValue": searchKey},
      );
      if (response.listData == null) {
        return right([]);
      }
      List<PlaceEntity> placesEntity = response.listData!
          .map((e) => PlaceModel.fromJson(e).toEntity())
          .toList();
      return right(placesEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  Map<String, dynamic> getPopularPlacesquery = {
    "orderBy": "rating",
    "limit": 10,
    "startAfter": null,
  };
  DocumentSnapshot<Object?>? getPopularPlaceslastDocumentSnapshot;
  @override
  Future<Either<Failure, GetplacesResponseEntity>> getPopularPlaces(
      {required bool isPaginated}) async {
    try {
      if (isPaginated) {
        getPopularPlacesquery["startAfter"] =
            getPopularPlaceslastDocumentSnapshot;
      } else {
        getPopularPlacesquery["startAfter"] = null;
      }
      FireStoreResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.placesCollection,
        ),
        query: getPopularPlacesquery,
      );

      final placesData = response.listData ?? [];

      if (placesData.isNotEmpty && response.lastDocumentSnapshot != null) {
        getPopularPlaceslastDocumentSnapshot = response.lastDocumentSnapshot;
      }

      List<PlaceEntity> placesEntity =
          placesData.map((e) => PlaceModel.fromJson(e).toEntity()).toList();

      bool hasMore = response.hasMore ??
          placesData.length == getPopularPlacesquery["limit"];

      return right(
        GetplacesResponseEntity(places: placesEntity, hasMore: hasMore),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
