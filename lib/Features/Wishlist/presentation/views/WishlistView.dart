import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt/Features/Home/presentation/manager/search_places_cubit/search_places_cubit.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/widgets/WishListViewBody.dart';
import 'package:in_egypt/core/services/get_it_Service.dart';
import 'package:in_egypt/core/widgets/CustomAppBar.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchPlacesCubit(
        placesRepo: getIt<PlacesRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          appBartitle: "المفضلة",
          isBackButton: false,
        ),
        body: WishListViewBody(),
      ),
    );
  }
}
