import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/Custom_BottomNavigationBar.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/HomeViewBody.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = '/HomeView';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> bottomNavViews = [
    HomeViewBody(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomnavigationbar(currentIndex: (val) {
          setState(() {
            currentIndex = val;
          });
        }),
        body: PageView.builder(
          itemCount: bottomNavViews.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return bottomNavViews[currentIndex];
          },
        ));
  }
}
