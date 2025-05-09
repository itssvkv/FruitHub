
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/features/auth/domain/repository/auth_repo.dart';

import '../../../domain/entity/user_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  bool isLoading = false;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);
    result.fold(
      (failure) => emit(
        LoginFailure(message: failure.message),
      ),
      (userEntity) => emit(
        LoginSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(
        LoginSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(
        LoginSuccess(userEntity: userEntity),
      ),
    );
  }
}
