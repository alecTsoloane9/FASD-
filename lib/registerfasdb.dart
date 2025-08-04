import 'package:fasd/constantsfasd.dart';
import 'package:fasd/fasdhelpa.dart';
import 'package:fasd/fasdservice/fasdservice.dart';
import 'package:fasd/model/regamodelb.dart';
import 'package:fasd/registerfasdc.dart';
import 'package:fasd/widgets/TextFormFields.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
final _formKey = GlobalKey<FormState>();
String verdi1="",verdi2=""; String otpfasdU="";
var result;
var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
  
class FirstReggb extends StatefulWidget{
FirstReggb({super.key});

  @override
  State<FirstReggb> createState() => _FirstReggbState();
}

class _FirstReggbState extends State<FirstReggb> {
 final _bioBox=Hive.box(dbfasdlocal);
 
@override ///this was added in 2024-06-19
 void initState(){
  super.initState();
 verdi1=_bioBox.get('idd');
 verdi2=_bioBox.get("email");

}
add(RegAModelb regaModelb ) async {
try{
  showDialog(context: context, builder: (context) {return const Center(child: Center(child: CircularProgressIndicator( )),); });
 
 await UserService().regS2(regaModelb).then((success){
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FinReg()));
 });
}
catch(e){
  //error
}
}
  @override
  void dispose() {
    super.dispose();
  }
@override
  Widget build(BuildContext context){
  TextEditingController otpfasd=TextEditingController(text:otpfasdU);
     
     
     return Scaffold(
appBar:AppBar(title:const Text("Almost Done...")),
body:Form(
      key: _formKey,
        child:
     
Container(
        padding:const EdgeInsets.all(10.0),
        child:
        ListView(
          children:[
            Image.asset('lib/img/fasd.PNG',height:150),
      TextFormFieldss(controllerz: otpfasd, validateText: "Enter OTP", lablezText: "Enter OTP" ,iconz: Icon(Icons.pin)),
     
     const SizedBox(height:20.0),

const Icon(Icons.email_outlined),
const SizedBox(height:15.0),
   const Center(child: Text('A pin was sent to the email you provided...', )),
        const SizedBox(height:30.0),
 Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

          ElevatedButton(
                onPressed: () async
                            {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Fasdhelpa(uuid:verdi1)));
                            }, 
                 child:const Row(children: [ Text("HELP")],)
            ),
          const SizedBox(width:20),
ElevatedButton(
              onPressed: () async
              {

                 if (_formKey.currentState!.validate()){
                RegAModelb regaModelb=RegAModelb(id:verdi1,email:verdi2,pinn:otpfasd.text);
                add(regaModelb);} else{}

 }, 
              child:const Row(children: [Text("NEXT"),],) ),
              ]),

]
),
    ),
    )
    );
  }
}