import 'package:curso_flutterando/app/config/todo_api_config.dart';
import 'package:curso_flutterando/app/repositories/todo_repository.dart';
import 'package:dio/adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

main() {
  late DioAdapter todoApiAdapter;
  const jsonTodos = [
    {'userId': 1, 'id': 1, 'title': 'test', 'completed': false},
    {'userId': 1, 'id': 2, 'title': 'test', 'completed': false},
  ];

  setUp(() {
    todoApiAdapter = DioAdapter();
    todoApi.httpClientAdapter = todoApiAdapter;
  });

  tearDown(() {
    todoApi.httpClientAdapter = DefaultHttpClientAdapter();
  });

  test('it should return a list of todos', () async {
    final todoRepository = TodoRepository();

    todoApiAdapter.onGet(
      '/todos',
      (request) => request.reply(200, jsonTodos),
    );

    final todos = await todoRepository.fetchTodos();

    expect(todos.length, jsonTodos.length);
    expect(todos[0].id, jsonTodos[0]['id']);
  });
}
