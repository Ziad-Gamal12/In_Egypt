import 'package:in_egypt/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';

class BookingEntity {
  UserEntity user;
  PlaceEntity? place;
  DateTime? startAt;
  DateTime? endAt;
  DateTime createdAt;
  int? daysDuration;
  int? numberOfGuests;
  String status;
  String id;
  double? totalPrice;
  String? paymentMethod;

  BookingEntity({
    required this.user,
    required this.place,
    required this.startAt,
    required this.endAt,
    required this.createdAt,
    required this.daysDuration,
    required this.numberOfGuests,
    required this.status,
    required this.id,
    required this.totalPrice,
    required this.paymentMethod,
  });
  double calculateTotalPrice() {
    if (place != null) {
      return place!.ticketPrice * numberOfGuests!;
    } else {
      return 0.0;
    }
  }
}
