import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
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
    "filters": {
      "field": "user.uid",
      "value": getUserData().uid,
      "operator": "==",
    },
    "searchValue": getUserData().uid,
    "startAfter": null,
    "limit": 10
  };
  DocumentSnapshot<Object?>? lastDocumentSnapshot;

  @override
  Future<Either<Failure, GetMyTripsResponseEntity>> getMyTrips(
      {required bool isPaginated}) async {
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
}
