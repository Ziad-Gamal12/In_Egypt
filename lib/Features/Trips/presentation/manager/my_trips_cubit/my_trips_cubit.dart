import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Trips/domain/Entities/GetMyTripsResponseEntity.dart';
import 'package:in_egypt/Features/Trips/domain/Repos/MyTripsRepo.dart';
import 'package:meta/meta.dart';

part 'my_trips_state.dart';

class MyTripsCubit extends Cubit<MyTripsState> {
  MyTripsCubit({required this.myTripsRepo}) : super(MyTripsInitial());
  final MyTripsRepo myTripsRepo;
  Future<void> getMyTrips({required bool isPaginated}) async {
    emit(MyTripsGetMyTripsLoading());
    final result = await myTripsRepo.getMyTrips(isPaginated: isPaginated);
    result.fold(
        (failure) =>
            emit(MyTripsGetMyTripsFailure(errmessage: failure.message)),
        (response) =>
            emit(MyTripsGetMyTripsSuccess(getMyTripsResponseEntity: response)));
  }
}
