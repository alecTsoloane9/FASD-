//import 'package:fasd/fasdbasehome.dart';
import 'package:fasd/constantsfasd.dart';
import 'package:fasd/main.dart';
import 'package:fasd/registerfasda.dart';
import 'package:fasd/registerfasdb.dart';
import 'package:fasd/registerfasdc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
String? verdi1;String? verdi2;String? verdi3;String? verdi4;String? verdi5;String? verdi6;String? verdi7;String? verdi8;String? verdi9;String? verdi10;
String? verdi11;String? verdi12;String? verdi13;String? verdi14;String? verdi15;String? verdi16;String? verdi17;String? verdi18;

final _bioBox=Hive.box('itms');
var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
  
class FasdSpalsh extends StatefulWidget {
const FasdSpalsh({super.key});

  @override
  State<FasdSpalsh> createState() => _FasdSpalshState();
}

class _FasdSpalshState extends State<FasdSpalsh> {
   List<Map<String,dynamic>> _items=[];
   final _bioBox=Hive.box(dbfasdlocal);

late bool regy;

@override
void initState(){
  super.initState();

verdi1=_bioBox.get('idd');

verdi2=_bioBox.get("pin").toString();

verdi3=_bioBox.get("confirm").toString();

verdi4=_bioBox.get("email").toString();
verdi5=_bioBox.get("phone").toString();
verdi6=_bioBox.get("name").toString();
verdi7=_bioBox.get("registered").toString();
verdi8=_bioBox.get("registeredsub").toString();
verdi9=_bioBox.get("ugenid").toString();
verdi10=_bioBox.get("reguid").toString();   


verdi11= _bioBox.get('surname').toString();
verdi12= _bioBox.get('gender').toString();
verdi13=_bioBox.get('address').toString();
verdi14=_bioBox.get('town').toString();
verdi15=_bioBox.get('country').toString();
verdi16=_bioBox.get('language').toString();
verdi17=_bioBox.get('staffnumber').toString();
verdi18=_bioBox.get('keypinnx').toString();

if(verdi1==null || verdi1=="")
{
 navigatetoreg1();///// ID OF OTP SENT IS VERDI1 IS NULL, GO TO registerfasda.dart,
// print("STEP 1 TO REGISTER");
}

else if(verdi2=="XXXX")
{
navigatetoreg2();////OTP IS NULL, OTP IS VERDI2, GO TO re
}
else if(verdi3=="XXXX")
{
 navigatetoreg3(); ////reg c step
}
 else if(verdi7=="XXXX")
 { 
   navigatetoreg3();
  } 
else if(verdi7=="Registered"){
 
 navigaHuis();   ///at main second class
}


}


  navigatetoreg1() async{
   //    print("ENTERING REG 1");
    await Future.delayed(const Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FirstRegg()));
  }
  navigatetoreg2() async{
   // print("ENTERING REG 2");
    await Future.delayed(const Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FirstReggb()));
  }
    navigatetoreg3() async{
    //     print("ENTERING REG 3");
    await Future.delayed(const Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FinReg()));
  }
  
  navigaHuis() async{
      // print("ENTERING REG HOME");
    await Future.delayed(const Duration(milliseconds: 2000),(){});

    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyNavigationBar()));
    //BELOW IS OLD BUT WORKS 2024-0106 remove ///
//   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FasdHomeBase()));
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>App()));

   //home: const App(),

  }

  
  navigatetoreg5() async{
    await Future.delayed(const Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FirstRegg()));
  }
  
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      //return MaterialApp(
      backgroundColor: Colors.white,
      body: Center(
       child:
       Column(
        children:
       [
Image.asset('lib/img/fasd.PNG',height:250
),

const SizedBox(height:30),
const Text("Everywhere Everyone"),
const SizedBox(height:30),
             const SizedBox(width:10),
      ],)),
        );

  }
  
 
}
