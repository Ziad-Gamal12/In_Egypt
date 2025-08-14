import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'place_details-state.dart';

class PlaceDetailsCubit extends Cubit<PlaceDetailsState> {
  PlaceDetailsCubit() : super(PlacesInitial());

  void selectPlaceMainImage({required String url}) {
    emit(PlacesSelectPlaceMainImageSuccess(imageUrl: url));
  }
}
