import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Home/domain/Entities/GetplacesResponseEntity.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlacesRepo.dart';
import 'package:meta/meta.dart';

part 'places_categories_state.dart';

class PlacesCategoriesCubit extends Cubit<PlacesCategoriesState> {
  PlacesCategoriesCubit({required this.placesRepo})
      : super(PlacesCategoriesInitial());
  final PlacesRepo placesRepo;

  Future<void> getPlacesByCategory(
      {required String category, required bool isPaginated}) async {
    emit(PlacesCategoriesGetPlacesByCategoryLoading(
      isFirstLoading: !isPaginated,
    ));
    final result = await placesRepo.getPlacesByCategory(
        category: category, isPaginated: isPaginated);
    result.fold(
        (failure) => emit(PlacesCategoriesGetPlacesByCategoryFailure(
            errMessage: failure.message)),
        (resonse) => emit(
            PlacesCategoriesGetPlacesByCategorySuccess(response: resonse)));
  }
}
