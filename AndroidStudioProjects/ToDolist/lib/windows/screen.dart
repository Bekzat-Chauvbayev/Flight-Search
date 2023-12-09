import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: Text('To Do List'),
          centerTitle: true,
        ),

        body:
        Column(children: [Text('MainScreen'),
          ElevatedButton(onPressed: () {
            Navigator.pushReplacementNamed(context, '/todo');
          }, child: Text('dalee'))],)
    );
  }
}
