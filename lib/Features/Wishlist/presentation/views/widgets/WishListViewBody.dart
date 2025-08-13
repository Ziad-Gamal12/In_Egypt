import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/MyWishListSliverList.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomSearchTextField.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kHorizentalPadding, vertical: kVerticalPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CustomSearchTextField(
                    controller: TextEditingController(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            MyWishListSliverList(
              places: [],
            )
          ],
        ));
  }
}
