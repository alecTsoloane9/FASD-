import 'package:fasd/MyInputTheme.dart';
import 'package:flutter/material.dart';

MyInputTheme myInputTheme=MyInputTheme();
ThemeData lightTheme=ThemeData(

 brightness: Brightness.light,
  inputDecorationTheme: const InputDecorationTheme(
 labelStyle: TextStyle(color: Colors.black), 
  
  ),

 elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:const Color.fromARGB(255, 194, 193, 193),
      textStyle: const TextStyle(letterSpacing: 1.8,
      //fontWeight: FontWeight.bold,
      fontWeight: FontWeight.w500,
      ),
  foregroundColor: Colors.white   
    )
   ),
textTheme:const TextTheme(
  bodyMedium: TextStyle(color: Colors.grey, ),

  
),



listTileTheme: const ListTileThemeData(
titleTextStyle: TextStyle( color: Color.fromARGB(255, 120, 120, 120),

),),

iconTheme: const IconThemeData(
  color:  Color.fromARGB(255, 194, 193, 193),
  weight: 10.0,
),
cardTheme: CardTheme(
  color:Color.fromARGB(255, 194, 193, 193),
)

); 
  












ThemeData darkTheme=ThemeData(
  brightness: Brightness.dark,
  inputDecorationTheme: const InputDecorationTheme(
  labelStyle: TextStyle(color: Color.fromARGB(255, 152, 151, 151)),
   ), 

   elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:const Color.fromARGB(255, 4, 4, 4),
      textStyle: const TextStyle(letterSpacing: 1.8,
      //fontWeight: FontWeight.bold,
      fontWeight: FontWeight.w500
      ),
    foregroundColor:const Color.fromARGB(255, 225, 222, 222)
     )
    ),
textTheme: const TextTheme(
  bodyMedium: TextStyle(color: Colors.white, ),

  
),
  listTileTheme:const ListTileThemeData(
titleTextStyle: TextStyle(
  color: Colors.white,
),),
iconTheme:const IconThemeData(
  color:  Colors.white,
  weight: 50.0,
),

);


