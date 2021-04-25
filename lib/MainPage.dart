import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newest/ConverterPage.dart';
import 'package:newest/widgets/app_button/app_button.dart';


class MainPage extends StatefulWidget {
  MainPage({Key key}): super(key:key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{

  int firstNum = 0;
  int secondNum = 0;
  int holder = 0;
  String textToDisplay = '';
  String operation = '';
  String result = '';
  String operator = '';
  void btnOnClick(String btnVal){

    if(btnVal =="C"){
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      holder = 0;
      operation = '';
      result = '';
    }
    if(btnVal=="CON"){
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> ConverterPage()));
    }else if(btnVal == '+'|| btnVal == '-'|| btnVal == '*'||btnVal == '/'||btnVal == '^'){
      firstNum = int.parse(textToDisplay);
      result = '';
      operation = btnVal;
    }else if(btnVal =="="){
      secondNum = int.parse(textToDisplay);
      if(operation =='+'){
        result = (firstNum + secondNum).toString();
      }
      if(operation =='-'){
        result = (firstNum - secondNum).toString();
      }
      if(operation =='/'){
        result = (firstNum / secondNum).toString();
      }
      if(operation =='*'){
        result = (firstNum * secondNum).toString();
      }
      if(operation =='^'){
        result = (pow(firstNum, secondNum)).toString();
      }
    }else{
      result = int.parse(textToDisplay +btnVal).toString();

    }
    setState(() {
      textToDisplay = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter calculator'),
      ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Container(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  textToDisplay,
                  style: GoogleFonts.rubik(
                      textStyle:TextStyle(
                        fontSize: 48,
                        color: Colors.black,
                      )
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(text: 'C', callback: btnOnClick),
                AppButton(text: '^', callback: btnOnClick),
                AppButton(text: '*', callback: btnOnClick),
                AppButton(text: '/', callback: btnOnClick),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(text: '1', callback: btnOnClick),
                AppButton(text: '2', callback: btnOnClick),
                AppButton(text: '3', callback: btnOnClick),
                AppButton(text: '+', callback: btnOnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(text: '4', callback: btnOnClick),
                AppButton(text: '5', callback: btnOnClick),
                AppButton(text: '6', callback: btnOnClick),
                AppButton(text: '-', callback: btnOnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(text: '7',callback: btnOnClick),
                AppButton(text: '8',callback: btnOnClick),
                AppButton(text: '9',callback: btnOnClick),
                AppButton(text: '=',callback: btnOnClick),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(text: '0',callback: btnOnClick),
                AppButton(text: 'CON',callback: btnOnClick),
              ],
            ),
          ],
        ),
      ),

    );
  }
}