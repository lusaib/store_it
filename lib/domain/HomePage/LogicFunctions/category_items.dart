import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store_it/config/logger_config.dart';
import 'package:store_it/domain/HomePage/Models/CategoryItem/category_item_model.dart';

class CategoryItemsDataService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deleteCategory(CategoryItemModel item,
      {VoidCallback? onSuccess}) async {
    appLogNoStack.v("manageCategoryItems started");
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await _firestore
          .collection('users')
          .doc(auth.currentUser?.uid ?? 'InvalidUser')
          .collection('categoryItems')
          .doc(item.id)
          .delete()
          .catchError(
        (e) {
          throw ErrorDescription(e.toString());
        },
      );

      appLogNoStack.v("manageCategoryItems deleted document successfully");
      onSuccess?.call();
    } catch (e) {
      appLogNoStack.e(e.toString());
      throw Exception('Failed to delete data');
    }
    appLogNoStack.v("manageCategoryItems ended");
  }

//save category info to cloud
  Future<void> saveCategoryInfo(String id, String title, String desc,
      String? password, VoidCallback onSuccess) async {
    appLogNoStack.v("manageCategoryItems started");
    try {
      final Map<String, dynamic> temp = CategoryItemModel(
        id: id,
        title: title,
        position: -1,
        desc: desc,
        password: password,
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
      ).toJson();

      appLogNoStack.d("send data - ${temp.toString()}");
      final CollectionReference<Map<String, dynamic>> collectionPath =
          _firestore
              .collection('users')
              .doc(_auth.currentUser?.uid ?? 'InvalidUser')
              .collection('categoryItems');
      if (temp['id'] == '') {
        final addRef = await collectionPath.add({});
        final String documentId = addRef.id;
        temp['id'] = documentId;
        await addRef.set(temp);
      } else {
        await collectionPath.doc(temp['id']).update(temp);
      }
      appLogNoStack.v("manageCategoryItems managed document successfully");
      onSuccess.call();
    } catch (err) {
      appLogNoStack
          .e("Error - manageCategoryItems function - ${err.toString()}");

      throw Exception('Failed to manage data');
    }
    appLogNoStack.v("manageCategoryItems ended");
  }
}
