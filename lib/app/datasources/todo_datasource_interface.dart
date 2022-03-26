import '../models/todo_model.dart';

abstract class ITodoDatasource {
  Stream<List<TodoModel>> getTodos();
  Future<void> saveTodo(TodoModel todo); // Our convention is: save for add (if the identifier do not exist) or edit (otherwise)
}