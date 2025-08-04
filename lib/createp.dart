import 'package:fasd/atest.dart';
import 'package:fasd/createfasdf.dart';
import 'package:fasd/userbiocard.dart';
import 'package:fasd/userbiocardhead.dart';
import 'package:flutter/material.dart';

class CreateFasd extends StatelessWidget {
  const CreateFasd({super.key});
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
const SizedBox(width: 20,height: 10,child: Icon( Icons.create),),
const SizedBox(height: 14.0,),
     Row(
        
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            ElevatedButton(
                onPressed: () async
                            {
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const CreateFasdf()));
                            }, 
             child:const Row(children: [Text(" LISTED ",
             ),
                    ],
                   ),
                  ),
                  const SizedBox(width:10),
                     ElevatedButton(
                            onPressed: () async
                            {
                         String indi="";
                        String itemnamee="";
                        String brandnamee="";
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Fas(naldo:indi,itname:itemnamee,brname:brandnamee)));
                           }, 
          child: const Row(children: [Text("UNLISTED",
        ), 
          ],),
       ),
         ],),
     
            ],
        ),
      ),
    ),
    );  
  }
}
