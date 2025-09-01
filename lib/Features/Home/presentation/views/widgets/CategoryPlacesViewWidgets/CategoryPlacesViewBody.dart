import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/domain/Entities/SelectPlaceCategoryEntity.dart';
import 'package:in_egypt/Features/Home/presentation/manager/places_categories_cubit/places_categories_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CategoryPlacesViewWidgets/CategoryPlacesBodyContent.dart';
import 'package:in_egypt/constant.dart';

class CategoryPlacesViewBody extends StatefulWidget {
  const CategoryPlacesViewBody({super.key, required this.category});
  final SelectPlaceCategoryEntity category;

  @override
  State<CategoryPlacesViewBody> createState() => _CategoryPlacesViewBodyState();
}

class _CategoryPlacesViewBodyState extends State<CategoryPlacesViewBody> {
  @override
  void initState() {
    context.read<PlacesCategoriesCubit>().getPlacesByCategory(
        category: widget.category.enTitle, isPaginated: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding, vertical: kVerticalPadding),
      child: CategoryPlacesBodyContent(
        category: widget.category.enTitle,
      ),
    );
  }
}
