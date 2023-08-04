import 'package:bloc_example/application/bloc/todo_event.dart';
import 'package:bloc_example/application/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/data/repository/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository;

  TodoBloc(this._repository) : super(Empty()) {
    on<GetTodoEvent>((event, emit) async {
      try {
        emit(Loading());
        emit(Loaded(todos: await _repository.getTodos()));
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
