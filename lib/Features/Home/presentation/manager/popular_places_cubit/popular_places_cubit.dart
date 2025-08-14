import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Home/domain/Entities/GetplacesResponseEntity.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:meta/meta.dart';

part 'popular_places_state.dart';

class PopularPlacesCubit extends Cubit<PopularPlacesState> {
  PopularPlacesCubit({required this.placesRepo})
      : super(PopularPlacesInitial());
  final PlacesRepo placesRepo;
  void getPopularPlaces({required bool isPaginated}) async {
    emit(PlacesGetPopularPlacesLoading());
    final result = await placesRepo.getPopularPlaces(isPaginated: isPaginated);
    result.fold(
        (failure) => emit(PlacesGetPopularPlacesFailure(failure.message)),
        (response) => emit(PlacesGetPopularPlacesSuccess(response)));
  }
}
