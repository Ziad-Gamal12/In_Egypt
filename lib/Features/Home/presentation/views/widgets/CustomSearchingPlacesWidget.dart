import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomSearchingPlacesWidgetContent.dart';

class CustomSearchingPlacesWidget extends StatefulWidget {
  const CustomSearchingPlacesWidget({super.key});

  @override
  State<CustomSearchingPlacesWidget> createState() =>
      _CustomSearchingPlacesWidgetState();
}

class _CustomSearchingPlacesWidgetState
    extends State<CustomSearchingPlacesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 1,
              offset: const Offset(5, 15),
            )
          ]),
      child: CustomSearchingPlacesWidgetContent(),
    );
  }
}
