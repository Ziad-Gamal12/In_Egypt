import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Trips/presentation/manager/my_trips_cubit/my_trips_cubit.dart';
import 'package:in_egypt/Features/Trips/presentation/views/MyTripDetailsView.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/CustomMyTripItem.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/EmptyWidget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyTripsSliverList extends StatefulWidget {
  const MyTripsSliverList(
      {super.key, required this.myTrips, required this.isSearching});
  final List<BookingEntity> myTrips;
  final bool isSearching;
  @override
  State<MyTripsSliverList> createState() => _MyTripsSliverListState();
}

class _MyTripsSliverListState extends State<MyTripsSliverList> {
  List<BookingEntity> disPlayedTrips = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTripsCubit, MyTripsState>(
      builder: (context, state) {
        if (state is MyTripsGetMyTripsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: CustomErrorWidget(
                message: state.errmessage,
              ),
            ),
          );
        }
        if (state is MyTripsSearchMyTripsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: CustomErrorWidget(
                message: state.errmessage,
              ),
            ),
          );
        }
        bool isLoading =
            state is MyTripsGetMyTripsLoading && state.isFirstLoading ||
                state is MyTripsSearchMyTripsLoading;
        disPlayedTrips = getDisplayedTrips(state);
        if (disPlayedTrips.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: EmptyWidget(
                message: "لا يوجد رحلات",
              ),
            ),
          );
        }
        return SliverSkeletonizer(
          enabled: isLoading,
          child: SliverList.builder(
              key: PageStorageKey("myTrips"),
              itemCount: disPlayedTrips.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(MyTripDetailsView.routeName,
                            extra: disPlayedTrips[index]);
                      },
                      child: CustomMyTripItem(
                        trip: disPlayedTrips[index],
                      ),
                    ));
              }),
        );
      },
    );
  }

  List<BookingEntity> getDisplayedTrips(MyTripsState state) {
    if (state is MyTripsGetMyTripsLoading ||
        state is MyTripsSearchMyTripsLoading) {
      return List.generate(
          10,
          (_) => BookingEntity(
              user: getUserData(),
              place: null,
              startAt: null,
              qrCodeUrl: "",
              endAt: null,
              createdAt: DateTime.now(),
              daysDuration: 0,
              numberOfGuests: 0,
              status: "",
              id: "",
              totalPrice: 0,
              paymentMethod: ""));
    } else if (widget.isSearching && state is MyTripsSearchMyTripsSuccess) {
      return state.bookings;
    } else {
      return widget.myTrips;
    }
  }
}
