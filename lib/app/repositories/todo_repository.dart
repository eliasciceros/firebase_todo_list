import 'package:firebase_todo_list/app/datasources/todo_datasource_interface.dart';
import 'package:firebase_todo_list/app/models/todo_model.dart';
import 'package:firebase_todo_list/app/repositories/todo_repository_interface.dart';

class TodoRepository implements ITodoRepository {
  final ITodoDatasource datasource;

  TodoRepository(this.datasource);

  @override
  Stream<List<TodoModel>> getTodos() => datasource.getTodos();
}