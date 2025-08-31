import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:in_egypt/Features/Home/domain/Entities/GetPlaceReviewsResponseEntity.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlaceReviewsRepo.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:in_egypt/core/errors/Exceptioons.dart';
import 'package:in_egypt/core/errors/Failures.dart';
import 'package:in_egypt/core/models/PlaceReviewModel.dart';
import 'package:in_egypt/core/services/DataBaseService.dart';
import 'package:in_egypt/core/services/DioService.dart';
import 'package:in_egypt/core/utils/BackEndkeys.dart';

class PlaceReviewsRepoImp implements PlaceReviewsRepo {
  final Databaseservice dataBaseService;
  final DioService dioService;
  PlaceReviewsRepoImp(
      {required this.dataBaseService, required this.dioService});

  @override
  Future<Either<Failure, void>> addReview(
      {required String placeId, required PlaceReviewEntity review}) async {
    try {
      final json = PlaceReviewModel.fromEntity(review).toJson();
      await dataBaseService.setData(
          requirements: FireStoreRequirmentsEntity(
              collection: Backendkeys.placesCollection,
              docId: placeId,
              subCollection: Backendkeys.reviewsSubCollection,
              subDocId: review.user.uid),
          data: json);
      log("added review to firestore successfully");
      final response =
          await updateRating(placeId: placeId, rating: review.rating);
      return response.fold((failure) async {
        log("failed to update rating");
        log(failure.message);
        await removeReview(placeId: placeId, reviewId: review.user.uid);
        return left(Failure(message: failure.message));
      }, (response) {
        return right(response);
      });
    } on CustomException catch (e) {
      log(e.message);
      return left(Failure(message: e.message));
    } catch (e) {
      log(e.toString());
      return left(Failure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, void>> updateRating(
      {required String placeId, required double rating}) async {
    try {
      await dioService.postData(
        fullUrl:
            "https://bnhhxkelcpnuneupdddw.supabase.co/functions/v1/update-rating",
        data: {
          'placeId': placeId,
          'newRating': rating,
        },
        options: Options(headers: {
          'Authorization': 'Bearer $supaBaseAnonKey',
          'Content-Type': 'application/json',
        }),
      );
      return right(null);
    } on ApiException catch (e) {
      log("====${e.message}");
      return left(Failure(message: e.message));
    } on CustomException catch (e) {
      log(e.message);
      return left(Failure(message: e.message));
    } catch (e) {
      log(e.toString());
      return left(Failure(message: "حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, void>> removeReview(
      {required String placeId, required String reviewId}) async {
    try {
      final result = await dataBaseService.deleteDoc(
          collectionKey: Backendkeys.placesCollection,
          docId: placeId,
          subCollectionKey: Backendkeys.reviewsSubCollection,
          subDocId: reviewId);
      return right(result);
    } on CustomException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: "حدث خطأ ما"));
    }
  }

  Map<String, dynamic> getPlaceReviewsQuery = {
    "orderBy": "createdAt",
    "limit": 10,
    "startAfter": null,
  };
  DocumentSnapshot<Object?>? getPlaceReviewslastDocumentSnapshot;

  @override
  Future<Either<Failure, GetPlaceReviewsResponseEntity>> getPlaceReviews(
      {required String placeId, required bool isPaginated}) async {
    try {
      if (isPaginated) {
        getPlaceReviewsQuery["startAfter"] =
            getPlaceReviewslastDocumentSnapshot;
      } else {
        getPlaceReviewsQuery["startAfter"] = null;
      }
      final result = await dataBaseService.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.placesCollection,
          docId: placeId,
          subCollection: Backendkeys.reviewsSubCollection,
        ),
        query: getPlaceReviewsQuery,
      );

      final reviewsData = result.listData ?? [];

      if (reviewsData.isNotEmpty && result.lastDocumentSnapshot != null) {
        getPlaceReviewslastDocumentSnapshot = result.lastDocumentSnapshot!;
      }

      List<PlaceReviewEntity> reviewsEntity = reviewsData
          .map((e) => PlaceReviewModel.fromJson(e).toEntity())
          .toList();

      bool hasMore =
          result.hasMore ?? reviewsData.length == getPlaceReviewsQuery["limit"];

      return right(
        GetPlaceReviewsResponseEntity(reviews: reviewsEntity, hasMore: hasMore),
      );
    } on CustomException catch (e, s) {
      log("$e\n$s");
      return left(Failure(message: e.message));
    } catch (e, s) {
      log("$e\n$s");
      return left(Failure(message: "حدث خطأ ما"));
    }
  }
}
