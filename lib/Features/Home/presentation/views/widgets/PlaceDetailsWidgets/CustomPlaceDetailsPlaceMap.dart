import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/place_details-cubit/place_details-cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/TogglePlaceMapSizeWidget.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomFlutterMap.dart';

class CustomPlaceDetailsPlaceMap extends StatefulWidget {
  const CustomPlaceDetailsPlaceMap({super.key});

  @override
  State<CustomPlaceDetailsPlaceMap> createState() =>
      _CustomPlaceDetailsPlaceMapState();
}

class _CustomPlaceDetailsPlaceMapState
    extends State<CustomPlaceDetailsPlaceMap> {
  @override
  Widget build(BuildContext context) {
    PlaceEntity place = context.read<PlaceEntity>();
    return BlocSelector<PlaceDetailsCubit, PlaceDetailsState, bool>(
      selector: (state) {
        if (state is PlaceDetailsToggleMapSize) {
          return state.isExpanded;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(seconds: 1),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(state == true ? 0 : 20),
            border: Border.all(color: kMainColor, width: 2),
          ),
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(state == true ? 0 : 20),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CustomFlutterMap(
                        latitude: place.latitude,
                        longitude: place.longitude,
                      ),
                    ),
                    Positioned(
                        top: 10, left: 10, child: TogglePlaceMapSizeWidget())
                  ],
                )),
          ),
        );
      },
    );
  }
}
