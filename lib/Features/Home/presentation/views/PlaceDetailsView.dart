import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt/Features/Home/presentation/manager/cubit/places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBody.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({super.key, required this.placeEntity});
  static const String routeName = "/PlaceDetailsView";
  final PlaceEntity placeEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit(
        placesRepo: getIt<PlacesRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          appBartitle: "أهرامات الجيزة",
        ),
        body: PlaceDetailsViewBody(
          place: placeEntity,
        ),
      ),
    );
  }
}
