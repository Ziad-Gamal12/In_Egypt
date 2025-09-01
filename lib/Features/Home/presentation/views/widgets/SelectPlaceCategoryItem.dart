import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/domain/Entities/SelectPlaceCategoryEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';

class SelectPlaceCategoryItem extends StatelessWidget {
  const SelectPlaceCategoryItem({
    super.key,
    required this.e,
  });
  final SelectPlaceCategoryEntity e;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor:
                isDark ? Colors.grey.shade800 : Colors.grey.shade50,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                e.imagePath,
                height: 50,
                width: 50,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            e.arTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles(
              context,
            )
                .regular13
                .copyWith(color: isDark == true ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
