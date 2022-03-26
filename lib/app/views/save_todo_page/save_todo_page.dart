import 'package:firebase_todo_list/app/controllers/save_todo_page/save_todo_page_controller.dart';
import 'package:flutter/material.dart';

import '../../models/todo_model.dart';

class SaveTodoPageArguments {
  final TodoModel? todo;

  SaveTodoPageArguments({required this.todo});
}

class SaveTodoPage extends StatefulWidget {
  final TodoModel? todo;
  final SaveTodoPageController controller;

  const SaveTodoPage({Key? key, required this.controller, this.todo}) : super(key: key);

  @override
  _SaveTodoPageState createState() => _SaveTodoPageState();
}

class _SaveTodoPageState extends State<SaveTodoPage> {
  @override
  void initState() {
    widget.controller.verifyPageMode(widget.todo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.controller.isEditMode ? "Modificar todo" : "Adicionar novo todo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.controller.todo?.title,
                onChanged: (value) {
                  widget.controller.changeTodoTitle(value);
                },
                maxLength: todoTitleMaxLength,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite o título do todo"
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.controller.saveTodo();
                      Navigator.pop(context);
                    },
                    child: const Text("Salvar"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      minimumSize: Size.fromHeight(Theme.of(context).buttonTheme.height),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
