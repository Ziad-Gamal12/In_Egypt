import 'package:flutter/material.dart';
import 'package:in_egypt/constant.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';
import 'package:in_egypt/core/widgets/CustomFlutterMap.dart';
import 'package:provider/provider.dart';

class CustomPlaceDetailsPlaceMap extends StatelessWidget {
  const CustomPlaceDetailsPlaceMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PlaceEntity place = context.read<PlaceEntity>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kMainColor, width: 1),
      ),
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomFlutterMap(
              latitude: place.latitude,
              longitude: place.longitude,
            )),
      ),
    );
  }
}
