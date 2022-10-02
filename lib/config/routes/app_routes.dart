import 'package:flutter/material.dart';
import 'package:nixo/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:nixo/features/splash/presentation/pages/splash.dart';

import '../../core/utils/app_strings.dart';

class AppRoutes {
  static const String initialRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));
      case AppRoutes.onBoardingRoute:
        return MaterialPageRoute(builder: ((context) => const OnBoardingScreen()));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noFoundRoute),
              ),
              body: const Center(child: Text(AppStrings.noFoundRoute)),
            ));
  }
}
