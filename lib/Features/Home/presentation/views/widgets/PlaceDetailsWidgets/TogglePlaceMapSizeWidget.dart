import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/place_details-cubit/place_details-cubit.dart';

class TogglePlaceMapSizeWidget extends StatelessWidget {
  const TogglePlaceMapSizeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PlaceDetailsCubit, PlaceDetailsState, bool>(
      selector: (state) {
        if (state is PlaceDetailsToggleMapSize) {
          return state.isExpanded;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return CircleAvatar(
          backgroundColor: Colors.black54,
          radius: 30,
          child: IconButton(
              onPressed: () {
                context
                    .read<PlaceDetailsCubit>()
                    .toggleMapSize(isExpand: !state);
              },
              icon: Icon(
                state == true ? Icons.fullscreen_exit : Icons.fullscreen,
                color: Colors.white,
                size: 30,
              )),
        );
      },
    );
  }
}
