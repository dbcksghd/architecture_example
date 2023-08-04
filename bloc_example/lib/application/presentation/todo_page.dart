import 'package:bloc_example/application/bloc/todo_bloc.dart';
import 'package:bloc_example/application/bloc/todo_event.dart';
import 'package:bloc_example/application/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is Loading) {
                return const CircularProgressIndicator();
              } else if (state is Error) {
                return Text(state.message);
              } else if (state is Loaded) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return Text(state.todos[index].title.toString());
                  },
                );
              }
              return const Text('빈 화면');
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoBloc>().add(GetTodoEvent());
        },
      ),
    );
  }
}
