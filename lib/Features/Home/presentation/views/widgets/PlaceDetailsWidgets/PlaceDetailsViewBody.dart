import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt/Features/Home/presentation/manager/place_details-cubit/place_details-cubit.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/CustomPlaceDetailsPlaceMap.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBodyContent.dart';

class PlaceDetailsViewBody extends StatefulWidget {
  const PlaceDetailsViewBody({
    super.key,
  });

  @override
  State<PlaceDetailsViewBody> createState() => _PlaceDetailsViewBodyState();
}

class _PlaceDetailsViewBodyState extends State<PlaceDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceDetailsCubit, PlaceDetailsState>(
        builder: (context, state) {
      if (state is PlaceDetailsToggleMapSize && state.isExpanded) {
        return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CustomPlaceDetailsPlaceMap());
      }
      return PlaceDetailsViewBodyContent();
    });
  }
}
