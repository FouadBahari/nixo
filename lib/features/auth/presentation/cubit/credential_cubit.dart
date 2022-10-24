import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/auth/domain/entities/user_entity.dart';
import 'package:nixo/features/auth/domain/usecases/create_user_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/facebook_auth_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/google_auth_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/signin_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/signup_usecase.dart';
import 'package:nixo/features/auth/presentation/cubit/credenial_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final FacebookAuthUseCase facebookAuthUseCase;
  final CreateUserUseCase getCreateCurrentUserUseCase;
  final GoogleAuthUseCase googleSignInUseCase;

  CredentialCubit(
      {required this.googleSignInUseCase,
      required this.signUpUseCase,
      required this.signInUseCase,
      required this.forgotPasswordUseCase,
      required this.facebookAuthUseCase,
      required this.getCreateCurrentUserUseCase})
      : super(CredentialInitial());

  Future<void> forgotPassword({required String email}) async {
    emit(CredentialLoading());
    Either<Failure, void> response = await forgotPasswordUseCase(email);
    emit(
      response.fold(
        (failure) => CredentialFailure(),
        (_) => ForgotPasswordSent(),
      ),
    );
  }

  Future<void> signInSubmit({
    required String email,
    required String password,
  }) async {
    emit(CredentialLoading());
    Either<Failure, void> response = await signInUseCase(UserEntity(
      id: '',
      avatar: '',
      username: '',
      email: email,
      password: password,
    ));
    emit(
      response.fold(
        (l) => CredentialFailure(),
        (r) => CredentialSuccess(),
      ),
    );
  }

  Future<void> googleAuthSubmit() async {
    emit(CredentialLoading());
    Either<Failure, void> response = await googleSignInUseCase(NoParams());
    emit(
      response.fold(
        (l) => CredentialFailure(),
        (r) => CredentialSuccess(),
      ),
    );
  }

  Future<void> facebookAuthSubmit() async {
    emit(CredentialLoading());
    Either<Failure, void> response = await facebookAuthUseCase(NoParams());
    emit(
      response.fold(
        (l) => CredentialFailure(),
        (r) => CredentialSuccess(),
      ),
    );
  }

  Future<void> signUpSubmit({required UserEntity user}) async {
    emit(CredentialLoading());
    Either<Failure, void> response = await signUpUseCase(user);
    emit(
      response.fold(
        (l) => CredentialFailure(),
        (r) => CredentialSuccess(),
      ),
    );
  }
}
