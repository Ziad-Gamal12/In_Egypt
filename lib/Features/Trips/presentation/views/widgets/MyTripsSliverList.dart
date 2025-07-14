import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt/Features/Trips/presentation/views/widgets/CustomMyTripItem.dart';

class MyTripsSliverList extends StatelessWidget {
  const MyTripsSliverList({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomMyTripItem()
                .animate()
                .moveY(
                  begin: 50,
                )
                .fadeIn(duration: 1.seconds, delay: (index * 200).ms),
          );
        });
  }
}
