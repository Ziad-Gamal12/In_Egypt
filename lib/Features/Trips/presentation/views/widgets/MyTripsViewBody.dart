import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Trips/presentation/manager/my_trips_cubit/my_trips_cubit.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/MyTripsSliverList.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt/core/widgets/CustomTextFields/CustomSearchTextField.dart';

class MyTripsViewBody extends StatefulWidget {
  const MyTripsViewBody({super.key});

  @override
  State<MyTripsViewBody> createState() => _MyTripsViewBodyState();
}

class _MyTripsViewBodyState extends State<MyTripsViewBody> {
  late ScrollController scrollController;
  bool hasMore = true;
  List<BookingEntity> fetchedMyTrips = [];
  @override
  void initState() {
    context.read<MyTripsCubit>().getMyTrips(isPaginated: false);
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          hasMore) {
        context.read<MyTripsCubit>().getMyTrips(isPaginated: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyTripsCubit, MyTripsState>(
      listener: (context, state) {
        if (state is MyTripsGetMyTripsSuccess) {
          if (!hasMore && state.getMyTripsResponseEntity.hasMore) return;
          hasMore = state.getMyTripsResponseEntity.hasMore;
          fetchedMyTrips.addAll(state.getMyTripsResponseEntity.bookings);
          setState(() {});
        }
      },
      builder: (context, state) {
        if (state is MyTripsGetMyTripsFailure) {
          return Center(
            child: CustomErrorWidget(
              message: state.errmessage,
            ),
          );
        }
        return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kHorizentalPadding, vertical: kVerticalPadding),
            child: CustomScrollView(controller: scrollController, slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                  child: CustomSearchTextField(
                controller: TextEditingController(),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              ),
              MyTripsSliverList(
                myTrips: fetchedMyTrips,
              )
            ]));
      },
    );
  }
}
