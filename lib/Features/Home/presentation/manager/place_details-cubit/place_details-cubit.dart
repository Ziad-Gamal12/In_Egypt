import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Home/domain/Entities/GetPlaceReviewsResponseEntity.dart';
import 'package:in_egypt/Features/Home/domain/Repos/PlaceReviewsRepo.dart';
import 'package:in_egypt/core/Entities/PlaceReviewEntity.dart';
import 'package:meta/meta.dart';

part 'place_details-state.dart';

class PlaceDetailsCubit extends Cubit<PlaceDetailsState> {
  PlaceDetailsCubit({required this.placeReviewsRepo}) : super(PlacesInitial());
  final PlaceReviewsRepo placeReviewsRepo;
  void selectPlaceMainImage({required String url}) {
    emit(PlacesSelectPlaceMainImageSuccess(imageUrl: url));
  }

  Future<void> addReview(
      {required PlaceReviewEntity review, required String placeId}) async {
    emit(PlacesAddReviewLoading());
    final result =
        await placeReviewsRepo.addReview(placeId: placeId, review: review);
    result.fold(
        (failure) => emit(PlacesAddReviewFailure(errMessage: failure.message)),
        (resonse) => emit(PlacesAddReviewSuccess()));
  }

  Future<void> getPlaceReviews(
      {required String placeId, required bool isPaginated}) async {
    emit(PlacesGetPlaceReviewsLoading(
      isFirstLoading: !isPaginated,
    ));
    final result = await placeReviewsRepo.getPlaceReviews(
        placeId: placeId, isPaginated: isPaginated);
    result.fold(
        (failure) =>
            emit(PlacesGetPlaceReviewsFailure(errMessage: failure.message)),
        (resonse) => emit(PlacesGetPlaceReviewsSuccess(response: resonse)));
  }
}
