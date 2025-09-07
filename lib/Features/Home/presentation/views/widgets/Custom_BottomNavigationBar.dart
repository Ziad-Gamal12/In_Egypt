// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/domain/Entities/BottomnavigationbarEntity.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomBottomNavigationBar_Item.dart';

class CustomBottomnavigationbar extends StatefulWidget {
  CustomBottomnavigationbar(
      {super.key,
      required this.currentIndexChanged,
      required this.currentIndex});
  final ValueChanged<int> currentIndexChanged;
  int currentIndex;

  @override
  State<CustomBottomnavigationbar> createState() =>
      _CustomBottomnavigationbarState();
}

class _CustomBottomnavigationbarState extends State<CustomBottomnavigationbar> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return IntrinsicHeight(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: isDark ? Colors.grey[850] : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
          child: Row(
            children: BottomnavigationbarEntity.bottomnavigationbarEntityList()
                .asMap()
                .entries
                .map((e) {
              int index = e.key;
              BottomnavigationbarEntity bottomnavigationbarEntity = e.value;
              return Expanded(
                flex: widget.currentIndex == index ? 3 : 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.currentIndex = index;
                      widget.currentIndexChanged(index);
                    });
                  },
                  child: CustombottomnavigationbarItem(
                    index: index,
                    isSelected: widget.currentIndex == index ? true : false,
                    bottomnavigationbarEntity: bottomnavigationbarEntity,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
