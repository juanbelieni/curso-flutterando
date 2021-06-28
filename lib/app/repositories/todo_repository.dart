import 'package:curso_flutterando/app/config/todo_api_config.dart';
import 'package:curso_flutterando/app/models/todo_model.dart';

class TodoRepository {
  Future<List<Todo>> fetchTodos() async {
    final url = '/todos';
    final response = await todoApi.get(url);

    final todos = List.from(response.data ?? [])
        .map((json) => Todo.fromJson(json))
        .toList();

    return todos;
  }
}
