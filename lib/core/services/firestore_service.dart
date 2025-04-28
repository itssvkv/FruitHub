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
  Future<dynamic> getData(
      {required String path, String? id, Map<String, dynamic>? query}) async {
    if (id != null) {
      var result = await firebaseFirestore.collection(path).doc(id).get();
      log(result.data()!.toString());
      return result.data()!;
    } else {
      Query<Map<String, dynamic>> result = firebaseFirestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          result = result.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          result = result.limit(limit);
        }
      }
      var data = await result.get();
      return data.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String id}) async {
    var data = await firebaseFirestore.collection(path).doc(id).get();
    return data.exists;
  }
}
