import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Book/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/BookViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class BookPlaceView extends StatefulWidget {
  const BookPlaceView({super.key});
  static const routeName = '/BookPlace';

  @override
  State<BookPlaceView> createState() => _BookPlaceViewState();
}

class _BookPlaceViewState extends State<BookPlaceView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StepsCubit(),
      child: Scaffold(
        appBar: CustomAppBar(appBartitle: "الحجز"),
        body: BookViewBody(),
      ),
    );
  }
}
