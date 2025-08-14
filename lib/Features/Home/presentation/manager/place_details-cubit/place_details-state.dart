part of 'place_details-cubit.dart';

@immutable
sealed class PlaceDetailsState {}

final class PlacesInitial extends PlaceDetailsState {}

final class PlacesSelectPlaceMainImageSuccess extends PlaceDetailsState {
  final String imageUrl;
  PlacesSelectPlaceMainImageSuccess({required this.imageUrl});
}
