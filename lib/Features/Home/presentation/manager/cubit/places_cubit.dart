import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Home/domain/Entities/GetplacesResponseEntity.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:meta/meta.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit({required this.placesRepo}) : super(PlacesInitial());
  final PlacesRepo placesRepo;
  void getPopularPlaces({required bool isPaginated}) async {
    emit(PlacesGetPopularPlacesLoading());
    final result = await placesRepo.getPopularPlaces(isPaginated: isPaginated);
    result.fold(
        (failure) => emit(PlacesGetPopularPlacesFailure(failure.message)),
        (response) => emit(PlacesGetPopularPlacesSuccess(response)));
  }

  void getNewestPlaces({required bool isPaginated}) async {
    emit(PlacesGetNewestPlacesLoading());
    final result = await placesRepo.getNewestPlaces(isPaginated: isPaginated);
    result.fold(
        (failure) => emit(PlacesGetNewestPlacesFailure(failure.message)),
        (response) => emit(PlacesGetNewestPlacesSuccess(response)));
  }

  void selectPlaceMainImage({required String url}) {
    emit(PlacesSelectPlaceMainImageSuccess(imageUrl: url));
  }
}
