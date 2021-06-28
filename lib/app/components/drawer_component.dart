import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Juan Belieni'),
            accountEmail: Text('juanbelieni@gmail.com'),
            currentAccountPicture: ClipOval(
              child: Image.asset('assets/images/profile.jpg'),
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text('Counter'),
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),

          ListTile(
            leading: Icon(Icons.monetization_on_rounded),
            title: Text('Converter'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/converter');
            },
          ),

          ListTile(
            leading: Icon(Icons.check_box_outlined),
            title: Text('Todo'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/todo');
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign out'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
