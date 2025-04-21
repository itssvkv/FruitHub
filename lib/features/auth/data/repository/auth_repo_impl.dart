import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/errors/exception.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/services/firebase_auth_service.dart';
import 'package:fruit_app/core/services/remote_service.dart';
import 'package:fruit_app/core/utils/remote_paths.dart';
import 'package:fruit_app/features/auth/data/model/user_model.dart';
import 'package:fruit_app/features/auth/domain/entity/user_entity.dart';
import 'package:fruit_app/features/auth/domain/repository/auth_repo.dart';
class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final RemoteService remoteService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.remoteService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      UserEntity userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );

      await addUser(userEntity: userEntity);

      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      if (user != null) {
        firebaseAuthService.deleteUser();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        firebaseAuthService.deleteUser();
      }
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      bool userExists = await remoteService.checkIfDataExists(
          path: RemotePaths.checkUserExists, id: userEntity.uId);
      if (userExists) {
        await getUser(uId: user.uid);
      } else {
        await addUser(userEntity: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      if (user != null) {
        firebaseAuthService.deleteUser();
      }
      log('Exception on AuthRepoImpl.signInWithGoogle => ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما ، يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      if (user != null) {
        firebaseAuthService.deleteUser();
      }
      log('Exception on AuthRepoImpl.signInWithGoogle => ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما ، يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }

  @override
  Future addUser({required UserEntity userEntity}) async {
    await remoteService.addData(
      path: RemotePaths.addUserData,
      data: userEntity.toMap(),
      docId: userEntity.uId,
    );
  }

  @override
  Future<UserEntity> getUser({required String uId}) async {
    var userData =
        await remoteService.getData(path: RemotePaths.getUserData, id: uId);
    return UserModel.fromJson(userData);
  }
}
