import '../../models/todo_model.dart';

enum TodoListStatus {initial, loading, success, failure}

class TodoState {
  late final TodoListStatus status;
  late final Stream<List<TodoModel>> todoList;

  TodoState({this.status = TodoListStatus.initial, this.todoList = const Stream.empty()});

  TodoState copyWith({
    TodoListStatus? status,
    Stream<List<TodoModel>>? todoList,
  })  {
    return TodoState(
      status: status ?? this.status,
      todoList: todoList ?? this.todoList,
    );
  }
}

