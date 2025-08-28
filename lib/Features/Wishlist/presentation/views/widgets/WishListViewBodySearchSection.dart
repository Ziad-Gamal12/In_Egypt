import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/search_places_cubit/search_places_cubit.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomSearchTextField.dart';

class WishListViewBodySearchSection extends StatefulWidget {
  const WishListViewBodySearchSection({super.key, required this.isSearching});
  final ValueChanged<bool> isSearching;
  @override
  State<WishListViewBodySearchSection> createState() =>
      _WishListViewBodySearchSectionState();
}

class _WishListViewBodySearchSectionState
    extends State<WishListViewBodySearchSection> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        widget.isSearching(true);
        String searchKey = searchController.text.trim();
        context.read<SearchPlacesCubit>().searchPlaces(searchKey: searchKey);
      } else {
        widget.isSearching(false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomSearchTextField(controller: searchController),
        const SizedBox(height: 40),
      ],
    );
  }
}
