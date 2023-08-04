import 'package:bloc_example/application/bloc/todo_bloc.dart';
import 'package:bloc_example/application/presentation/todo_page.dart';
import 'package:bloc_example/data/data_soruce/todo_data_source.dart';
import 'package:bloc_example/data/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => TodoRepository(TodoDataSource()),
        child: BlocProvider(
          create: (context) => TodoBloc(context.read<TodoRepository>()),
          child: const TodoPage(),
        ),
      ),
    );
  }
}
