import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripsSliverList.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomSearchTextField.dart';

class MyTripsViewBody extends StatelessWidget {
  const MyTripsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kHorizentalPadding, vertical: kVerticalPadding),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
              child: CustomSearchTextField(
            controller: TextEditingController(),
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          MyTripsSliverList()
        ]));
  }
}
