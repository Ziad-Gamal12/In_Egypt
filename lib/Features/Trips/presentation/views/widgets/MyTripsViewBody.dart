import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Trips/presentation/manager/my_trips_cubit/my_trips_cubit.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripsSliverList.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/SearchMyTripsSection.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';

class MyTripsViewBody extends StatefulWidget {
  const MyTripsViewBody({super.key});

  @override
  State<MyTripsViewBody> createState() => _MyTripsViewBodyState();
}

class _MyTripsViewBodyState extends State<MyTripsViewBody> {
  late ScrollController scrollController;
  bool hasMore = true;
  bool isSearching = false;
  List<BookingEntity> fetchedMyTrips = [];
  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<MyTripsCubit>();
      cubit.getMyTrips(isPaginated: false);
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent - 200 &&
            hasMore &&
            cubit.state is! MyTripsGetMyTripsLoading &&
            !isSearching) {
          cubit.getMyTrips(isPaginated: true);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyTripsCubit, MyTripsState>(
        listener: (context, state) {
          if (state is MyTripsGetMyTripsSuccess) {
            if (!hasMore && state.getMyTripsResponseEntity.hasMore) return;
            hasMore = state.getMyTripsResponseEntity.hasMore;
            fetchedMyTrips.addAll(state.getMyTripsResponseEntity.bookings);
            setState(() {});
          }
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kHorizentalPadding, vertical: kVerticalPadding),
            child: CustomScrollView(controller: scrollController, slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(child: SearchMyTripsSection(
                isSearching: (val) {
                  setState(() {
                    isSearching = val;
                  });
                },
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
              MyTripsSliverList(
                myTrips: fetchedMyTrips,
                isSearching: isSearching,
              )
            ])));
  }
}
