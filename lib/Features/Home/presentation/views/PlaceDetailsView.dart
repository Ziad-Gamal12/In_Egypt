import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/place_details-cubit/place_details-cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBody.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({super.key, required this.placeEntity});
  static const String routeName = "/PlaceDetailsView";
  final PlaceEntity placeEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceDetailsCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          appBartitle: placeEntity.name,
        ),
        body: PlaceDetailsViewBody(
          place: placeEntity,
        ),
      ),
    );
  }
}
