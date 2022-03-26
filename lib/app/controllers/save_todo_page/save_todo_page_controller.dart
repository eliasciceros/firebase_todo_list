import 'package:firebase_todo_list/app/models/todo_model.dart';

import '../../repositories/todo_repository_interface.dart';

class SaveTodoPageController {
  TodoModel? todo;
  bool isEditMode = false;
  late final ITodoRepository repository;

  SaveTodoPageController({required this.repository});

  verifyPageMode(TodoModel? todo) {
    isEditMode = (todo != null);
    this.todo = todo ?? TodoModel();
  }

  changeTodoTitle(String title) => todo?.title = title;

  Future<void> saveTodo() async {
    await repository.saveTodo(todo!);
  }
}