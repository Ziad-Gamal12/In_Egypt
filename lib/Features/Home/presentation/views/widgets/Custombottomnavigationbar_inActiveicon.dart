// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class Custombottomnavigationbar_inActiveicon extends StatelessWidget {
  const Custombottomnavigationbar_inActiveicon(
      {super.key, required this.iconPath});
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: SvgPicture.asset(
          iconPath,
          fit: BoxFit.scaleDown,
        ));
  }
}
