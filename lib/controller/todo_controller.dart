import 'package:api_study/model/todo_model.dart';
import 'package:api_study/repository/repository.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);
  
  //get
  Future<List<Todo>> fetchTodoList()async{
    return _repository.getTodoList();
  }

//patch

  Future<String> updatePatchCompleted(Todo todo){
    return _repository.patchCompleted(todo);
  }

  //put
  Future<String>updatePutCompleted(Todo todo){
    return _repository.putCompleted(todo);
  }

  //delete

  Future<String>deleteTodo(Todo todo){
    return _repository.deleteTodo(todo);
  }

  //post

  Future<String>postTodo(Todo todo){
    return _repository.postTodo(todo);
  }
}