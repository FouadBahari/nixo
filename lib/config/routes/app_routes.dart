import 'package:flutter/material.dart';

import 'package:nixo/features/auth/presentation/pages/forget_pass_screen.dart';
import 'package:nixo/features/auth/presentation/pages/signin.dart';
import 'package:nixo/features/auth/presentation/pages/signup.dart';

import 'package:nixo/features/home/presentation/pages/main_screen.dart';

import 'package:nixo/features/onboarding/presentation/pages/onboarding.dart';
import 'package:nixo/features/splash/presentation/pages/splash.dart';
import 'package:nixo/features/tasks/presentation/pages/eisnhower_matrix.dart';

import '../../core/utils/app_strings.dart';

class AppRoutes {
  static const String initialRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String eisenhower = "/eisenhower";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));
      case AppRoutes.onBoardingRoute:
        return MaterialPageRoute(
            builder: ((context) => const OnBoardingScreen()));
      case AppRoutes.registerRoute:
        return MaterialPageRoute(builder: ((context) => const SignupScreen()));
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: ((context) => const SignInScreen()));
      case AppRoutes.forgotPasswordRoute:
        return MaterialPageRoute(
            builder: ((context) => const ForgetPasswordScreen()));
      case AppRoutes.mainRoute:
        return MaterialPageRoute(builder: ((context) => const MainScreen()));
      case AppRoutes.eisenhower:
        return MaterialPageRoute(
            builder: ((context) => const EisnhowerMatrixScreen()));

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
