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
// get place reviews

final class PlacesGetPlaceReviewsSuccess extends PlaceDetailsState {
  final GetPlaceReviewsResponseEntity response;
  PlacesGetPlaceReviewsSuccess({required this.response});
}

final class PlacesGetPlaceReviewsLoading extends PlaceDetailsState {
  final bool isFirstLoading;
  PlacesGetPlaceReviewsLoading({required this.isFirstLoading});
}

final class PlacesGetPlaceReviewsFailure extends PlaceDetailsState {
  final String errMessage;
  PlacesGetPlaceReviewsFailure({required this.errMessage});
}
