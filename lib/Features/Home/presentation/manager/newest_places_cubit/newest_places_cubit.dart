import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Home/domain/Entities/GetplacesResponseEntity.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:meta/meta.dart';

part 'newest_places_state.dart';

class NewestPlacesCubit extends Cubit<NewestPlacesState> {
  NewestPlacesCubit({required this.placesRepo}) : super(NewestPlacesInitial());
  final PlacesRepo placesRepo;
  void getNewestPlaces({required bool isPaginated}) async {
    emit(PlacesGetNewestPlacesLoading());
    final result = await placesRepo.getNewestPlaces(isPaginated: isPaginated);
    result.fold(
        (failure) => emit(PlacesGetNewestPlacesFailure(failure.message)),
        (response) => emit(PlacesGetNewestPlacesSuccess(response)));
  }
}
