// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:tab_bar/three.dart';
import 'package:tab_bar/two.dart';
import 'one.dart';
import 'dart:convert';


void main() { 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Flutter',
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: BottomNavi(title: '',),
    );
  }
}


class BottomNavi extends StatefulWidget {
  BottomNavi ({Key? key, required this.title}) : super (key: key);
  final String title;
  @override
  _BottomNavi createState() => _BottomNavi();
}

class _BottomNavi extends State<BottomNavi> {

  int currentIndex = 0;
  final List<Widget> body = [

    Two(),
    One(),
    There(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello', style: TextStyle(color: Colors.white),),
      ),
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue,
        onTap: ontap,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black45,),
            label: 'Home',
            activeIcon: Icon(Icons.home, color: Colors.yellow,),
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.black45,),
            label: 'Account',
            activeIcon: Icon(Icons.account_circle, color: Colors.yellow,),
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.access_time, color: Colors.black45,),
            label: 'Time',
            activeIcon: Icon(Icons.access_time, color: Colors.yellow,),
            ),
        ],
      ),   
    );
  }
  void ontap(int index){
    setState(() {
      currentIndex = index;
    });
  }
}

