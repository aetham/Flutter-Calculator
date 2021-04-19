import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppButton extends StatelessWidget{
  final String text;
  final Function callback;

  const AppButton({
    this.text,
    this.callback,
  });
  @override
  Widget build(BuildContext context){
    return Container(

          margin: EdgeInsets.all(10.0),
          child: SizedBox(
            width: 70,
            height: 70,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                text,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              onPressed: () =>callback(text),
              color: Color(0xFF8ac4d0),
              textColor: Color(0xFF000000),
            ),
          ),


    );
  }
}