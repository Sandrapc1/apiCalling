// fake server
  
import '../model/todo_model.dart';

abstract class Repository {
  Future<List<Todo>> getTodoList();
  //patch
  Future<String> patchCompleted(Todo todo);
  //put
  Future<String> putCompleted(Todo todo);
  //delete
  Future<String> deleteTodo(Todo todo);
  //post
  Future<String> postTodo(Todo todo);

}
