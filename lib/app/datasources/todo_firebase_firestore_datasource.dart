import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo_list/app/datasources/todo_datasource_interface.dart';
import 'package:firebase_todo_list/app/models/todo_model.dart';

class TodoFirebaseFirestoreDatasource implements ITodoDatasource {
  final FirebaseFirestore firestore;

  TodoFirebaseFirestoreDatasource(this.firestore);

  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore.collection('todo').snapshots().map((query) {
      return query.docs.map((doc) => TodoModel.fromDocument(doc)).toList();
    });
  }
}