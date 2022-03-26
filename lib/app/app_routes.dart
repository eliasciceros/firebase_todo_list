import 'package:flutter/material.dart';

import 'app_binds.dart';
import 'controllers/save_todo_page/save_todo_page_controller.dart';
import 'controllers/todo_page/todo_page_controller.dart';
import 'views/save_todo_page/save_todo_page.dart';
import 'views/todo_page/todo_page.dart';

Route<dynamic>? appRoutes(settings) {
  if (settings.name == initialRoute) {
    return MaterialPageRoute(
      builder: (context) {
        return TodoPage(
          controller: getIt.get<TodoPageController>(),
        );
      },
    );
  }

  if (settings.name == saveTodoRoute) {
    final args = settings.arguments as SaveTodoPageArguments;
    return MaterialPageRoute(
      builder: (context) {
        return SaveTodoPage(
          controller: getIt.get<SaveTodoPageController>(),
          todo: args.todo,
        );
      },
    );
  }

  assert(false, 'A rota ${settings.name} precisa ser implementada');
  return null;
}

const initialRoute = '/';
const saveTodoRoute = '/saveTodo';