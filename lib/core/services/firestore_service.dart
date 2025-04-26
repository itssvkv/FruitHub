import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_app/core/services/remote_service.dart';


class FirestoreService implements RemoteService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docId}) async {
    if (docId != null) {
      await firebaseFirestore.collection(path).doc(docId).set(data);
    } else {
      await firebaseFirestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String id}) async {
    var result = await firebaseFirestore.collection(path).doc(id).get();
    log(result.data()!.toString());
    return result.data()!;
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String id}) async {
    var data = await firebaseFirestore.collection(path).doc(id).get();
    return data.exists;
  }
}
