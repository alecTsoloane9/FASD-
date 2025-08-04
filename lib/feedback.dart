import 'package:fasd/constantsfasd.dart';
import 'package:fasd/fasdservice/fasdservice.dart';
import 'package:fasd/model/feedbackmodel.dart';
import 'package:flutter/material.dart';
import 'package:fasd/hiveuserlocale.dart';
 List<String> itemsa=['Select department','Technical','Marketing','General'];
 String dropdownvalue=itemsa.first; 
 var imgg="";

  HiveUserLocale hi2=HiveUserLocale(); 

 List userBiore=hi2.getBio();  

  var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
  
 final _formKey = GlobalKey<FormState>();
 class FeedbackFasd extends StatefulWidget{
  @override
  State<FeedbackFasd> createState() => _FeedbackFasdState();
}

class _FeedbackFasdState extends State<FeedbackFasd> {



   feedbk(FeedBackf feedbackf ) async {
  try{
    showDialog(context: context, builder:(context){

      return AlertDialog(
        title: Text("Please wait"),
        content: Text("Sending message..."),
      );
    } );
 await UserService().feedbaksvs(feedbackf).then((value) {
  Navigator.of(context, rootNavigator: true).pop();
 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Thank you...message sent")));
 _formKey.currentState?.reset();
 });

 }
 catch(e)
 {
  //error here.
 }
 
}
  
  @override
void initState(){
  super.initState();

  if(userBiore[11]=="Male")
 {
 imgg='lib/img/sxmals.png';
 }
 else if(userBiore[11]=="Female")
 {
  imgg='lib/img/sxfems.png';
  }
 else
  {
  imgg='lib/img/otherr.PNG';
  }

}

  @override
  Widget build(BuildContext context){
    TextEditingController myController=TextEditingController();
    return Scaffold(
      appBar: AppBar(title:const Text("FEEDBACK")),



      body: 
 Form(
      key: _formKey,

   child:        
        Container(
          padding:const EdgeInsets.all(10),
          child: ListView(
            children:[

              Row(
                
                children: 
              [
              const  SizedBox(width:10.0),
                
                  CircleAvatar(
                    radius: 10,
                     backgroundImage: AssetImage(imgg)),
             const SizedBox(width: 10.0,),Text("Hello "+userBiore[5]
             // $verdi6"
             
             )]),
            const  SizedBox(height: 10.0,),
       
       
         Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child:
          Column(children: [

            
             Row(children: [SizedBox(width:5),
       Icon(Icons.settings),SizedBox(width: 20.0,) ,DropdownButtonFb()  ],),])
            ),
          
          
        const  SizedBox(height:20),
           Container(
             
             
               child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 4,
                maxLines: 5,
                maxLength: 400,
              controller:myController,
            validator: (name)=>name!.isEmpty?
            'Enter Message':null,
            autovalidateMode:AutovalidateMode.onUserInteraction ,
            
               style:const TextStyle(color: Colors.black),
            decoration:  InputDecoration(
             
            labelText: "Message...",
            prefixIcon:const Icon(Icons.message,),
               
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
              
              ),
             
             
             ),
           
          
          
          
         const SizedBox(height:30.0),
               
           
           Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
              ElevatedButton(
            
            child:const Row( children: 
            [
          Text("SEND",),
            ],
                
                
            ),
 onPressed: () async
                 {
              if (_formKey.currentState!.validate())
          {
         FeedBackf feedBackf= FeedBackf(name: userBiore[5], gender: userBiore[11], town: userBiore[13], phone: userBiore[4], id: userBiore[0], email: userBiore[3], smss: myController.text, departments: dropdownvalue,ugenid:userBiore[9] );
                         feedbk(feedBackf);
                         
                         

    
/////
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




class DropdownButtonFb extends  StatefulWidget{
  const DropdownButtonFb({super.key});
  
  @override
  State<DropdownButtonFb> createState() => _DropdownButtonFb();
  
  }

 class _DropdownButtonFb extends State<DropdownButtonFb>{
  @override
  Widget build(BuildContext context) {
       return DropdownButton<String>(
      value: dropdownvalue,

 style:const TextStyle(color:Colors.grey),
 underline: Container(
  height:2,
 ),
        icon: const Icon(Icons.expand_circle_down_outlined,),

      onChanged: (String? value){
 setState(() {
  dropdownvalue='$value';
 }); },
      items: itemsa.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String >(
          value: value,
          child: Text(value),
          );
      }).toList(),
            
      );
    }
}  


          
