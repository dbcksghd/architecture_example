import 'package:bloc_example/data/data_soruce/todo_data_source.dart';
import 'package:bloc_example/domain/model/todo.dart';

class TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepository(this._dataSource);

  Future<List<Todo>> getTodos() async => await _dataSource.getTodos();
}
