import 'package:flutter/material.dart';
import 'package:in_egypt/core/utils/images.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Widget child;
  final bool isloading;

  const CustomLoadingWidget({
    super.key,
    required this.child,
    required this.isloading,
  });

  @override
  Widget build(BuildContext context) {
    if (!isloading) return child;

    return AbsorbPointer(
      absorbing: true,
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6), // خلفية شفافة
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Lottie.asset(
                Assets.assetsLottieCamelWalk,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
