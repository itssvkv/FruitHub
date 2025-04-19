import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/errors/exception.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/services/firebase_auth_service.dart';
import 'package:fruit_app/features/auth/data/model/user_model.dart';
import 'package:fruit_app/features/auth/domain/entity/user_entity.dart';
import 'package:fruit_app/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('حدث خطأ ما ، يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('حدث خطأ ما ، يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      User user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception on AuthRepoImpl.signInWithGoogle => ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما ، يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      User user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception on AuthRepoImpl.signInWithGoogle => ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما ، يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }
}
