part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitialState extends OnboardingState {}
class OnboardingFirstTimeState extends OnboardingState {}
class OnboardingNotFirstTimeState extends OnboardingState {}
class OnboardingFailureState extends OnboardingState {}
