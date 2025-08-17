import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt/core/Entities/PaymentMethodsEntities/DatumEntity.dart';
import 'package:in_egypt/core/utils/textStyles.dart';
import 'package:in_egypt/core/widgets/CustomCachedNetworkImage.dart';

class CustomPaymentMethodItem extends StatelessWidget {
  const CustomPaymentMethodItem(
      {super.key, required this.isSelected, required this.method});
  final bool isSelected;
  final DatumEntity method;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade50,
              blurRadius: 50,
              spreadRadius: 1,
              offset: const Offset(5, 15),
            )
          ],
          border: Border.all(
              color: isSelected ? Colors.green : Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(children: [
          CustomCachedNetworkImage(imageUrl: method.logo ?? ""),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              method.nameAr ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles(context)
                  .semiBold16
                  .copyWith(color: Colors.black),
            ),
          ),
          Spacer(),
          Visibility(
            visible: isSelected,
            child: Icon(
              FontAwesomeIcons.circleCheck,
              color: Colors.green,
            ),
          )
        ]));
  }
}
