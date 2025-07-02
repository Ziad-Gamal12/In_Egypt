import 'package:flutter/material.dart';

class OnBoardingPageViewItemBackground extends StatelessWidget {
  const OnBoardingPageViewItemBackground({
    super.key,
    required this.imagePath,
    required this.child,
  });

  final String imagePath;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: IntrinsicHeight(child: child),
    );
  }
}
