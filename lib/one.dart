import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tab_bar/form_one.dart';


class One extends StatelessWidget {
  late final Todo todo;
  final String apiUrl = "https://reqres.in/api/users?per_page=15";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['data'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FormOne(todo: Todo.fromJson(snapshot.data[index])))
                        );
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(snapshot.data[index]['avatar']),
                      ),
                      title: Text(snapshot.data[index]['first_name'] + " " + snapshot.data[index]['last_name']),
                      subtitle: Text(snapshot.data[index]['email']),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}




class Todo {
  final String avatar;
  final String first_name;
  final String last_name;
  final String email;
  
  Todo({
    required this.avatar,
    required this.first_name,
    required this.last_name,
    required this.email,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      avatar: json["avatar"],
      first_name: json["first_name"],
      last_name: json["last_name"],
      email: json["email"]
       );
  }
}