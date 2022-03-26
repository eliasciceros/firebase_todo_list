import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

const int todoTitleMaxLength = 30;

class TodoModel {
  late final DocumentReference? documentReference; // can and it is initialized with null by default
  late String title;
  late bool isChecked;

  TodoModel({this.documentReference, this.title = '', this.isChecked = false});

  Map<String, dynamic> toMap() {
    return {
      'documentReference': documentReference,
      'title': title,
      'isChecked': isChecked,
    };
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromDocument(DocumentSnapshot doc) {
    return TodoModel(
      documentReference: doc.reference,
      title: doc['title'],
      isChecked: doc['isChecked'],
    );
  }
}