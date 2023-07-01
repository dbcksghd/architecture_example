import 'package:flutter/material.dart';
import 'package:mvc/data/model/todo.dart';
import 'package:mvc/data/repository/todo_repository_impl.dart';

class TodoController extends ChangeNotifier {
  final List<Todo> _todos = List.empty(growable: true);
  late TodoRepositoryImpl _repositoryImpl;

  List<Todo> get todos => _todos;

  TodoController() {
    _repositoryImpl = TodoRepositoryImpl();
  }

  void getTodos() async {
    await _repositoryImpl.getTodo().then((value) => _todos.addAll(value));
    notifyListeners();
  }
}
