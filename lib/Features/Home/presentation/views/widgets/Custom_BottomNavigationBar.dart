// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/domain/Entities/BottomnavigationbarEntity.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomBottomNavigationBar_Item.dart';

class CustomBottomnavigationbar extends StatefulWidget {
  const CustomBottomnavigationbar({super.key, required this.currentIndex});
  final ValueChanged<int> currentIndex;
  @override
  State<CustomBottomnavigationbar> createState() =>
      _CustomBottomnavigationbarState();
}

class _CustomBottomnavigationbarState extends State<CustomBottomnavigationbar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return IntrinsicHeight(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: isDark ? Colors.black : Colors.white,
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black26 : Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
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
                flex: currentIndex == index ? 3 : 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      widget.currentIndex(currentIndex);
                    });
                  },
                  child: CustombottomnavigationbarItem(
                    index: index,
                    isSelected: currentIndex == index ? true : false,
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
