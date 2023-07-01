import 'package:mvc/data/dataSoruce/todo_data_source.dart';
import 'package:mvc/data/repository/todo_repository.dart';
import 'package:mvc/data/model/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource = TodoDataSource();

  @override
  Future<List<Todo>> getTodo() async => await _dataSource.getTodos();
}
