// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/SignInView.dart';
import 'package:in_egypt/Features/Auth/presentation/Views/SignUpView.dart';
import 'package:in_egypt/Features/Book/presentation/views/BookView.dart';
import 'package:in_egypt/Features/Book/presentation/views/BookedSuccessView.dart';
import 'package:in_egypt/Features/Book/presentation/views/widgets/CustomWebView.dart';
import 'package:in_egypt/Features/Home/domain/Entities/SelectPlaceCategoryEntity.dart';
import 'package:in_egypt/Features/Home/presentation/views/CategoryPlacesView.dart';
import 'package:in_egypt/Features/Home/presentation/views/HomeView.dart';
import 'package:in_egypt/Features/Home/presentation/views/MoreNewestPlacesView.dart';
import 'package:in_egypt/Features/Home/presentation/views/MorePopularPlacesView.dart';
import 'package:in_egypt/Features/Home/presentation/views/PlaceDetailsView.dart';
import 'package:in_egypt/Features/Onboarding/Presentation/Views/OnBoardingView.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/AboutUsView.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/PersonalDetailsView.dart';
import 'package:in_egypt/Features/Profile/Presentation/views/QuestionsAndAnswersView.dart';
import 'package:in_egypt/Features/Splash/presentation/views/SplashView.dart';
import 'package:in_egypt/Features/Trips/presentation/views/MyTripDetailsView.dart';
import 'package:in_egypt/Features/Trips/presentation/views/MyTripsView.dart';
import 'package:in_egypt/core/Entities/BookingEntity.dart';
import 'package:in_egypt/core/Entities/CustomWebViewNavigationRequirmentsEntity.dart';
import 'package:in_egypt/core/Entities/PlaceEntity.dart';

class App_router {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SplashView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: OnBoardingView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const OnBoardingView();
        },
      ),
      GoRoute(
        path: SignInView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInView();
        },
      ),
      GoRoute(
        path: SignUpView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpView();
        },
      ),
      GoRoute(
        path: HomeView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: PlaceDetailsView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return PlaceDetailsView(
            placeEntity: state.extra as PlaceEntity,
          );
        },
      ),
      GoRoute(
        path: BookPlaceView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return BookPlaceView(
            place: state.extra as PlaceEntity,
          );
        },
      ),
      GoRoute(
        path: MyTripsView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const MyTripsView();
        },
      ),
      GoRoute(
        path: MorePopularPlacesView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const MorePopularPlacesView();
        },
      ),
      GoRoute(
        path: MoreNewestPlacesView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const MoreNewestPlacesView();
        },
      ),
      GoRoute(
        path: CustomWebView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return CustomWebView(
            customWebViewNavigationRequirmentsEntity:
                state.extra as CustomWebViewNavigationRequirmentsEntity,
          );
        },
      ),
      GoRoute(
        path: BookedSuccessView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return BookedSuccessView(
            bookingEntity: state.extra as BookingEntity,
          );
        },
      ),
      GoRoute(
        path: CategoryPlacesView.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return CategoryPlacesView(
            category: state.extra as SelectPlaceCategoryEntity,
          );
        },
      ),
      GoRoute(
          path: MyTripDetailsView.routeName,
          builder: (context, state) => MyTripDetailsView(
                bookingEntity: state.extra as BookingEntity,
              )),
      GoRoute(
          path: PersonalDetailsView.routeName,
          builder: (context, state) => PersonalDetailsView()),
      GoRoute(
          path: QuestionsAndAnswersView.routeName,
          builder: (context, state) => QuestionsAndAnswersView()),
      GoRoute(
          path: AboutUsView.routeName,
          builder: (context, state) => AboutUsView()),
    ],
  );
}
