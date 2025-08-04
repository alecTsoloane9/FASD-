//import 'package:fasd/fasdhomebase.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fasd/constantsfasd.dart';
import 'package:fasd/fasdhelpa.dart';
import 'package:fasd/fasdservice/fasdservice.dart';
import 'package:fasd/genderselectcontroller.dart';
import 'package:fasd/genderselection.dart';
import 'package:fasd/main.dart';
import 'package:fasd/model/regamodelc.dart';
import 'package:fasd/widgets/TextFormFields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

List<String> itemsa=['Select country','Afghanistan','Albania','Algeria','Andorra','Angola','Argentina','Armenia','Australia','Austria','Azerbaijan','Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil','Bulgaria','Burkina Faso','Burundi','Cabo Verde','Cambodia','Cameroon','Canada','Central African Republic','Chad','Chile','China','Colombia','Congo DRC','Congo Republic','Costa Rica','Cote dIvoire','Croatia','Cuba','Cyprus','Czech Republic','Denmark','Djibouti','Dominica','Dominican Republic','East Timor','Ecuador','Egypt','El Salvador','England','Equatorial Guinea','Eritrea','Estonia','Eswatini','Ethiopia','Fiji','Finland','France','Gabon','Gambia','Germany','Ghana','Greece','Guatemala','Haiti','Honduras','Hungary','Iceland','India','Indonesia','Iran','Iraq','Ireland','Israel','Italy','Jamaica','Japan','Jordan','Kazakhstan','Kenya','Korea North','Korea South','Kosovo','Kuwait','Kyrgyzstan','Latvia','Lebanon','Lesotho','Liberia','Libya','Liechtenstein','Lithuania','Luxembourg','Madagascar','Malawi','Malaysia','Mali','Malta','Mauritius','Mexico','Moldova','Morocco','Mozambique','Myanmar','Namibia','Nepal','Netherlands','New Zealand','Niger','Nigeria','Norway','Oman','Pakistan','Paraguay','Peru','Philippines','Poland','Portugal','Qatar','Romania','Russia','Rwanda','Samoa','Saudi Arabia','Scotland','Senegal','Serbia','Seychelles','Sierra Leone','Singapore','Slovakia','Slovenia','Somalia','South Africa','Spain','Sri Lanka','Sudan','Sudan South','Suriname','Sweden','Switzerland','Syria','Taiwan','Tajikistan','Tanzania','Thailand','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Uganda','Ukraine','United Arab Emirates','United States of America','Uruguay','Uzbekistan','Venezuela','Vietnam','Wales','Yemen','Zambia', 'Zimbabwe'];

final _formKey = GlobalKey<FormState>();
var result;
 String dropdownvalue=itemsa.first;  
var gend;
String verdi1="N";String verdi2="";String verdi3="";String verdi4="";String verdi5="";String verdi6="";String verdi7="";String verdi8="";String verdi9="";String verdi10="";
var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
  
class FinReg extends StatefulWidget{
  
 FinReg({super.key});

  @override
  State<FinReg> createState() => _FinRegState();
}

class _FinRegState extends State<FinReg> {
String? surnamex,homeaddressx,languagex,snumx,townx;

  final _bioBox=Hive.box(dbfasdlocal);
/*
  Future<void> checkConnnectivity() async{
result=await Connectivity().checkConnectivity();
if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi ){
   // print("U ONLINE");
}
else if(result==ConnectivityResult.none){
  //print("U NOT ONLINE");
  }
}
*/
  @override
void initState(){
  super.initState();
  //checkConnnectivity();
  verdi1=_bioBox.get('idd').toString();

 verdi2=_bioBox.get("pin").toString();

 verdi3=_bioBox.get("confirm").toString();

 verdi4=_bioBox.get("email").toString();
 verdi9=verdi4;
 verdi5=_bioBox.get("phone").toString();
 verdi6=_bioBox.get("name").toString();
 verdi7=_bioBox.get("registered").toString();
 verdi8=_bioBox.get("registeredsub").toString();
 //verdi9=_bioBox.get("ugenid").toString();/////null change this //remove //and verdi9=verdi4
 verdi10=_bioBox.get("reguid").toString();    
     
}
String selectedgen="";


add(RegAModelc regaModelc ) async {
  try{
showDialog(context: context, builder: (context){return const Center(child: Center(child: CircularProgressIndicator( )),); });
 
 await UserService().regS3(regaModelc).then((success){
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const App()));

 });
  }
  catch(e){
    //arror
  }
}
  @override
  void dispose() {
    super.dispose();
  }
