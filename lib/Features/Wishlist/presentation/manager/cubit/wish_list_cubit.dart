import 'package:bloc/bloc.dart';
import 'package:in_egypt/Features/Wishlist/domain/Entities/GetWishListResponseEntity.dart';
import 'package:in_egypt/Features/Wishlist/domain/Repos/WishListRepo.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit({required this.wishListRepo}) : super(WishListInitial());
  final WishListRepo wishListRepo;
  Future<void> getWishList({required bool isPaginated}) async {
    emit(WishListGetWishListLoading());
    final result = await wishListRepo.getWishList(isPaginated: isPaginated);
    result.fold((failure) {
      emit(WishListGetWishListFailure(errMessage: failure.message));
    }, (response) {
      emit(WishListGetWishListSuccess(response: response));
    });
  }

  Future<void> addPlaceToWishList({required String placeId}) async {
    emit(WishListAddPlaceToWishListLoading(
      placeId: placeId,
    ));
    final result = await wishListRepo.addPlaceToWishList(placeId: placeId);
    result.fold((failure) {
      emit(WishListAddPlaceToWishListFailure(
          errMessage: failure.message, placeId: placeId));
    }, (response) {
      emit(WishListAddPlaceToWishListSuccess(
        placeId: placeId,
      ));
    });
  }

  Future<void> removePlaceFromWishList({required String placeId}) async {
    emit(WishListRemovePlaceFromWishListLoading(
      placeId: placeId,
    ));
    final result = await wishListRepo.removePlaceFromWishList(placeId: placeId);
    result.fold((failure) {
      emit(WishListRemovePlaceFromWishListFailure(
          errMessage: failure.message, placeId: placeId));
    }, (response) {
      emit(WishListRemovePlaceFromWishListSuccess(
        placeId: placeId,
      ));
    });
  }

  Future<void> checkFavouritePlaces({required List<PlaceEntity> places}) async {
    try {
      emit(WishListCheckFavouritePlacesLoading());
      final futures = places.map((place) async {
        final result =
            await wishListRepo.isPlaceAddedToWishList(placeId: place.id);
        return result.fold(
          (failure) {
            emit(WishListCheckFavouritePlacesFailure(
                errMessage: failure.message));

            return MapEntry(place.id, false);
          },
          (response) => MapEntry(place.id, response),
        );
      }).toList();
      final entries = await Future.wait(futures);
      Map<String, bool> favouritePlaces = Map.fromEntries(entries);
      emit(WishListCheckFavouritePlacesSuccess(
        favouritePlaces: favouritePlaces,
      ));
    } on Exception catch (e) {
      emit(WishListCheckFavouritePlacesFailure(errMessage: e.toString()));
    }
  }
}
