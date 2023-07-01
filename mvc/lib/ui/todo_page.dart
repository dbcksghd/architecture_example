import 'package:flutter/material.dart';
import 'package:mvc/controller/todo_controller.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  late TodoController controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<TodoController>(context, listen: false);
    controller.getTodos();
    print(controller.todos.length);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Consumer<TodoController>(
            builder: (context, value, child) => ListView.builder(
              itemCount: controller.todos.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Column(
                    children: [
                      Text(value.todos[index].userId.toString()),
                      Text(value.todos[index].id.toString()),
                      Text(value.todos[index].title.toString()),
                      Text(value.todos[index].completed.toString()),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
