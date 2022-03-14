import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo_list/app/datasources/todo_datasource_interface.dart';
import 'package:get_it/get_it.dart';


import 'controllers/todo_controller.dart';
import 'controllers/bloc/todo_bloc_cubit.dart';
import 'datasources/todo_firebase_firestore_datasource.dart';
import 'repositories/todo_repository_interface.dart';
import 'repositories/todo_repository.dart';

GetIt getIt = GetIt.instance;

void setUpAppBinds() {
  getIt.registerSingleton<ITodoDatasource>(TodoFirebaseFirestoreDatasource(FirebaseFirestore.instance), signalsReady: true);
  getIt.registerSingleton<ITodoRepository>(TodoRepository(getIt.get<ITodoDatasource>()), signalsReady: true);
  getIt.registerSingleton<TodoBlocCubit>(TodoBlocCubit(getIt.get<ITodoRepository>()), signalsReady: true);
  getIt.registerSingleton<TodoController>(TodoController(getIt.get<TodoBlocCubit>()), signalsReady: true);
}
