import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomHomeViewAppBar.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomHomeViewFavouritePlacesSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomHomeViewSearchSection.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomPopularPlacesHeader.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/CustomPopularPlacesSliverList.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
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
              child: CustomHomeViewFavouritePlacesSection(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomPopularPlacesHeader(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            CusCustomPopularPlacesSliverList(),
          ],
        ),
      ),
    );
  }
}
