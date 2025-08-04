import 'package:fasd/constantsfasd.dart';
import 'package:fasd/hiveuserlocale.dart';
import 'package:fasd/model/fasdmodel.dart';
import 'package:fasd/outcomez.dart';
import 'package:fasd/widgets/TextFormFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fasd/fasdservice/fasdservice.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

final _formKey = GlobalKey<FormState>();
 
 List<String> itemsa=['Duration','1 Day','7 Days','14 Days','1 Month','3 Months'];
 String dropdownvalue=itemsa.first; 
 var imgg=""; 

var result;
 HiveUserLocale hi2=HiveUserLocale();
 List userBiore=hi2.getBio();

var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
  
class FasdLis extends StatefulWidget{
  String itname;String brname; String naldo;

  FasdLis({super.key,  required this.naldo, required this.itname,required this.brname});

  @override
  State<FasdLis> createState() => _FasdLisState();
}

class _FasdLisState extends State<FasdLis> {

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
    //error 
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

  TextEditingController itnamet=TextEditingController(text: widget.itname);
    TextEditingController brnamet=TextEditingController(text:widget.brname);
      TextEditingController snumbert=TextEditingController(text: widget.naldo);
      TextEditingController gpin=TextEditingController();
      
    return Scaffold(
     // appBar:AppBar(title: Text("FASDEST")),

      body:Form(
      key: _formKey,
        child:
       Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children:[
          
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:[


   ElevatedButton(
            child:const Row( children: 
            [
              Text("BACK", ),
            ],
            ),
               onPressed: () async
                 {
                            Navigator.pop(context);
 }      
              ),
 ],),

  const SizedBox(height:10),
                          
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ const SizedBox(width:5),
            
              CircleAvatar(
                    radius: 10,
                     backgroundImage: AssetImage(imgg)),
             
              Text("  "+verdi6.toUpperCase()),  const SizedBox(width:10),],) ,
              const  SizedBox(height:7),

TextFormFieldss(controllerz: itnamet, validateText: 'Enter Item Type', lablezText: "Item Type",iconz: Icon(Icons.laptop)),

        const  SizedBox(height:20.0),
TextFormFieldss(controllerz: brnamet, validateText: 'Enter Brand Name', lablezText: "Brand Name",iconz: Icon(Icons.abc_outlined)),
        
         const   SizedBox(height:20.0),
        
TextFormFieldss(controllerz: snumbert, validateText: 'Enter Serial Number', lablezText: "Serial Number",iconz:Icon(LineAwesomeIcons.barcode)),
        
         
 const SizedBox(height:20.0),

 Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child:
          Column(children: [
         
 const Text("OPTIONAL : RATE OFFICERS CONDUCT"),
          const   SizedBox(height:10.0),
          
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) =>   Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              this.rating='$rating';
            },
          ), 
          ],),
          ),           const SizedBox(height:10),
          
          ///////////////////////////////////////////////////////////////////////////////////////////////////// USER FIELD ENDS HERE
          
          
          
          
          
          //////////////////////////////////////////////////////////////////////////////////////////////GUARD FIELD
              Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child:
          Column(children: [

            
              Row(children: [SizedBox(width:5),
          Icon(LineAwesomeIcons.calendar),
          SizedBox(width:15.0),
               DropdownButtonDays( ),
             ],),])
            ),
          
         
            const SizedBox(height:20.0),
           ////////////////////////////////////////////
          const   Row(children:  [SizedBox(width:7,),Icon(LineAwesomeIcons.alternate_shield), Text("  "+"OFFICER"),],),
            const  SizedBox(height:6.0),
          
      /*
TextFormFieldss(controllerz: gpin, validateText: 'Enter Officer Pin', lablezText: "Officer's Pin",
keyboardType: TextInputType.number ,
iconz:Icon(Icons.pin)),
    //////////////////////
*/


          TextFormField(
              keyboardType: TextInputType.number,
            controller: gpin,
            validator: (gpinn)=>gpinn!.isEmpty?
            'Enter Officer Pin':null,
            autovalidateMode:AutovalidateMode.onUserInteraction ,
            style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                labelText: "Officer's Pin",
                prefixIcon: const Icon(Icons.pin),
           border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const  BorderSide(
            color:Colors.black,
          )
                ),
          enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:const BorderSide(
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
          ///////////////////////////////////////////////////////////////////////////////////////GUARD FIELD ENDS HERE
         
         const SizedBox(height:5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
          ElevatedButton(
            
            child:const Row( children: [
          Text("CREATE FASD   ",
          //style: TextStyle(color: Colors.grey),
          ),
           Icon(Icons.rocket_launch_outlined
         ),
          Icon(Icons.rocket_launch_outlined,)
            ],
                
                
            ),
             onPressed: () async
                {
                if (_formKey.currentState!.validate())
                 { 
                    UserModel userModel=UserModel(surname:userBiore[10],name:userBiore[5],phone:userBiore[4],snum:userBiore[16],gender:userBiore[11],address:userBiore[12],town:userBiore[13],id:userBiore[9],keypinnx:userBiore[17],ugenid:userBiore[8],producTy:itnamet.text,producNam:brnamet.text,producNum: snumbert.text,rat:rating,tokendo:gpin.text,listDa:dropdownvalue);
                  add(userModel);
                 } else {  }
//}
                 },            
                ),
             const SizedBox(height: 90.0,),     
                   
                   ],       ),
          ]
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

 style: const TextStyle(color:Colors.grey),
 underline: Container(
  height:2,
  //color:Colors.grey
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


          
