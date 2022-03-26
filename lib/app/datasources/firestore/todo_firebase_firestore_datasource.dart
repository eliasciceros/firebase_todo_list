import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo_list/app/datasources/todo_datasource_interface.dart';
import 'package:firebase_todo_list/app/models/todo_model.dart';

import 'firestore_consts.dart';

// Firestore is a reactive database, so it will automatic actualize and rebuild
// our app screen in realtime if we change some value in our database in
// Firebase Console. The opposite also applies.
class TodoFirebaseFirestoreDatasource implements ITodoDatasource {
  final FirebaseFirestore firestore;

  TodoFirebaseFirestoreDatasource(this.firestore);

  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore.collection(todoCollectionName).snapshots().map((query) {
      return query.docs.map((doc) => TodoModel.fromDocument(doc)).toList();
    });
  }

  @override
  Future<void> saveTodo(TodoModel todo) async {
    if (todo.documentReference == null){
      await firestore.collection(todoCollectionName).add(todo.toMap());
    } else {
      todo.documentReference!.update(todo.toMap());
    }
  }
}