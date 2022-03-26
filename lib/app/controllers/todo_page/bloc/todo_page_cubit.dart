import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/todo_repository_interface.dart';
import 'todo_page_state.dart';

class TodoPageCubit extends Cubit<TodoPageState> {
  final ITodoRepository repository;

  // Initial state
  TodoPageCubit(this.repository) : super(TodoPageState());

  // Registering events
  void getTodos() async {
    if (state.status == TodoListStatus.initial) {
      emit(state.copyWith(
        status: TodoListStatus.loading,
      ));
    }

    // Request todos in a Stream list
    final todoList = repository.getTodos();

    return emit(state.copyWith(
      status: TodoListStatus.success,
      todoList: todoList,
    ));
  }
}
