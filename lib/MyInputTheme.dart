import 'package:flutter/material.dart';

class MyInputTheme {
  TextStyle _textStyle(Color color,{double size=16.0}){
    return TextStyle(color:color,
    fontSize:size
    );

  }
OutlineInputBorder _buildBorder(Color color){
return OutlineInputBorder(

  borderRadius: BorderRadius.all(Radius.circular(20)),
  borderSide: BorderSide(color:color,width: 1.0)
);
}

InputDecorationTheme theme()=>InputDecorationTheme(
  contentPadding: EdgeInsets.all(16),
  isDense: true,
  enabledBorder: _buildBorder(Colors.pinkAccent),
  errorBorder: _buildBorder(Colors.red),
  focusedErrorBorder: _buildBorder(Colors.pink),
  border: _buildBorder(Colors.grey),
  focusedBorder: _buildBorder(Colors.lime),
floatingLabelBehavior: FloatingLabelBehavior.always,
constraints: BoxConstraints(maxWidth:150),
counterStyle: _textStyle(Colors.black),
helperStyle: _textStyle(Colors.green),
labelStyle: _textStyle(Colors.black),

);

}