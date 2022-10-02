import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nixo/config/routes/app_routes.dart';
import 'package:nixo/core/utils/app_assets.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_fonts.dart';
import 'package:nixo/core/utils/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() =>
      Navigator.pushReplacementNamed(context, AppRoutes.onBoardingRoute);

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _buildSplashScreenBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: AppSize.height140),
        Center(
          child: Image.asset(AssetsManager.logo),
        ),
        SizedBox(height: AppSize.height25),
        Text(
          'Nixo',
          style: getSemiBoldStyle(
              color: AppColors.white, fontSize: FontSize.s22 * 2),
        ),
        const Expanded(child: Text('')),
        Center(
          child: Image.asset(AssetsManager.obtulus),
        ),
        SizedBox(height: AppSize.height25),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.system,
      body: _buildSplashScreenBody(),
    );
  }
}
