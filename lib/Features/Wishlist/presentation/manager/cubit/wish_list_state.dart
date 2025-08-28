part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}

final class WishListAddPlaceToWishListLoading extends WishListState {
  final String placeId;
  WishListAddPlaceToWishListLoading({required this.placeId});
}

final class WishListAddPlaceToWishListSuccess extends WishListState {
  final String placeId;
  WishListAddPlaceToWishListSuccess({required this.placeId});
}

final class WishListAddPlaceToWishListFailure extends WishListState {
  final String errMessage;
  final String placeId;
  WishListAddPlaceToWishListFailure(
      {required this.errMessage, required this.placeId});
}

final class WishListRemovePlaceFromWishListLoading extends WishListState {
  final String placeId;
  WishListRemovePlaceFromWishListLoading({required this.placeId});
}

final class WishListRemovePlaceFromWishListSuccess extends WishListState {
  final String placeId;
  WishListRemovePlaceFromWishListSuccess({required this.placeId});
}

final class WishListRemovePlaceFromWishListFailure extends WishListState {
  final String errMessage;
  final String placeId;
  WishListRemovePlaceFromWishListFailure(
      {required this.errMessage, required this.placeId});
}

final class WishListGetWishListLoading extends WishListState {
  final bool isFirstLoad;

  WishListGetWishListLoading({required this.isFirstLoad});
}

final class WishListGetWishListSuccess extends WishListState {
  final GetWishListResponseEntity response;

  WishListGetWishListSuccess({required this.response});
}

final class WishListGetWishListFailure extends WishListState {
  final String errMessage;

  WishListGetWishListFailure({required this.errMessage});
}

final class WishListCheckFavouritePlacesLoading extends WishListState {}

final class WishListCheckFavouritePlacesSuccess extends WishListState {
  final Map<String, bool> favouritePlaces;
  WishListCheckFavouritePlacesSuccess({required this.favouritePlaces});
}

final class WishListCheckFavouritePlacesFailure extends WishListState {
  final String errMessage;
  WishListCheckFavouritePlacesFailure({required this.errMessage});
}
