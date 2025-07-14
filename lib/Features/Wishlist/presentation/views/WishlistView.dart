import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/WishListViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "المفضلة"),
      body: WishListViewBody(),
    );
  }
}
