import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/onboarding/domain/usecases/isfirst_time_usecase.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final IsFirstTimeUsecase isFirstTimeUsecase;
  OnboardingCubit({required this.isFirstTimeUsecase})
      : super(OnboardingInitialState());

  Future<void> isFirstTime() async {
    Either<Failure, bool> response = await isFirstTimeUsecase(NoParams());
    emit(response.fold((l) => OnboardingFailureState(), (r) {
      if (r) {
        return OnboardingFirstTimeState();
      } else {
        return OnboardingNotFirstTimeState();
      }
    }));
  }
}
