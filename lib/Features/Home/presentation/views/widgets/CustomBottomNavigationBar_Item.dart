// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/domain/Entities/BottomnavigationbarEntity.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomBottomNavigationBarActiveIcon.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/Custombottomnavigationbar_inActiveicon.dart';

class CustombottomnavigationbarItem extends StatelessWidget {
  const CustombottomnavigationbarItem(
      {super.key,
      required this.isSelected,
      required this.index,
      required this.bottomnavigationbarEntity});
  final bool isSelected;
  final int index;
  final BottomnavigationbarEntity bottomnavigationbarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected == false
        ? Custombottomnavigationbar_inActiveicon(
            iconPath: bottomnavigationbarEntity.iconPath,
          )
        : Custombottomnavigationbaractiveicon(
            iconPath: bottomnavigationbarEntity.iconPath,
            title: bottomnavigationbarEntity.title,
          );
  }
}
