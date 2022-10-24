import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixo/config/routes/app_routes.dart';
import 'package:nixo/core/utils/app_assets.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';
import 'package:nixo/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nixo/features/onboarding/domain/usecases/isfirst_time_usecase.dart';
import 'package:nixo/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext(String route) => Navigator.pushReplacementNamed(context, route);

  _startDelay(String route) {
    _timer = Timer(const Duration(seconds: 3), () => _goNext(route));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _buildSplashScreenBody() {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingFirstTimeState) {
          _startDelay(AppRoutes.onBoardingRoute);
        } else {
          _startDelay(AppRoutes.loginRoute);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: AppSize.height140),
          Center(
            child: Image.asset(AssetsManager.logo),
          ),
          SizedBox(height: AppSize.height25),
          Text(
            AppStrings.appName,
            style: getSemiBoldStyle(
                color: AppColors.white, fontSize: AppSize.font22 * 2),
          ),
          const Expanded(child: Text('')),
          Center(
            child: Image.asset(AssetsManager.obtulus),
          ),
          SizedBox(height: AppSize.height25),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSize.getScreenSize(context);

    return Scaffold(
      backgroundColor: AppColors.system,
      body: _buildSplashScreenBody(),
    );
  }
}
