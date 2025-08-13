import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt/Features/Home/presentation/manager/cubit/places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/HomeViewBodyContent.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit(
        placesRepo: getIt<PlacesRepo>(),
      ),
      child: SafeArea(
        child: HomeViewBodyContent(),
      ),
    );
  }
}
