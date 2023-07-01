import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvc/data/model/todo.dart';

class TodoDataSource {
  final String _url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Todo.fromJson(e))
          .toList();
    } else {
      throw Exception(response.body);
    }
  }
}
