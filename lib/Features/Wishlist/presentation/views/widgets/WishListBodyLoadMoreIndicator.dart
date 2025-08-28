import 'package:flutter/material.dart';
import 'package:in_egypt/constant.dart';

class WishListBodyLoadMoreIndicator extends StatelessWidget {
  final bool isLoading;
  const WishListBodyLoadMoreIndicator({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox();
    return Center(
      child: CircularProgressIndicator(color: kMainColor),
    );
  }
}
