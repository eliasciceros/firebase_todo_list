import 'package:firebase_todo_list/app/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/bloc/todo_bloc_cubit.dart';
import '../controllers/bloc/todo_state.dart';
import '../models/todo_model.dart';

class TodoPage extends StatefulWidget {
  final TodoController controller;

  const TodoPage(this.controller, {Key? key}) : super(key: key);

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
    return homePageWidget(widget.controller);
  }
}

Widget homePageWidget(TodoController controller) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("TODO list"),
    ),
    body: Column(
      children: [
        const Center(child: Text('Your todo list')),
        BlocBuilder<TodoBlocCubit, TodoState>(
          bloc: controller.cubit,
          builder: (context, state) {
            return StreamBuilder(
              stream: state.todoList,
              builder: (BuildContext context, AsyncSnapshot<List<TodoModel>> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: ElevatedButton(
                        onPressed: () =>
                            context.read<TodoBlocCubit>()
                                .getTodos(),
                        child: const Text('Occorreu um erro. Recarregar'),
                      )
                  );
                }

                if (state.status == TodoListStatus.loading || snapshot.data == null) {
                  debugPrint("Loading.....");
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state.status == TodoListStatus.success) {
                  return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (_, index) {
                          TodoModel todo = snapshot.data![index];

                          return CheckboxListTile(
                            title: Text(todo.title),
                            value: todo.isChecked,
                            onChanged: (_) => {} //TODO: do this logic to change todo isChecked,
                          );
                        },
                      )
                  );
                }

                return Text('Nada a carregar');
              }
            );
          },
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => {},
      child: const Icon(Icons.add),
    ),
  );
}