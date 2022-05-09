import 'package:assignment/models/todo.dart';
import 'package:assignment/services/fetch_todos.dart';
import 'package:flutter/material.dart';

class ToDoStatusNotifier extends ChangeNotifier{

  List<ToDo> _todos = [];

  List<ToDo> get todos => _todos;

  Future<List<ToDo>> fetchToDos() async{
    return _todos = await NetworkServices().fetchToDOs();
    notifyListeners();
  }
  
  List<ToDo> fetchToDosByUser(int userId){
    if(todos.map((e) => e.userId).contains(userId)){
      return _todos.where((todo) => todo.userId == userId).toList();
    }
    return [];
  }

  void updateStatus(int todoId){
    if(todos.map((e) => e.todoId).contains(todoId)){
      todos.where((todo) => todo.todoId == todoId).first.status = ! todos.where((todo) => todo.todoId == todoId).first.status ;
      notifyListeners();
    }
  }
}