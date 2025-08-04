//import 'package:fasd/atest2.dart';
import 'package:fasd/atest3.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
//import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CreateFasdf extends StatefulWidget {
  const CreateFasdf({super.key});

  @override
  State<CreateFasdf> createState() => _CreateFasdfState();
}

class _CreateFasdfState extends State<CreateFasdf> {
  // This widget is the root of your application.

  List<Map<String,dynamic>> _items=[];

final _bioBox=Hive.box('itemf');
@override
void initState(){
  super.initState();
RebuildLista();

}
void RebuildLista(){

 final data=_bioBox.keys.map((key){
 final item=_bioBox.get(key);
 return {"key":key,"iname":item["iname"],"bname":item["bname"],"snumber":item["snumber"]};}).toList();
 setState((){
 _items=data.reversed.toList();});
}



Future<void> deletereco(int itemKey) async{
  await _bioBox.delete(itemKey);
RebuildLista();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: 

       Container(

          padding: const EdgeInsets.all(10),
         child: Column(children: [
                       Row(
                mainAxisAlignment: MainAxisAlignment.start,
                
                children:[      const  SizedBox(width:20),
                ElevatedButton(
            
            onPressed: () async
                   { 
                    Navigator.pop(context);
                     },
                   child:const Row( 
                          children: 
              [
            Text("BACK",
            ),
         
              ], 
              ), ),
                    const SizedBox(height:70.0),
                     ]
              ),
                               
          Flexible( child: 
          ListView.builder(
         
            itemCount: _items.length,
            itemBuilder:(_,index){
             final currentItem=_items[index];
              return Card(
               margin: const EdgeInsets.all(15),
                 elevation: 4,
                   child: ListTile(
                    isThreeLine: true,
                   title: Text(currentItem['iname']),
                    subtitle:Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(currentItem['bname']),
                       Text(currentItem['snumber']),
                      ],
                     
                    ),
                    
                    
                    //
                  
                    trailing:Row(
         mainAxisSize: MainAxisSize.min,
         children: [
         IconButton(onPressed: (){
           
         String indi=currentItem['snumber'].toString();
         String itemnamee=currentItem['iname'].toString();
         String brandnamee=currentItem['bname'].toString();
         Navigator.push(context,MaterialPageRoute(builder: (context)=>FasdLis(naldo:indi,itname:itemnamee,brname:brandnamee)));
         }, 
         
         icon: const Icon(Icons.rocket_launch)),
         const SizedBox(width:30),
         IconButton(
           icon: const Icon(Icons.delete),
         onPressed: ()=>deletereco (currentItem['key']), 
         //
         ),
         ],
         
                    ),
                   ),
                   );
         
                
                   }),

         ),
               ////children
         
          
          ] , 
          ),
       ) ,//////Column
        );
                 }
}

