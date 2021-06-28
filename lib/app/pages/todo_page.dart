import 'package:curso_flutterando/app/components/drawer_component.dart';
import 'package:curso_flutterando/app/controllers/todo_controller.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final todoController = TodoController();

  @override
  initState() {
    super.initState();
    todoController.start();
  }

  _start() {
    return Container();
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _success() {
    return ListView.builder(
      itemCount: todoController.todos.length,
      itemBuilder: (context, index) {
        final todo = todoController.todos[index];
        return ListTile(
          leading: Checkbox(value: todo.completed, onChanged: (bool? value) {  },),
          title: Text(todo.title),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          todoController.start();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Text('Try again'),
        ),
      ),
    );
  }

  currentStateWidget(TodoControllerState state) {
    switch (state) {
      case TodoControllerState.start:
        {
          return _start();
        }
      case TodoControllerState.loading:
        {
          return _loading();
        }
      case TodoControllerState.success:
        {
          return _success();
        }
      case TodoControllerState.error:
        {
          return _error();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      drawer: AppDrawer(),
      body: AnimatedBuilder(
        animation: todoController.state,
        builder: (context, child) {
          return currentStateWidget(todoController.state.value);
        },
      ),
    );
  }
}
