import 'package:flutter/material.dart';
import 'package:newest/MainPage.dart';


void main() {
  runApp(MyApp());
}

  class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}
