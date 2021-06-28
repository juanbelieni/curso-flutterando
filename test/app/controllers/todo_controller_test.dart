import 'package:curso_flutterando/app/config/todo_api_config.dart';
import 'package:curso_flutterando/app/controllers/todo_controller.dart';
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

  test('it should call todo repository and store todos', () async {
    final todoController = TodoController();

    todoApiAdapter.onGet(
      '/todos',
      (request) => request.reply(200, jsonTodos),
    );

    expect(todoController.state.value, TodoControllerState.start);

    await todoController.start();

    expect(todoController.state.value, TodoControllerState.success);
    expect(todoController.todos.length, jsonTodos.length);
    expect(todoController.todos[0].id, jsonTodos[0]['id']);
  });

  test('it should set state to error when api call fails', () async {
    final todoController = TodoController();

    todoApiAdapter.onGet(
      '/todos',
      (request) => request.reply(400, null),
    );

    expect(todoController.state.value, TodoControllerState.start);

    await todoController.start();

    expect(todoController.state.value, TodoControllerState.error);
    expect(todoController.todos.length, 0);
  });
}
