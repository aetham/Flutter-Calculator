import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newest/MainPage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/*
  runApp(FutureBuilder<FirebaseApp>(
    future: Firebase.initializeApp(),
    builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      return MyApp();
    }
  ));
 */
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
