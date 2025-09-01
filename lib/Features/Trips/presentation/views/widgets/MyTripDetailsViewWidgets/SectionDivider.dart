import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Divider(
      height: 40,
      color: isDark == true ? Colors.grey.shade800 : Colors.grey.shade200,
      thickness: 2,
    );
  }
}
