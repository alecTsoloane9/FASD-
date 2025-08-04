import 'package:fasd/fasdservice/fasdservice.dart';
import 'package:fasd/model/helpamodel.dart';
import 'package:fasd/widgets/TextFormFields.dart';

import 'package:flutter/material.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

final _formKey = GlobalKey<FormState>();
class Fasdhelpa extends StatefulWidget{

String uuid;
  Fasdhelpa({super.key, required this.uuid});

  @override
  State<Fasdhelpa> createState() => _FasdhelpaState();
}

class _FasdhelpaState extends State<Fasdhelpa> {
String? email,mobileNumber;

add(HelpAModel helpAModel ) async {
 try{

  showDialog(context: context, builder: (context)
  { 
            return const AlertDialog( 
          title: Text("PLEASE WAIT...."), 
          content: Text("Sending..."), 
        ); 
    
    },);

 await UserService().Helpa(helpAModel).then((success){
Navigator.of(context, rootNavigator: true).pop();
ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Will contact you shortly...")));


 });
 }
 catch(e)
 {
  //error here
 }
}

  @override
  Widget build(BuildContext context){
    
      TextEditingController emailA=TextEditingController(text:email);
      TextEditingController mobileN=TextEditingController(text: mobileNumber);

    return Scaffold(
      appBar: AppBar(title: const Text("HELP")),
      body:Form(
      key: _formKey,
        child:
        Container(
          padding:const EdgeInsets.all(10),
          child: ListView(
            children:[
                /////////////////////////////////////////////////////////////////////////////////// USER START HERE
                Image.asset('lib/img/fasd.PNG',height:150),
                
          TextFormField(
            controller: emailA,
              validator: (uemail)=>uemail!.isEmpty?
              'Enter email':null,
              autovalidateMode:AutovalidateMode.onUserInteraction ,
                 style:const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                labelText: "Email address",
                prefixIcon:const Icon(Icons.email),
                
                 border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const  BorderSide(
            color:Colors.black,
          )
                ),
          enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const  BorderSide(
            color:Colors.grey,
          )
                ), 
           focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const  BorderSide(
            color:Colors.grey,
          )
                ), 
          
                 disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color:Colors.black,
          )
                ),  
                fillColor: Colors.white,
                filled:true,
          
            ),
          ),
         const  SizedBox(height:20.0),
TextFormFieldss(controllerz: mobileN, validateText: 'Enter Mobile number', lablezText: "Mobile number", iconz: Icon(LineAwesomeIcons.mobile_phone)),

         
         const  SizedBox(height:35.0),

          
          
             const Center(child:  Text('Let us help you with registering...',)),
                        const SizedBox(height:30),
          
          //////////////////////////////////////////////////////////////
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            const  SizedBox(width:20),
          ElevatedButton(
                onPressed: () async
                {
if(_formKey.currentState!.validate())
               { HelpAModel helpaModel=HelpAModel(id:widget.uuid!,phone:mobileN.text,email:emailA.text);
                 add(helpaModel);

               }
            }, child:const Row(children: [Text("SEND"), ],) 
            ),
          
              ]
          ),
          /////////////////////////////////////////////////
          ]
          ),
        ),
    ),
 
    );
  }
}