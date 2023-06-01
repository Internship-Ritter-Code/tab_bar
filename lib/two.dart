import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tab_bar/form_one.dart';

class Two extends StatelessWidget {
  late final Todo todo;

  ///**
  /// Bentuk Json ada 2, one layer dan multiple layer
  ///
  /// ========== One  Layer =========
  /// {
  ///   "key" : "value",
  ///   "name" : "dendy"
  /// }
  /// ========== One  Layer =========
  ///
  ///
  /// ========== Multiple  Layer =========
  /// {
  ///    "name" : "Dendy",
  ///    "faculity" : "IT Engineer",
  ///    "book_favorite" : [
  ///         {
  ///           "title" : "Manga"
  ///           "penulis" : "James Bond"
  ///         },
  ///          {
  ///           "title" : "Novel"
  ///           "penulis" : "Richard Lee"
  ///         }
  ///     ]
  /// }
  /// ========== Multiple  Layer =========
  ///
  /// */

  final String apiUrl = "https://reqres.in/api/users?per_page=15";

  Future<Map<String, dynamic>> _fecthDataUsers() async {
    // Kita ngerequest url reqres https://reqres.in/ dan hasilnya dimasukan kedalam variable result
    var result = await http.get(Uri.parse(apiUrl));

    // log(result.body);
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _fecthDataUsers().then((hasilDariReturn) {
                // log("Hasil Return ${hasilDariReturn['total']}");
                // log("Hasil Total Page ${hasilDariReturn['total_pages']}");
              });
            },
          ),
          Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: _fecthDataUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                /// Data yang di return dari _fecthDataUsers ditampung didalam variable snapshot.data
                log("Hasil Dari snapshot ${snapshot.data['total']}");

                /// Lalu kita olah lagi karena kita mau ambil data users
                /// maka kita ambil dari key 'data' kita masukan sesuai dengan key nya snapshot.data['data']
                List users = snapshot.data['data'];

                for (int ind = 0; ind < users.length; ind++) {
                  /// Loop adalah bentuk sedeharna atau bentuk awal dari listview builder
                  log("Looping => ${users[ind]['first_name']}");
                }

                if (snapshot.hasData) {
                  /// Setalah itu kita looping/ulang dengan listview builder
                  return ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: users.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormOne(
                                        todo: Todo.fromJson(users[index]))));
                          },
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(users[index]['avatar']),
                          ),
                          title: Text(users[index]['first_name'] +
                              " " +
                              users[index]['last_name']),
                          subtitle: Text(users[index]['email']),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
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
        email: json["email"]);
  }
}
