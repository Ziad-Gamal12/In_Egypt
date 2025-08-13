part of 'places_cubit.dart';

@immutable
sealed class PlacesState {}

final class PlacesInitial extends PlacesState {}

final class PlacesGetPopularPlacesLoading extends PlacesState {}

final class PlacesGetPopularPlacesSuccess extends PlacesState {
  final GetplacesResponseEntity getplacesResponseEntity;
  PlacesGetPopularPlacesSuccess(this.getplacesResponseEntity);
}

final class PlacesGetPopularPlacesFailure extends PlacesState {
  final String errmessage;
  PlacesGetPopularPlacesFailure(this.errmessage);
}

final class PlacesGetNewestPlacesLoading extends PlacesState {}

final class PlacesGetNewestPlacesSuccess extends PlacesState {
  final GetplacesResponseEntity getplacesResponseEntity;
  PlacesGetNewestPlacesSuccess(this.getplacesResponseEntity);
}

final class PlacesGetNewestPlacesFailure extends PlacesState {
  final String errmessage;
  PlacesGetNewestPlacesFailure(this.errmessage);
}

final class PlacesSelectPlaceMainImageSuccess extends PlacesState {
  final String imageUrl;
  PlacesSelectPlaceMainImageSuccess({required this.imageUrl});
}
