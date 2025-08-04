import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class TextFormFieldss extends StatelessWidget {
  final TextEditingController controllerz;
  final String validateText;
  final String lablezText;
  final Icon iconz;
  
  const TextFormFieldss({super.key,required this.controllerz, required this.validateText, required this.lablezText,required this.iconz});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                  
          controller:controllerz,
          
          validator: (typee)=>typee!.isEmpty?
            validateText:null,
            autovalidateMode:AutovalidateMode.onUserInteraction ,
            
           style: const TextStyle(color: Colors.black),
                decoration:  InputDecoration(
                labelText: lablezText,
                prefixIcon: iconz,
          
                border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color:Colors.black,
          )
                ),
          enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color:Colors.grey,
          )
                ), 
           focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
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
          );
         
     
  }
}