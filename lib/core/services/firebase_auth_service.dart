import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_app/core/errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة ');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'الحساب موجود بالفعل لهذا البريد الإلكتروني');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: '.الرجاء التحقق من الاتصال بالشبكة');
      } else {
        throw CustomException(
            message: 'حدث خطأ ما ، يرجى المحاولة مرة أخرى لاحقًا');
      }
    } catch (e) {
      throw CustomException(
          message: 'حدث خطأ ما ، يرجى المحاولة مرة أخرى لاحقًا');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح');
      } else if (e.code == 'wrong-password') {
        log('wrong');
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: '.الرجاء التحقق من الاتصال بالشبكة');
      } else {
        log('leh');
        throw CustomException(
            message: 'حدث خطأ ما ، يرجى المحاولة مرة أخرى لاحقًا');
      }
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }
}
