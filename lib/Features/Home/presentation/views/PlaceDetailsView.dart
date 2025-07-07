import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBody.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({super.key});
  static const String routeName = "/PlaceDetailsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBartitle: "أهرامات الجيزة",
      ),
      body: PlaceDetailsViewBody(),
    );
  }
}
