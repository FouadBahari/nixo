import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixo/config/routes/app_routes.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/config/theme/app_themes.dart';
import 'package:nixo/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:nixo/features/auth/presentation/cubit/credential_cubit.dart';

import 'package:nixo/core/dependencies/injection_container.dart' as di;
import 'package:nixo/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class NixoApp extends StatelessWidget {
  const NixoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider<CredentialCubit>(
          create: (_) => di.sl<CredentialCubit>(),
        ),
        BlocProvider<OnboardingCubit>(
          create: (_) => di.sl<OnboardingCubit>()..isFirstTime(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        title: AppStrings.appName,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: AppRoutes.initialRoute,
      ),
    );
  }
}
