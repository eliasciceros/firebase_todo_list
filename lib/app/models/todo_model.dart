import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  late String title;
  late bool isChecked;
  late final DocumentReference documentReference;

  TodoModel(this.documentReference, {this.title = '', this.isChecked = false});

  factory TodoModel.fromDocument(DocumentSnapshot doc) {
    return TodoModel(
      doc.reference,
      title: doc['title'],
      isChecked: doc['isChecked'],
    );
  }
}