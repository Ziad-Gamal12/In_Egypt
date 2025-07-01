// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt/Features/Onboarding/Presentation/Views/OnBoardingView.dart';
import 'package:in_egypt/Features/Splash/presentation/views/SplashView.dart';

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
    ],
  );
}
