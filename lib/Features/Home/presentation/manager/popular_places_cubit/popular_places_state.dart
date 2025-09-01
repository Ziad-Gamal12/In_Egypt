part of 'popular_places_cubit.dart';

@immutable
sealed class PopularPlacesState {}

final class PopularPlacesInitial extends PopularPlacesState {}

final class PlacesGetPopularPlacesLoading extends PopularPlacesState {
  final bool isFirstLoading;
  PlacesGetPopularPlacesLoading({required this.isFirstLoading});
}

final class PlacesGetPopularPlacesSuccess extends PopularPlacesState {
  final GetplacesResponseEntity getplacesResponseEntity;
  PlacesGetPopularPlacesSuccess(this.getplacesResponseEntity);
}

final class PlacesGetPopularPlacesFailure extends PopularPlacesState {
  final String errmessage;
  PlacesGetPopularPlacesFailure(this.errmessage);
}
