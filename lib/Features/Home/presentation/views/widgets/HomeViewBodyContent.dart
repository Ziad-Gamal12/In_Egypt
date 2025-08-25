import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/newest_places_cubit/newest_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/manager/popular_places_cubit/popular_places_cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomHomeViewAppBar.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomHomeViewPopularPlacesSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomHomeViewSearchSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomNewestPlacesHeader.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomNewestPlacesSliverList.dart';

class HomeViewBodyContent extends StatefulWidget {
  const HomeViewBodyContent({
    super.key,
  });

  @override
  State<HomeViewBodyContent> createState() => _HomeViewBodyContentState();
}

class _HomeViewBodyContentState extends State<HomeViewBodyContent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PopularPlacesCubit>().getPopularPlaces(isPaginated: false);
      context.read<NewestPlacesCubit>().getNewestPlaces(isPaginated: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, top: 20, bottom: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomHomeViewAppBar(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomHomeViewSearchSection(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomHomeViewPopularPlacesSection(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomNewestPlacesHeader(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          CustomNewestPlacesSliverList(),
        ],
      ),
    );
  }
}
