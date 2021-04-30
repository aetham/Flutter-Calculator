import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newest/widgets/app_button/app_button.dart';

class ConverterPage extends StatefulWidget {
  ConverterPage({Key key}): super(key:key);
  @override
  _ConverterPage createState() => _ConverterPage();
}

class _ConverterPage extends State<ConverterPage>{

  String result = '';
  String textToDisplay = '';
  String mode = 'Convert to MILES';
  String stateHolder = '';
  int number;
  void btnStuff(String btnVal){
    if (btnVal =='C'){
      textToDisplay = '';
      result = '';
    }else if (btnVal == "<") {
      Navigator.pop(context);
    } else if(btnVal =='KM/MIL'&& stateHolder =="Convert to MILES"){
      stateHolder ="Convert to KM";
      print(stateHolder);
      }else{
      stateHolder ="Convert to MILES";
      print(stateHolder);
    }
    setState(() {
      mode = stateHolder;
    });
  }
  void btnOnClick(String btnVal) {
    if(btnVal == "CONVERT") {
      if (stateHolder == "Convert to KM"){
        result = (number * 0.621371).toString();
      }else{
        result = (number / 0.621371).toString();
      }
    }else{
      number = int.parse(textToDisplay +btnVal);
      result = int.parse(textToDisplay +btnVal).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }
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
              Container(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    mode,
                    style: GoogleFonts.rubik(
                        textStyle:TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        )
                    ),
                  ),
                ),
                alignment: Alignment.center,
              ),

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
                  AppButton(text: '1', callback: btnOnClick),
                  AppButton(text: '2', callback: btnOnClick),
                  AppButton(text: '3', callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(text: '4', callback: btnOnClick),
                  AppButton(text: '5', callback: btnOnClick),
                  AppButton(text: '6', callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(text: '7',callback: btnOnClick),
                  AppButton(text: '8',callback: btnOnClick),
                  AppButton(text: '9',callback: btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(text: '<', callback: btnStuff),
                  AppButton(text: 'C', callback: btnStuff),
                  AppButton(text: 'KM/MIL', callback: btnStuff),
                  AppButton(text: 'CONVERT', callback: btnOnClick),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }