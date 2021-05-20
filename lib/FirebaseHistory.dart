
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class FirebaseHistory extends StatefulWidget {
  FirebaseHistory({Key key}): super(key:key);
  @override
  _FirebaseHistory createState() => _FirebaseHistory();
}

class _FirebaseHistory extends State<FirebaseHistory> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('calculation');

  @override
  Widget build(BuildContext context) {
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter converter'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: StreamBuilder(stream: collectionReference.snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasData){
                  return ListView(
                    children: snapshot.data.docs.map((e) => ListTile(title: Text(e['calculation']),)).toList(),
                  );
                }
                return Center(child: CircularProgressIndicator(),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}