import 'package:flutter/material.dart';
import 'package:tab_bar/two.dart';
// import 'package:tab_bar/model_two.dart';

class FormTwo extends StatelessWidget {
  late final Post post;

  FormTwo(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FORM TWO'),
        ),
        body: SafeArea(child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('id: ${post.id}',),
            SizedBox(height: 20,),
            Text('userId: ${post.userId}',),
            SizedBox(height: 20,),
            Text('Title: ${post.title}'),
            SizedBox(height: 20,),
            Text('Body: ${post.body}'),
            SizedBox(height: 20,),
          ],
        )
        )
          );
          
  }
}
