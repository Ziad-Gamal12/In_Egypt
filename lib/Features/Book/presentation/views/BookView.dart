import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/BookViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class BookPlaceView extends StatefulWidget {
  const BookPlaceView({super.key});
  static const routeName = '/BookPlace';

  @override
  State<BookPlaceView> createState() => _BookPlaceViewState();
}

class _BookPlaceViewState extends State<BookPlaceView> {
  String title = "تفاصيل الحجز";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: title),
      body: BookViewBody(
        titleChanged: (value) {
          setState(() {
            title = value;
          });
        },
      ),
    );
  }
}
