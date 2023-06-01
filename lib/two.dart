import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tab_bar/form_two.dart';
import 'dart:async';
import 'dart:convert';



class Two extends StatefulWidget {
  @override
  _TwoState createState() => _TwoState();
}

class _TwoState extends State<Two> {
  late List<Post> postList = [];

  Future<void> getData() async {
    http.Response response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      headers: {"Accept": "application/json"},
    );

    List<dynamic> dataJSON = json.decode(response.body);
    List<Post> posts = dataJSON.map((json) => Post.fromJson(json)).toList();

    setState(() {
      postList = posts;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: postList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder( 
              itemCount: postList.length,
              itemBuilder: (context, index) {
                final post = postList[index];
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FormTwo(post)));
                        },
                        title: Text(post.title),
                        subtitle: Text(post.body), 
                      ),
                      
                    ],
                  ),
                );
                
              },
            ),
    );
  }
}




 class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"]);
  }
}