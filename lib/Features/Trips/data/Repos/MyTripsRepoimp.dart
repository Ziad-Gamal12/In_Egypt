import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/Features/Trips/domain/Entities/GetMyTripsResponseEntity.dart';
import 'package:in_egypt/Features/Trips/domain/Repos/MyTripsRepo.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/Entities/FireStorePaginateResponse.dart';
import 'package:in_egypt/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';
import 'package:in_egypt/core/errors/Failures.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:in_egypt/core/models/BookingModel.dart';
import 'package:in_egypt/core/services/DataBaseService.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';

class MyTripsRepoimp implements MyTripsRepo {
  final Databaseservice databaseservice;

  MyTripsRepoimp({required this.databaseservice});
  Map<String, dynamic> getMyTripsQueery = {
    "orderBy": "createdAt",
    "filters": [
      {
        "field": "user.uid",
        "value": null,
        "operator": "==",
      }
    ] as List<Map<String, dynamic>>,
    "startAfter": null,
    "limit": 10
  };
  DocumentSnapshot<Object?>? lastDocumentSnapshot;

  @override
  Future<Either<Failure, GetMyTripsResponseEntity>> getMyTrips(
      {required bool isPaginated}) async {
    UserEntity user = getUserData();
    getMyTripsQueery["filters"][0]["value"] = user.uid;
    try {
      if (isPaginated) {
        getMyTripsQueery["startAfter"] = lastDocumentSnapshot;
      } else {
        getMyTripsQueery["startAfter"] = null;
      }

      FireStoreResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.bookingsCollection,
        ),
        query: getMyTripsQueery,
      );
      final placesData = response.listData ?? [];
      if (placesData.isNotEmpty && response.lastDocumentSnapshot != null) {
        lastDocumentSnapshot = response.lastDocumentSnapshot;
      }
      List<BookingEntity> placesEntity =
          placesData.map((e) => BookingModel.fromJson(e).toEntity()).toList();
      bool hasMore =
          response.hasMore ?? placesData.length == getMyTripsQueery["limit"];

      return right(
        GetMyTripsResponseEntity(bookings: placesEntity, hasMore: hasMore),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  Map<String, dynamic> searchMyTripsQueery = {
    "orderBy": "createdAt",
    "filters": [
      {
        "field": "user.uid",
        "value": getUserData().uid,
        "operator": "==",
      }
    ] as List<Map<String, dynamic>>,
    "searchField": "place.name",
    "searchValue": null,
  };
  @override
  Future<Either<Failure, List<BookingEntity>>> searchMyTrips(
      {required String searchKey}) async {
    try {
      searchMyTripsQueery["searchValue"] = searchKey;
      FireStoreResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
            collection: Backendkeys.bookingsCollection),
        query: searchMyTripsQueery,
      );
      if (response.listData == null) {
        return right([]);
      }
      List<BookingEntity> bookingsEntity = response.listData!
          .map((e) => BookingModel.fromJson(e).toEntity())
          .toList();
      return right(bookingsEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
