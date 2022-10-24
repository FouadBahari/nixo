import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nixo/core/error/failure.dart';
import 'package:nixo/core/usecase/Usecase.dart';
import 'package:nixo/features/auth/domain/usecases/get_current_id_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/is_signin_usecase.dart';
import 'package:nixo/features/auth/domain/usecases/signout_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUidUseCase getCurrentUIDUseCase;
  AuthCubit({
    required this.isSignInUseCase,
    required this.signOutUseCase,
    required this.getCurrentUIDUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    Either<Failure, bool> isSignIn = await isSignInUseCase(NoParams());
    isSignIn.fold(
      (l) => UnAuthenticated(),
      (r) async {
        if (r) {
          loggedIn();
        } else {
          emit(UnAuthenticated());
        }
      },
    );
  }

  Future<void> loggedIn() async {
    Either<Failure, String> uid = await getCurrentUIDUseCase(NoParams());

    emit(
      uid.fold(
        (l) => UnAuthenticated(),
        (r) => Authenticated(uid: r),
      ),
    );
  }

  Future<void> loggedOut() async {
    Either<Failure, void> response = await signOutUseCase(NoParams());
    emit(
      response.fold(
        (l) => UnAuthenticated(),
        (r) => UnAuthenticated(),
      ),
    );
  }
}
