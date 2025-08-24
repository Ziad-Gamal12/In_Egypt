import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:in_egypt/Features/Auth/data/models/UserModel.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/models/PlaceModel.dart';

class BookingModel {
  final Map<String, dynamic> user;
  final Map<String, dynamic> place;
  final DateTime startAt;
  final DateTime endAt;
  final String qrCodeUrl;
  final DateTime createdAt;
  final int daysDuration;
  final int numberOfGuests;
  final String status;
  final String id;
  final double totalPrice;
  final String paymentMethod;

  BookingModel({
    required this.user,
    required this.place,
    required this.startAt,
    required this.endAt,
    required this.createdAt,
    required this.daysDuration,
    required this.numberOfGuests,
    required this.status,
    required this.qrCodeUrl,
    required this.id,
    required this.totalPrice,
    required this.paymentMethod,
  });
  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      user: json['user'],
      place: json['place'],
      startAt: (json['startAt'] as Timestamp).toDate(),
      endAt: (json['endAt'] as Timestamp).toDate(),
      qrCodeUrl: json['qrCodeUrl'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      daysDuration: (json['daysDuration'] as num).toInt(),
      numberOfGuests: (json['numberOfGuests'] as num).toInt(),
      status: json['status'],
      id: json['id'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      paymentMethod: json['paymentMethod'],
    );
  }
  factory BookingModel.fromEntity(BookingEntity entity) {
    return BookingModel(
      user: UserModel.fromEntity(entity.user).toJson(),
      place: PlaceModel.fromEntity(entity.place!).toJson(),
      qrCodeUrl: entity.qrCodeUrl,
      startAt: entity.startAt ?? DateTime.now(),
      endAt: entity.endAt ?? DateTime.now(),
      createdAt: entity.createdAt,
      daysDuration: entity.daysDuration ?? 0,
      numberOfGuests: entity.numberOfGuests ?? 0,
      status: entity.status,
      id: entity.id,
      totalPrice: entity.totalPrice ?? 0.0,
      paymentMethod: entity.paymentMethod ?? "",
    );
  }

  BookingEntity toEntity() {
    return BookingEntity(
      user: UserModel.fromJson(user).toEntity(),
      place: PlaceModel.fromJson(place).toEntity(),
      startAt: startAt,
      qrCodeUrl: qrCodeUrl,
      endAt: endAt,
      createdAt: createdAt,
      daysDuration: daysDuration,
      numberOfGuests: numberOfGuests,
      status: status,
      id: id,
      totalPrice: totalPrice,
      paymentMethod: paymentMethod,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'place': place,
      'startAt': startAt,
      'endAt': endAt,
      'createdAt': createdAt,
      'daysDuration': daysDuration,
      'numberOfGuests': numberOfGuests,
      'qrCodeUrl': qrCodeUrl,
      'status': status,
      'id': id,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
    };
  }
}
