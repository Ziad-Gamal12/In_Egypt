part of 'places_categories_cubit.dart';

@immutable
sealed class PlacesCategoriesState {}

final class PlacesCategoriesInitial extends PlacesCategoriesState {}

final class PlacesCategoriesGetPlacesByCategoryLoading
    extends PlacesCategoriesState {}

final class PlacesCategoriesGetPlacesByCategoryFailure
    extends PlacesCategoriesState {
  final String errMessage;
  PlacesCategoriesGetPlacesByCategoryFailure({required this.errMessage});
}

final class PlacesCategoriesGetPlacesByCategorySuccess
    extends PlacesCategoriesState {
  final GetplacesResponseEntity response;
  PlacesCategoriesGetPlacesByCategorySuccess({required this.response});
}
