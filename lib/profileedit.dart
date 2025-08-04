import 'package:fasd/constantsfasd.dart';
import 'package:fasd/fasdservice/fasdservice.dart';
import 'package:fasd/hiveuserlocale.dart';
import 'package:fasd/model/updatemodel.dart';
import 'package:fasd/widgets/TextFormFields.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
final _formKey = GlobalKey<FormState>();
var result;
var imgg="";
List<String> itemsa=['Select country','Afghanistan','Albania','Algeria','Andorra','Angola','Argentina','Armenia','Australia','Austria','Azerbaijan','Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil','Bulgaria','Burkina Faso','Burundi','Cabo Verde','Cambodia','Cameroon','Canada','Central African Republic','Chad','Chile','China','Colombia','Congo DRC','Congo Republic','Costa Rica','Cote dIvoire','Croatia','Cuba','Cyprus','Czech Republic','Denmark','Djibouti','Dominica','Dominican Republic','East Timor','Ecuador','Egypt','El Salvador','England','Equatorial Guinea','Eritrea','Estonia','Eswatini','Ethiopia','Fiji','Finland','France','Gabon','Gambia','Germany','Ghana','Greece','Guatemala','Haiti','Honduras','Hungary','Iceland','India','Indonesia','Iran','Iraq','Ireland','Israel','Italy','Jamaica','Japan','Jordan','Kazakhstan','Kenya','Korea North','Korea South','Kosovo','Kuwait','Kyrgyzstan','Latvia','Lebanon','Lesotho','Liberia','Libya','Liechtenstein','Lithuania','Luxembourg','Madagascar','Malawi','Malaysia','Mali','Malta','Mauritius','Mexico','Moldova','Morocco','Mozambique','Myanmar','Namibia','Nepal','Netherlands','New Zealand','Niger','Nigeria','Norway','Oman','Pakistan','Paraguay','Peru','Philippines','Poland','Portugal','Qatar','Romania','Russia','Rwanda','Samoa','Saudi Arabia','Scotland','Senegal','Serbia','Seychelles','Sierra Leone','Singapore','Slovakia','Slovenia','Somalia','South Africa','Spain','Sri Lanka','Sudan','Sudan South','Suriname','Sweden','Switzerland','Syria','Taiwan','Tajikistan','Tanzania','Thailand','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Uganda','Ukraine','United Arab Emirates','United States of America','Uruguay','Uzbekistan','Venezuela','Vietnam','Wales','Yemen','Zambia', 'Zimbabwe'];
String dropdownvalue=itemsa.first;  

 HiveUserLocale hi2=HiveUserLocale();
 List userBiore=hi2.getBio();
 


var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
  
class ProfileEditFasd extends StatefulWidget{
const ProfileEditFasd({super.key});

  @override
  State<ProfileEditFasd> createState() => _ProfileEditFasdState();
}

class _ProfileEditFasdState extends State<ProfileEditFasd> {
String? surnamex,homeaddressx,languagex,snumx,townx;

   // final _bioBox=Hive.box(dbfasdlocal);
    


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

updateInf(UpdateModelc updateModelc ) async {
  try{

    showDialog(context: context, builder:(context){

      return AlertDialog(
        title: Text("Please wait"),
        content: Text("Updating Profile..."),
      );
    } );
 await UserService().Updatefasd(updateModelc).then((success){
 Navigator.of(context, rootNavigator: true).pop();
 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile Updated...")));
 });
 
  }
  catch(e)
  {
    ///error
  }

}


  int selectedOption=1;
  @override
  Widget build(BuildContext context ){
          TextEditingController surname=TextEditingController(text: userBiore[10]);
     TextEditingController homeaddress=TextEditingController(text:userBiore[12]);
     TextEditingController town=TextEditingController(text: userBiore[13]);
      TextEditingController stastunumber=TextEditingController(text: userBiore[16]);
     TextEditingController language=TextEditingController(text: userBiore[15]);
TextEditingController mobileN=TextEditingController(text: userBiore[4]);
//var isDark=MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Scaffold(

      appBar: AppBar(title:const Text("EDIT PROFILE"),
      
      ),
      
    body: Form(
      key: _formKey,
        child: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
           
          const SizedBox(height: 10.0,),
         Row(
          
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
         const SizedBox(width:10),
  CircleAvatar(
                    radius: 10,
                     backgroundImage: AssetImage(imgg)),
                    const SizedBox(width:10.0),
                       Text(userBiore[5].toUpperCase()),
                       const SizedBox(width:10),

         ],),

         const SizedBox(height: 10.0,),

TextFormFieldss(controllerz: surname, validateText: 'Enter surname', lablezText: "Surname",iconz: Icon(Icons.person)),
          
            const SizedBox(height:20.0),
TextFormFieldss(controllerz: mobileN, validateText: 'Enter Mobile Number', lablezText: "Mobile Number",iconz: Icon(LineAwesomeIcons.mobile_phone)),
      
                 const SizedBox(height:20),
TextFormFieldss(controllerz: homeaddress, validateText: 'Enter Address', lablezText: "Home Address",iconz: Icon(Icons.home)),
 
           const SizedBox(height:20.0),
TextFormFieldss(controllerz: town, validateText: 'Enter Town', lablezText: "Town",iconz: Icon(Icons.gps_fixed_rounded)),
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
            SizedBox(width:15.0),
            
          DropdownButtonDays( ),
              ],),])
              ),
            
           const SizedBox(height:20.0),


TextFormFieldss(controllerz: language, validateText: 'Enter Language', lablezText: "Language" ,iconz: Icon(Icons.language)),
               


          
          const SizedBox(height:20.0),
          
          
          TextFormField(
            controller:stastunumber,
             style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
            labelText: "Student/Staff Number...Optional",
                prefixIcon: const Icon(Icons.badge_outlined),
                
                 border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:  const BorderSide(
            color:Colors.black,
          )
                ),
          enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:  const BorderSide(
            color:Colors.grey,
          )
                ), 
           focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:  const BorderSide(
            color:Colors.grey,
          )
                ), 
          
                 disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:  const BorderSide(
            color:Colors.black,
          )
                ),  
                fillColor: Colors.white,
                filled:true,
          
            ),
          ),
          const SizedBox(height:30.0),
           Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
              ElevatedButton(
            
          onPressed: () async
                 {
               
              if (_formKey.currentState!.validate())
          {
          //// ADD gender and name
           UpdateModelc updateModelc=UpdateModelc(surname: surname.text,phone: mobileN.text,reguid:userBiore[9],address:homeaddress.text,town:town.text,pinn:dropdownvalue,language: language.text,snum:stastunumber.text,keypinnx:userBiore[17],ugenid:userBiore[8]);
                       updateInf(updateModelc);
            }
           else
           { }
           
           
            
            } ,
            child: const Row( children: 
            [
                  Text("UPDATE PROFILE",
                  ),
                ],
                
                
            ),
                 
            ),
           const SizedBox(height: 30.0,),]
           ),
            ],
          ),
        ),
      ),
    ),
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


style:  const TextStyle(color:Colors.grey),
 underline: Container(
  height:2,
 ),

        icon:  const Icon(Icons.expand_circle_down_outlined,),
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

