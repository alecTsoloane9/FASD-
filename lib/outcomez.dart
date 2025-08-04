import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class Outcomez extends StatefulWidget{

String X;
  
 Outcomez( {required this.X,super.key});

  @override
  State<Outcomez> createState() => _OutcomezState();
}

class _OutcomezState extends State<Outcomez> {
  @override
 Widget build(BuildContext context){
  return 

Scaffold(

body: 



   Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
 child: (Column
  (children: [
/////////////////////////


     

//////////////////////////
  widget.X=="OK"?
  const Center(
   child:  Column(
            children: [
              Icon(Icons.check_circle,size: 100,),
            SizedBox(height:30) ,Text("FASD CREATED"),
            ////////////
            
            ////////////
            ]
            ),
 )
 :  const Center(
   child:  Column(
            children: [Icon(Icons.cancel,size: 100,), SizedBox(height:30) , Text("FASD NOT CREATED"),      ]
            ),
 ),
 const SizedBox(height: 30,),
 Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
              ElevatedButton(
          onPressed: () async
                 {
Navigator.pop(context);

 },
             child:  Row( children: 
            [
       
          Text(widget.X=="OK"?"FINISH":"TRY AGAIN",
          ),
            const Icon(LineAwesomeIcons.angle_right,),
],),

 ),]
            ),
 ],
   ) 
   ),
   )
  );
}
}