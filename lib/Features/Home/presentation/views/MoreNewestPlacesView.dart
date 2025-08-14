import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt/Features/Home/presentation/manager/newest_places_cubit/newest_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/MoreNewestPlacesViewWidgets/MoreNewestPlacesViewBody.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class MoreNewestPlacesView extends StatelessWidget {
  const MoreNewestPlacesView({super.key});
  static String routeName = '/MoreNewestPlacesView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewestPlacesCubit(placesRepo: getIt<PlacesRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          appBartitle: "أحدث الأماكن",
        ),
        body: MoreNewestPlacesViewBody(),
      ),
    );
  }
}
