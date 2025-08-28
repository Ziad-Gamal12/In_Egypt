import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Trips/presentation/manager/my_trips_cubit/my_trips_cubit.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomSearchTextField.dart';

class SearchMyTripsSection extends StatefulWidget {
  const SearchMyTripsSection({super.key, required this.isSearching});
  final ValueChanged<bool> isSearching;
  @override
  State<SearchMyTripsSection> createState() => _SearchMyTripsSectionState();
}

class _SearchMyTripsSectionState extends State<SearchMyTripsSection> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        widget.isSearching(true);
        String searchKey = searchController.text.trim();
        context.read<MyTripsCubit>().searchMyTrips(searchKey: searchKey);
      } else {
        widget.isSearching(false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomSearchTextField(
      controller: searchController,
    );
  }
}
