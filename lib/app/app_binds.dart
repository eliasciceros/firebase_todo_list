import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'controllers/save_todo_page/save_todo_page_controller.dart';
import 'controllers/todo_page/bloc/todo_page_cubit.dart';
import 'controllers/todo_page/todo_page_controller.dart';
import 'datasources/firestore/todo_firebase_firestore_datasource.dart';
import 'datasources/todo_datasource_interface.dart';
import 'repositories/todo_repository_interface.dart';
import 'repositories/todo_repository.dart';

GetIt getIt = GetIt.instance;

void setUpAppBinds() {
  getIt.registerSingleton<ITodoDatasource>(TodoFirebaseFirestoreDatasource(FirebaseFirestore.instance), signalsReady: true);
  getIt.registerSingleton<ITodoRepository>(TodoRepository(getIt.get<ITodoDatasource>()), signalsReady: true);
  getIt.registerSingleton<TodoPageCubit>(TodoPageCubit(getIt.get<ITodoRepository>()), signalsReady: true);
  getIt.registerSingleton<TodoPageController>(TodoPageController(cubit: getIt.get<TodoPageCubit>(), repository: getIt.get<ITodoRepository>()), signalsReady: true);
  getIt.registerSingleton<SaveTodoPageController>(SaveTodoPageController(repository: getIt.get<ITodoRepository>()), signalsReady: true);
}
