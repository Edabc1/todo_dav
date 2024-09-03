import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:todo/models/save_note.dart';
import 'package:todo/screens/add_todo.dart';
import 'package:todo/screens/todo_list.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SaveNote(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: Brightness.dark),
      ),
      initialRoute: '/homepage',
      routes: {
        '/homepage': (_) => const TodoList(),
        '/addtodopage': (_) => const AddTodo(),
      },
    );
  }
}
