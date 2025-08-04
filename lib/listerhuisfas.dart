import 'package:fasd/widgets/TextFormFields.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

final _formKey = GlobalKey<FormState>();

class ListerFasd extends StatelessWidget {
   ListerFasd({super.key});

TextEditingController myController=TextEditingController();

TextEditingController myController2=TextEditingController();

TextEditingController myController3=TextEditingController();

final _bioBox=Hive.box('itemf');

Future<void> _createItem(Map<String,dynamic> newItem) async{

await _bioBox.add(newItem);

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: 
 Form(
      key: _formKey,

   child:        
        Container(
          padding:const EdgeInsets.all(10),
          child: ListView(
            children:[
          
////////////////////

Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
              ElevatedButton(
            
            child:const Row( children: 
            [
          Text("BACK",
          ),

            ],
                
                
            ),
          onPressed: () async
                 {
          Navigator.pop(context);
           }      
              ),]
            ),
         const  SizedBox(height:20),
TextFormFieldss(controllerz: myController, validateText: "Enter Item Type", lablezText: "Item Type",iconz: Icon(Icons.laptop)),

            const SizedBox(height:40.0),
         TextFormFieldss(controllerz: myController2, validateText: "Enter Brand Name", lablezText: "Brand Name",iconz: Icon(Icons.abc_outlined)),
 const SizedBox(height:20.0),
          
 const SizedBox(height:20.0),
 TextFormFieldss(controllerz: myController3, validateText: "Enter Serial Number", lablezText: "Serial Number",iconz: Icon(LineAwesomeIcons.barcode)),
         const SizedBox(height:30),
          /////////////////////////
           
           Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
              ElevatedButton(
            
            child:const Row( children: 
            [
          Text("ADD TO LIST",
          ),
            ],
                
                
            ),
          onPressed: () async
                 {
              if (_formKey.currentState!.validate())
          {
           _createItem({
          "iname":myController.text,
          "bname":myController2.text ,
          "snumber":myController3.text,
          });
  
showDialog(context: context, builder: (context)
  { 
            return const AlertDialog( 
          title: Text("PLEASE WAIT...."), 
          content: Text("Adding item to list..."), 
        ); 
    
    },);
    
Navigator.of(context, rootNavigator: true).pop();
 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item added to list...")));
_formKey.currentState?.reset();
          }
           else
           { }
           }      
                  
                 
              ),]
            ),
           
              ], //children 
              ),
        ),
    ),
    
    
    );
  }
}
