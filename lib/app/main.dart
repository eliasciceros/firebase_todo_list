import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_todo_list/app/controllers/todo_controller.dart';
import 'package:firebase_todo_list/app/views/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'appBinds.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  setUpAppBinds();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase TODOs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoPage(GetIt.instance.get<TodoController>()),
      debugShowCheckedModeBanner: false,
    );
  }
}
