part of 'search_places_cubit.dart';

@immutable
sealed class SearchPlacesState {}

final class SearchPlacesInitial extends SearchPlacesState {}

final class SearchPlacesLoading extends SearchPlacesState {}

final class SearchPlacesSuccess extends SearchPlacesState {
  final List<PlaceEntity> places;
  SearchPlacesSuccess({required this.places});
}

final class SearchPlacesFailure extends SearchPlacesState {
  final String errMessage;
  SearchPlacesFailure({required this.errMessage});
}
