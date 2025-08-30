import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/domain/Entities/SelectPlaceCategoryEntity.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt/Features/Home/presentation/manager/places_categories_cubit/places_categories_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CategoryPlacesViewWidgets/CategoryPlacesViewBody.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class CategoryPlacesView extends StatelessWidget {
  const CategoryPlacesView({super.key, required this.category});
  static const String routeName = '/CategoryPlacesView';
  final SelectPlaceCategoryEntity category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCategoriesCubit(
        placesRepo: getIt<PlacesRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          appBartitle: category.arTitle,
        ),
        body: CategoryPlacesViewBody(category: category),
      ),
    );
  }
}
