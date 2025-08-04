import 'package:fasd/listerhuisfas.dart';
import 'package:fasd/userbiocard.dart';
import 'package:fasd/userbiocardhead.dart';
import 'package:flutter/material.dart';
class FasdHomSc extends StatelessWidget {
  const FasdHomSc({super.key, });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
   const userbiocardHead(),



const fasdUserbiocard(),
const SizedBox(width: 10,height: 4,),
const SizedBox(width: 20,height: 10,child: Icon( Icons.home),),
const SizedBox(height: 14.0,),

Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
      ElevatedButton(
    onPressed: () async
                  {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ListerFasd()));
                  }, 
                    child:const Row( children: [Text("MAKE LIST",),
                    ],),
      ),
      ]
    ),
  
           ],
        ),
      ),
    ),
);
  }
}
