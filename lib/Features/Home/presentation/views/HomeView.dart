import 'package:flutter/material.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/Custom_BottomNavigationBar.dart';
import 'package:in_egypt/Features/Home/presentation/views/widgets/HomeViewBody.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/ProfileView.dart';
import 'package:in_egypt/Features/Trips/presentation/views/MyTripsView.dart';
import 'package:in_egypt/Features/Wishlist/presentation/views/WishlistView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = '/HomeView';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomNavViews = [
      HomeViewBody(
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
      ),
      MyTripsView(),
      WishListView(),
      ProfileView(),
    ];
    return Scaffold(
        bottomNavigationBar: CustomBottomnavigationbar(
          currentIndexChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          currentIndex: currentIndex,
        ),
        body: PageView.builder(
          itemCount: bottomNavViews.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return bottomNavViews[currentIndex];
          },
        ));
  }
}