int selectedOption=1;
  @override
  Widget build (BuildContext context){
  Get.put(GenderSelectionController());
      TextEditingController surname=TextEditingController(text: surnamex);
      TextEditingController homeaddress=TextEditingController(text:homeaddressx);
     TextEditingController town=TextEditingController(text: townx);
      TextEditingController stastunumber=TextEditingController(text: snumx);
       TextEditingController language=TextEditingController(text: languagex);
     return Scaffold(

appBar:AppBar(title:const Text("Finish Registration...")),
body:
Form(
      key: _formKey,
        child:

Container(
        padding:const EdgeInsets.all(10.0),
        child:
        ListView(
          children:[
            Image.asset('lib/img/fasd.PNG',height:50),
Row(children: [const SizedBox(width:10),const Icon(Icons.person),
const SizedBox(width:10),Text(verdi6.toUpperCase())]),
const SizedBox(height:15.0),
      /////////////////////////////////////////////////////////////////////////////////// USER START HERE
      
      TextFormFieldss(controllerz: surname, validateText: "Enter Surname", lablezText: "Enter your surname",iconz: Icon(Icons.person)),
      

const SizedBox(height:15.0),
//////////////////////////////////////
GenderSelection(),


/////////////////////////////////
                  const   SizedBox(height:10),

TextFormFieldss(controllerz: homeaddress, validateText: "Enter address", lablezText: "Enter your home address",iconz: Icon(Icons.home)),


const SizedBox(height:20.0),
      
      TextFormFieldss(controllerz: town, validateText: "Enter Town", lablezText: "Town",iconz: Icon(Icons.gps_fixed_rounded)),
       
      
        const SizedBox(height:20.0),


Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child:
          const Column(children: [

            
             Row(children: [SizedBox(width:5),
          Icon(Icons.map_rounded),
          SizedBox(width:10.0),
           DropdownButtonDays( ),
              ],),])
            ),

      const SizedBox(height:20.0),
       
       TextFormFieldss(controllerz: language, validateText: "Enter Language", lablezText: "Language",iconz: Icon(Icons.language)),



        const SizedBox(height:20.0),
        

TextFormField(
          controller:stastunumber,

           style:const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          
      labelText: "Student/Staff Number...Optional",
      prefixIcon:const Icon(Icons.card_travel_rounded),
      
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
      const  SizedBox(height:40.0),


    const Center(
       child: Text('By pressing finish, you agree to terms and conditions...',
             
           ),
     ),
                      const SizedBox(height:30),

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
          const  SizedBox(width:20),
ElevatedButton(
              onPressed: () async
              {
               // if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi ) {
               if (_formKey.currentState!.validate()){  
              String gendmfo='$gendz';
            
           String  statsn =stastunumber.text;

if(statsn=="" || statsn.isEmpty){statsn="0000";} 

             RegAModelc regaModelc=RegAModelc(name:verdi6,surname:surname.text,pinn:dropdownvalue,phone:verdi5,snum:statsn,gender:gendmfo,address: homeaddress.text,town: town.text,ugenid: verdi9,language: language.text);
             add(regaModelc);


               }else{
               // print("Error in");
               }
              // }else{ // print("Error out");  }

                  }, 
              child:const Text("FINISH")
              ),
              ]),
const SizedBox(height:30),

]
),

    ),
     )
     );
  }
  
  
}



class DropdownButtonDays extends  StatefulWidget{
  const DropdownButtonDays({super.key});
  
  @override
  State<DropdownButtonDays> createState() => _DropdownButtonDays();
  
  }

 class _DropdownButtonDays extends State<DropdownButtonDays>{

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownvalue,

 underline: Container(
  height:2,
 ),
       icon: const Icon(Icons.expand_circle_down_outlined),

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
