import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_binds.dart';
import 'app_routes.dart';

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
      initialRoute: initialRoute,
      onGenerateRoute: appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
