import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Trips/presentation/manager/my_trips_cubit/my_trips_cubit.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/CustomMyTripItem.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/helpers/getUserData.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyTripsSliverList extends StatefulWidget {
  const MyTripsSliverList({super.key, required this.myTrips});
  final List<BookingEntity> myTrips;
  @override
  State<MyTripsSliverList> createState() => _MyTripsSliverListState();
}

class _MyTripsSliverListState extends State<MyTripsSliverList> {
  List<BookingEntity> disPlayedTrips = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTripsCubit, MyTripsState>(
      builder: (context, state) {
        bool isLoading = state is MyTripsGetMyTripsLoading;
        disPlayedTrips = getDisplayedTrips(state);
        return SliverSkeletonizer(
          enabled: isLoading,
          child: SliverList.builder(
              key: PageStorageKey("myTrips"),
              itemCount: disPlayedTrips.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomMyTripItem(
                    trip: disPlayedTrips[index],
                  )
                      .animate()
                      .moveY(
                        begin: 50,
                      )
                      .fadeIn(duration: 1.seconds, delay: (index * 200).ms),
                );
              }),
        );
      },
    );
  }

  List<BookingEntity> getDisplayedTrips(MyTripsState state) {
    List<BookingEntity> trips = state is MyTripsGetMyTripsLoading
        ? List.generate(
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
                paymentMethod: ""))
        : widget.myTrips;

    return trips;
  }
}
