// ignore_for_file: file_names

import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';

class PlaceReviewEntity {
  final UserEntity user;
  double rating;
  String review;
  final DateTime createdAt;

  PlaceReviewEntity({
    required this.user,
    required this.rating,
    required this.review,
    required this.createdAt,
  });
}
