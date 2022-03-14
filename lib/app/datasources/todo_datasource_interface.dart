import '../models/todo_model.dart';

abstract class ITodoDatasource {
  Stream<List<TodoModel>> getTodos();
}