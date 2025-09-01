import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/popular_places_cubit/popular_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/MorePopularPlacesViewWidgets/CustomMorePopularPlacesBodyContent.dart';
import 'package:in_egypt/constant.dart';

class MorePopularPlacesViewBody extends StatefulWidget {
  const MorePopularPlacesViewBody({super.key});

  @override
  State<MorePopularPlacesViewBody> createState() =>
      _MorePopularPlacesViewBodyState();
}

class _MorePopularPlacesViewBodyState extends State<MorePopularPlacesViewBody> {
  @override
  void initState() {
    context.read<PopularPlacesCubit>().getPopularPlaces(isPaginated: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding, vertical: kVerticalPadding),
      child: CustomMorePopularPlacesBodyContent(),
    );
  }
}
