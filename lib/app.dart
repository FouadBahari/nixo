import 'package:flutter/material.dart';
import 'package:nixo/config/routes/app_routes.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/config/theme/app_themes.dart';


class NixoApp extends StatelessWidget {
  const NixoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      title: AppStrings.appName,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
