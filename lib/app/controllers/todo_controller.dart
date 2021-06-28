import 'package:curso_flutterando/app/models/todo_model.dart';
import 'package:curso_flutterando/app/repositories/todo_repository.dart';
import 'package:flutter/material.dart';

enum TodoControllerState {
  start,
  loading,
  success,
  error,
}

class TodoController {
  List<Todo> todos = [];
  final repository = TodoRepository();
  final state = ValueNotifier(TodoControllerState.start);

  Future start() async {
    state.value = TodoControllerState.loading;
    try {
      todos = await repository.fetchTodos();
      state.value = TodoControllerState.success;
    } catch (error) {
      state.value = TodoControllerState.error;
    }
  }
}