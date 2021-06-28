import 'package:curso_flutterando/app/controllers/app_controller.dart';
import 'package:curso_flutterando/app/pages/converter_page.dart';
import 'package:curso_flutterando/app/pages/home_page.dart';
import 'package:curso_flutterando/app/pages/landing_page.dart';
import 'package:curso_flutterando/app/pages/login_page.dart';
import 'package:curso_flutterando/app/pages/todo_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final AppController appController = AppController.instance;

  Brightness get brightness =>
      appController.isDarkTheme ? Brightness.dark : Brightness.light;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appController,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: brightness,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LandingPage(),
            '/login': (context) => LoginPage(),
            '/home': (context) => HomePage(),
            '/converter': (context) => ConverterPage(),
            '/todo': (context) => TodoPage(),
          },
        );
      },
    );
  }
}
