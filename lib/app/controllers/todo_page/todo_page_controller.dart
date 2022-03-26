import 'package:firebase_todo_list/app/models/todo_model.dart';

import '../../repositories/todo_repository_interface.dart';
import 'bloc/todo_page_cubit.dart';




class TodoPageController {
  late final TodoPageCubit cubit;
  late final ITodoRepository repository;

  TodoPageController({required this.cubit, required this.repository});

  Future<void> saveTodo(TodoModel todo) async {
    await repository.saveTodo(todo);
  }
}