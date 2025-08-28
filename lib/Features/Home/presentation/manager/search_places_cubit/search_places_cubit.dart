import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:meta/meta.dart';

part 'search_places_state.dart';

class SearchPlacesCubit extends Cubit<SearchPlacesState> {
  SearchPlacesCubit({required this.placesRepo}) : super(SearchPlacesInitial());
  final PlacesRepo placesRepo;
  Future<void> searchPlaces({required String searchKey}) async {
    emit(SearchPlacesLoading());
    final result = await placesRepo.searchPlaces(searchKey: searchKey);
    result.fold(
        (failure) => emit(SearchPlacesFailure(errMessage: failure.message)),
        (places) => emit(SearchPlacesSuccess(places: places)));
  }
}
