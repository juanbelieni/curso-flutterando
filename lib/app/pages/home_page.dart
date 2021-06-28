import 'package:curso_flutterando/app/components/drawer_component.dart';
import 'package:curso_flutterando/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appController = AppController.instance;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            appController.toggleTheme();
          });
        },
        child: Icon(Icons.lightbulb_outline),
      ),
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText('Counter: $counter'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setState(() => counter += 1),
              child: Text('counter++'),
            ),
          ],
        ),
      ),
    );
  }
}
