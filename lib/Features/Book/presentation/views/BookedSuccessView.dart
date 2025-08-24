import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/BookedSuccessViewWidgets/BookedSuccessViewBody.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';

class BookedSuccessView extends StatelessWidget {
  const BookedSuccessView({super.key, required this.bookingEntity});
  static String routeName = '/BookedSuccessView';
  final BookingEntity bookingEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookedSuccessViewBody(
        bookingEntity: bookingEntity,
      ),
    );
  }
}
