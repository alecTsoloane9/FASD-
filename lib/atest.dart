import 'package:fasd/constantsfasd.dart';
import 'package:fasd/hiveuserlocale.dart';
import 'package:fasd/model/fasdmodel.dart';
import 'package:fasd/fasdservice/fasdservice.dart';
import 'package:fasd/outcomez.dart';
import 'package:fasd/widgets/TextFormFields.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

final _formKey = GlobalKey<FormState>();
var result;
var imgg="";
 List<String> itemsa=['Duration','1 Day','7 Days','14 Days','1 Month','3 Months'];
 String dropdownvalue=itemsa.first;  
var x;

 HiveUserLocale hi2=HiveUserLocale();
 List userBiore=hi2.getBio();

var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
  
class Fas extends StatefulWidget {

Fas({super.key, required String naldo, required String itname, required String brname});

  @override
  State<Fas> createState() => _FasState();
}

class _FasState extends State<Fas> {
    String status="";
 
late String naldo;
late String itname;
late String brname;
String rating='0';

 add(UserModel userModel ) async {
  try{
  showDialog(context: context, builder: (context)
  { 
            return const AlertDialog( 
          title: Text("PLEASE WAIT...."), 
          content: Text("Creating FASD..."), 
        ); 
    
    },);

 var x=await UserService().addUser(userModel);
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Outcomez(X:x)));
 Navigator.of(context, rootNavigator: true).pop();
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
TextEditingController itnamet=TextEditingController();
TextEditingController brnamet=TextEditingController();
TextEditingController snumbert=TextEditingController();
TextEditingController gpin=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 body:
Form(
      key: _formKey,
        child:
        Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children:[
Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
              ElevatedButton(
          onPressed: () async
                 { Navigator.pop(context); } ,
                  child:const Row( children: 
            [Text("BACK",),],
            ),
 ),
                   
                   ]
            ),
           const  SizedBox(height:10),
                          
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: 
             [const SizedBox(width:5),
                                CircleAvatar(
                    radius: 10,
                     backgroundImage: AssetImage(imgg)),
             
             Text("  "+userBiore[5].toUpperCase()),  const SizedBox(width:10),],) ,
              const SizedBox(height:7),
                ///////////////////////////////////////////////////
                ///
              
TextFormFieldss(
  controllerz:itnamet,
  validateText: "Enter Item Type",
lablezText: "Item type",
iconz: Icon(Icons.laptop),

),

         ///////////////////////////////////
         
         const SizedBox(height:20.0),


TextFormFieldss(
  controllerz:brnamet,
  validateText: "Enter Brand Name",
lablezText: "Brand Name",
iconz: Icon(Icons.abc_outlined),
),


          const SizedBox(height:20.0),


TextFormFieldss(
  controllerz:snumbert,
  validateText: "Enter Serial Number",
lablezText: "Serial Number",
iconz: Icon(Icons.abc_outlined),

),


         
         const SizedBox(height:20.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child:
          Column(children: [
          const  Text("OPTIONAL : RATE OFFICERS CONDUCT"),
          const  SizedBox(height:3.0),
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
             // print(rating);
              this.rating='$rating';
            },
          ), 
          ],),
          ),           const SizedBox(height:10),
          
          ////////
  Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child:
           Column(children:  [

            
          Row(children: [ const SizedBox(width:5),
           const Icon(LineAwesomeIcons.calendar),
           const SizedBox(width:15.0),
           DropdownButtonDays( ),
              ],),])
            ),
          
          ////////////////////////////
          const SizedBox(height:20.0),
           ////////////////////////////////////////////
         const  Row(children: [SizedBox(width:7,),Icon(LineAwesomeIcons.alternate_shield), Text("  "+"OFFICER"),],),
         const  SizedBox(height:6.0),


/*
TextFormFieldss(
  controllerz:gpin,
  validateText: "Enter Officer Pin",
lablezText: "Officer Pin",
iconz: Icon(Icons.pin),

        keyboardType: TextInputType.number,
          //inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],


),
*/
////////////////////////////////////////////////

 TextFormField(
  keyboardType: TextInputType.number,
            controller: gpin,
            validator: (gpinn)=>gpinn!.isEmpty?
            'Enter Officer Pin':null,
            autovalidateMode:AutovalidateMode.onUserInteraction ,
            
             style:const  TextStyle(color: Colors.black),
                decoration: InputDecoration(
                labelText: "Officer's Pin",
                prefixIcon:const  Icon(Icons.pin),
           border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
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
          borderSide:const  BorderSide(
            color:Colors.black,
          )
                ),  
                fillColor: Colors.white,
                filled:true,
          
            ),
          ),
         


         
            ///////////////////////////////////////////////////////////////////////////////////////GUARD FIELD ENDS HERE
          const SizedBox(height:5.0),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[ ElevatedButton(
                
                    onPressed: () async
                    {
//if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi ){
                       if (_formKey.currentState!.validate()){
                     UserModel userModel=UserModel(surname:userBiore[10],name:userBiore[5],phone:userBiore[4],snum:userBiore[16],gender:userBiore[11],address:userBiore[12],town:userBiore[13],id:userBiore[9],keypinnx:userBiore[17],ugenid:userBiore[8],producTy:itnamet.text,producNam:brnamet.text,producNum: snumbert.text,rat:rating,tokendo:gpin.text,listDa:dropdownvalue);
                      add(userModel);
                       } else{}
//}
                     }, 
                    child:const Row(children:[ Text("CREATE FASD   ",
                    //style: TextStyle(fontSize: 20,color: Colors.grey,),
                    ),
                    Icon(Icons.rocket_launch_outlined
                        )],)
                    ),
                    const SizedBox(height: 90,)
              ],
            ),
          
          
          ]),
        ),

    
    ),////
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

 style: const TextStyle(color:Colors.grey),
 underline: Container(
  height:2,
  //color:Colors.grey
 ),
       icon:const Icon(Icons.expand_circle_down_outlined,),

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


          
