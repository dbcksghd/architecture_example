import 'package:mvc/data/model/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodo();
}