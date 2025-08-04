
import 'package:fasd/fasdhelpa.dart';
import 'package:fasd/fasdservice/fasdservice.dart';
import 'package:fasd/model/regamodel.dart';
import 'package:fasd/registerfasdb.dart';
import 'package:fasd/widgets/TextFormFields.dart';
import 'package:flutter/material.dart';


import 'package:line_awesome_flutter/line_awesome_flutter.dart';
String uuid="STEP 1";
final _formKey = GlobalKey<FormState>();
var result;
  
class FirstRegg extends StatefulWidget{
    FirstRegg({super.key});
  @override
  State<FirstRegg> createState() => _FirstReggState();
}

class _FirstReggState extends State<FirstRegg> {
 String? Usname,email,mobileNumber;
 @override
void initState(){
  super.initState();
  }

add(RegAModel regaModel ) async {
  try{
  showDialog(context: context, builder: (context){return const Center(child: Center(child: CircularProgressIndicator( )),);});

 await UserService().regS1(regaModel).then((success){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FirstReggb()));
 });
  }
  catch(e)
  {
    ///error
  }
}

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
      TextEditingController nameU=TextEditingController(text: Usname);
      TextEditingController emailA=TextEditingController(text:email);
      TextEditingController mobileN=TextEditingController(text: mobileNumber);
  return Scaffold(

appBar:AppBar(title:const Text("Start Registration")),
body:Form(
      key: _formKey,
        child:
        Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children:[
Image.asset('lib/img/fasd.PNG',height:150),


                /////////////////////////////////////////////////////////////////////////////////// USER START HERE
                ///
          TextFormFieldss(controllerz: nameU, validateText: "Enter your name", lablezText: "Enter your name",iconz:Icon(Icons.person)),
          const SizedBox(height:20.0),
TextFormFieldss(controllerz: emailA, validateText: "Enter email", lablezText: "Email address",iconz: Icon(Icons.email)),
          const SizedBox(height:20.0),
      
  TextFormFieldss(controllerz: mobileN, validateText: "Enter Mobile number", lablezText: "Mobile number",iconz: Icon(LineAwesomeIcons.mobile_phone)),
       const SizedBox(height:20.0),
          ///////////////////////////////////////////////////////////////////////////////////////////////////// USER FIELD ENDS HERE
        const  SizedBox(height:10.0),
          //////////////////////////////////////////////////////////////////////////////////////////////GUARD FIELD
           const Center(child: Text('A pin will be sent to the email and mobile number  you provide...',textAlign: TextAlign.center, )),
                     const SizedBox(height:30),
          //////////////////////////////////////////////////////////////
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
             
          ElevatedButton(
                onPressed: () async
                            {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Fasdhelpa(uuid:uuid)));
                            }, 
                 child:const Row(children: [ Text("HELP")],) 
            ),
           const SizedBox(width:20),
          ElevatedButton(
                onPressed: () async
                {
           //  if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi ){     
if(_formKey.currentState!.validate()){
                  RegAModel regaModel=RegAModel(name:nameU.text,phone:mobileN.text,email:emailA.text);
                  add(regaModel);
}else{


  ///validate sms
}
           //  }else{///network sms }
            }, child:const Row(children: [Text("NEXT"),],) 
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