import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt/Features/Home/presentation/manager/newest_places_cubit/newest_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/manager/popular_places_cubit/popular_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/HomeViewBodyContent.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                PopularPlacesCubit(placesRepo: getIt<PlacesRepo>())),
        BlocProvider(
            create: (context) =>
                NewestPlacesCubit(placesRepo: getIt<PlacesRepo>())),
      ],
      child: SafeArea(
        child: HomeViewBodyContent(),
      ),
    );
  }
}
