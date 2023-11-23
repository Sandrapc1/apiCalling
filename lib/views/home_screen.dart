// ignore_for_file: unnecessary_string_interpolations, non_constant_identifier_names

import 'package:api_study/controller/todo_controller.dart';
import 'package:api_study/model/todo_model.dart';
import 'package:api_study/repository/todo_repository.dart';
import 'package:flutter/material.dart';

import 'widgets/safearea_buildcontent.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //dependency injection
    var todoController = TodoController(TodoRepository());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        title: const Center(child: Text('REST API')),
      ),
      body: FutureBuilder<List<Todo>>(
        future: todoController.fetchTodoList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          }
          return SafeAreaBuildContent(snapshot, todoController);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Todo todo=Todo(userId: 3,title: 'posts',completed: false);
        todoController.postTodo(todo);
      },
      child: Icon(Icons.add),),
    );
  }
}
