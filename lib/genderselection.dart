import 'package:fasd/genderselectcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 var gendz;
class GenderSelection extends StatelessWidget{


  GenderSelectionController genderSelectionController=Get.put(GenderSelectionController());
  
 GenderSelection({Key? key,}):super(key: key);



  @override
 Widget build(BuildContext context){
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
 border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
               ),
 child: (Row
  (children: [
  
  const  Text("Male"),
   Obx(()=>Radio(
   value: "Male",
   groupValue: genderSelectionController.selectedGender.value, 
   activeColor: Colors.purple,
   fillColor: MaterialStateProperty.all(Colors.purple),
   onChanged:(value) {
    genderSelectionController.onChangedGender(value);
    gendz=genderSelectionController.selectedGender.value;
   })),

   const Text("Female"),
      Obx(()=>Radio(
   value: "Female",
   groupValue:genderSelectionController.selectedGender.value, 
   activeColor: Colors.purple,
   fillColor: MaterialStateProperty.all(Colors.purple),
   onChanged:(value) {
    genderSelectionController.onChangedGender(value);
    gendz=genderSelectionController.selectedGender.value;
   }),),


      const Text("Other"),
      Obx(()=>Radio(
   value: "Other",
   groupValue:genderSelectionController.selectedGender.value, 
   activeColor: Colors.purple,
   fillColor: MaterialStateProperty.all(Colors.purple),
   onChanged:(value) {
    genderSelectionController.onChangedGender(value);
    gendz=genderSelectionController.selectedGender.value;
   }),),
   
   
   ],
   ) 
   ),
  );
}
}