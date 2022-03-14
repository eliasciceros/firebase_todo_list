import 'package:firebase_todo_list/app/controllers/bloc/todo_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/todo_repository_interface.dart';

class TodoBlocCubit extends Cubit<TodoState>{
  final ITodoRepository repository;

  // Initial state
  TodoBlocCubit(this.repository) : super(TodoState());

  // Registering events
  void getTodos() async {
    if (state.status == TodoListStatus.initial) {
      emit(state.copyWith(
        status: TodoListStatus.loading,
      ));
    }

    final todoList = repository.getTodos();

    return emit(state.copyWith(
      status: TodoListStatus.success,
      todoList: todoList,
     ));
  }




}