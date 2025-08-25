import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:lottie/lottie.dart';

class SuccessLottieWidget extends StatelessWidget {
  const SuccessLottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .4,
      child: AspectRatio(
        aspectRatio: 1,
        child: Lottie.asset(Assets.assetsLottieSuccess, repeat: false),
      ),
    );
  }
}
