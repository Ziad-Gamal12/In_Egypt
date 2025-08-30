part of 'place_details-cubit.dart';

@immutable
sealed class PlaceDetailsState {}

final class PlacesInitial extends PlaceDetailsState {}

final class PlacesSelectPlaceMainImageSuccess extends PlaceDetailsState {
  final String imageUrl;
  PlacesSelectPlaceMainImageSuccess({required this.imageUrl});
}
// add review

final class PlacesAddReviewSuccess extends PlaceDetailsState {}

final class PlacesAddReviewLoading extends PlaceDetailsState {}

final class PlacesAddReviewFailure extends PlaceDetailsState {
  final String errMessage;
  PlacesAddReviewFailure({required this.errMessage});
}
