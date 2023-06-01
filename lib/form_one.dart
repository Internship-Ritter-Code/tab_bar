import 'package:flutter/material.dart';
import 'package:tab_bar/two.dart';

class FormOne extends StatelessWidget {
  final Todo todo;

  FormOne({required this.todo});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
      appBar: AppBar(
        title: Text('FORM ONE'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(todo.avatar),
            ),
            SizedBox(height: 16.0),
            Text('Name: ${todo.first_name} ${todo.last_name}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 8.0),
            Text('Email: ${todo.email}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
