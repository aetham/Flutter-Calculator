

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}): super(key:key);
  @override
  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  List<String> operations= [];
  void initState() {
    super.initState();
    getValues();
  }

  void getValues() async{
    SharedPreferences share = await SharedPreferences.getInstance();
    List<String> a = share.getStringList('fuck');
    print(a);
    for(int i = 0; i < a.length; i++ ){
      operations.add(a[i]);
    }
    setState(() {
      a.toString();
    });

    }

  String mode = '';
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
              ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: operations.length,
              itemBuilder: (context, index){
                return Card (
                  child: ListTile(
                    title: Text(operations[index]),
                  ),
                );

              },
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed:() async{
                    getValues();
                  },
                  child: Text(
                      'get'
                  ),

                )
              ],
            ),

          ],
        ),
      ),
      );
  }
}