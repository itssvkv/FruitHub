import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/constants.dart';
import 'package:fruit_app/core/errors/exception.dart';
import 'package:fruit_app/core/errors/failure.dart';
import 'package:fruit_app/core/services/firebase_auth_service.dart';
import 'package:fruit_app/core/services/remote_service.dart';
import 'package:fruit_app/core/services/shared_preferences_service.dart';
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
      log('signinya3am ${user.uid}');
      var userEntity = await getUser(uId: user.uid);
      await saveUserData(userEntity: userEntity);
      return right(userEntity);
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
      await saveUserData(userEntity: userEntity);
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
      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(userEntity: userEntity);
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
  Future addUser({required UserEntity userEntity}) async {
    await remoteService.addData(
      path: RemotePaths.addUserData,
      data: UserModel.fromEntity(userEntity).toMap(),
      docId: userEntity.uId,
    );
  }

  @override
  Future<UserEntity> getUser({required String uId}) async {
    log('yyyyyyyyyyyyyyyyyyyyyyyyyyyy $uId');
    var userData =
        await remoteService.getData(path: RemotePaths.getUserData, id: uId);
    log('ebn  el mtanakkaaaaa ${userData.toString()}');
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity userEntity}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(userEntity).toMap());
    await SharedPreferencesService.setValue(kUserData, jsonData);
  }
}
