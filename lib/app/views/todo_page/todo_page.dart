import 'package:firebase_todo_list/app/views/save_todo_page/save_todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_routes.dart';
import '../../controllers/todo_page/bloc/todo_page_cubit.dart';
import '../../controllers/todo_page/bloc/todo_page_state.dart';
import '../../controllers/todo_page/todo_page_controller.dart';
import '../../models/todo_model.dart';

class TodoPage extends StatefulWidget {
  final TodoPageController controller;

  const TodoPage({Key? key, required this.controller}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  @override
  void initState() {
    widget.controller.cubit.getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TODO list"),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<TodoPageCubit, TodoPageState>(
                bloc: widget.controller.cubit,
                builder: (context, state) {
                  return StreamBuilder(
                    stream: state.todoList,
                    builder: (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: ElevatedButton(
                            onPressed: () => widget.controller.cubit.getTodos(),
                            child: const Text('Occorreu um erro. Recarregar'),
                          )
                        );
                      }

                      if (state.status == TodoListStatus.loading || snapshot.data == null) {
                        return const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state.status == TodoListStatus.success) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (_, index) {
                            TodoModel todo = snapshot.data![index];

                            return ListTile(
                              title: Text(todo.title),
                              onTap: () {
                                Navigator.pushNamed(context, saveTodoRoute, arguments: SaveTodoPageArguments(todo: todo));
                              },
                              trailing: Checkbox(
                                  value: todo.isChecked,
                                  onChanged: (value) {
                                    todo.isChecked = value!;
                                    widget.controller.saveTodo(todo);
                                  }
                              ),
                            );
                          },
                        );
                      }

                      return const Center(child: Text('Não há nada para carregar'));
                    }
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, saveTodoRoute, arguments: SaveTodoPageArguments(todo: null));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}