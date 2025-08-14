part of 'newest_places_cubit.dart';

@immutable
sealed class NewestPlacesState {}

final class NewestPlacesInitial extends NewestPlacesState {}

final class PlacesGetNewestPlacesLoading extends NewestPlacesState {}

final class PlacesGetNewestPlacesSuccess extends NewestPlacesState {
  final GetplacesResponseEntity getplacesResponseEntity;
  PlacesGetNewestPlacesSuccess(this.getplacesResponseEntity);
}

final class PlacesGetNewestPlacesFailure extends NewestPlacesState {
  final String errmessage;
  PlacesGetNewestPlacesFailure(this.errmessage);
}
