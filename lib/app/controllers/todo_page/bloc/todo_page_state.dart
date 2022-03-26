
import '../../../models/todo_model.dart';

enum TodoListStatus {initial, loading, success, failure}

class TodoPageState {
  late final TodoListStatus status;
  late final Stream<List<TodoModel>> todoList;

  TodoPageState({this.status = TodoListStatus.initial, this.todoList = const Stream.empty()});

  TodoPageState copyWith({
    TodoListStatus? status,
    Stream<List<TodoModel>>? todoList,
  })  {
    return TodoPageState(
      status: status ?? this.status,
      todoList: todoList ?? this.todoList,
    );
  }
}

