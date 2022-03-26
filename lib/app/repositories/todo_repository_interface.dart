import '../models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> getTodos();
  Future<void> saveTodo(TodoModel todo);
}