import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 40,
      color: Colors.grey.shade200,
      thickness: 2,
    );
  }
}
