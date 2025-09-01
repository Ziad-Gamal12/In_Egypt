import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/newest_places_cubit/newest_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/MoreNewestPlacesViewWidgets/CustomMoreNewestPlacesBodyContent.dart';
import 'package:in_egypt/constant.dart';

class MoreNewestPlacesViewBody extends StatefulWidget {
  const MoreNewestPlacesViewBody({super.key});

  @override
  State<MoreNewestPlacesViewBody> createState() =>
      _MoreNewestPlacesViewBodyState();
}

class _MoreNewestPlacesViewBodyState extends State<MoreNewestPlacesViewBody> {
  @override
  void initState() {
    context.read<NewestPlacesCubit>().getNewestPlaces(isPaginated: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding, vertical: kVerticalPadding),
      child: CustomMoreNewestPlacesBodyContent(),
    );
  }
}
