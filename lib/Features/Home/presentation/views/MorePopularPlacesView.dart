import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt/Features/Home/presentation/manager/popular_places_cubit/popular_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/MorePopularPlacesViewWidgets/MorePopularPlacesViewBody.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class MorePopularPlacesView extends StatelessWidget {
  const MorePopularPlacesView({super.key});
  static String routeName = '/MorePopularPlacesView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularPlacesCubit(placesRepo: getIt<PlacesRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          appBartitle: "الأكثر تقييما",
        ),
        body: MorePopularPlacesViewBody(),
      ),
    );
  }
}
