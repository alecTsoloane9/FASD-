import 'dart:convert';
import 'package:fasd/model/fasdmodel.dart';
import 'package:fasd/model/fasdviewmodel.dart';
import 'package:fasd/model/feedbackmodel.dart';
import 'package:fasd/model/helpamodel.dart';
import 'package:fasd/model/regamodel.dart';
import 'package:fasd/model/regamodelb.dart';
import 'package:fasd/model/regamodelc.dart';
import 'package:fasd/model/reportmodel.dart';
import 'package:fasd/model/submodel.dart';
import 'package:fasd/model/testviewmodel.dart';
import 'package:fasd/model/updatemodel.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:fasd/constantsfasd.dart';
var fhivedbname=Co();
var fasddblocal=fhivedbname.dbhi;
class UserService{
 ///PRODUCTION
 static const URLL="https://www.dgfe.co.za/flufasdcreate.php";
 var VFURL="https://www.dgfe.co.za/fluviewuserfasd";
 static const Reg1="https://www.dgfe.co.za/flus1.php";
 static const Reg2="https://www.dgfe.co.za/flus2.php";
 static const Reg3="https://www.dgfe.co.za/flupuli.php";
 static const Updf="https://www.dgfe.co.za/fluupdateuser.php";
 static const Helpd="https://www.dgfe.co.za/fluhelpdo.php";
 static const Subf="https://www.dgfe.co.za/activatedog.php";
 static const Feedblnk="https://www.dgfe.co.za/flufeedback.php";
 static const Reportlnk="https://www.dgfe.co.za/flureportsaps.php";

 ////*/


var uconfirme;
 final _bioBox=Hive.box(fasddblocal);

 Future<String> addUser(UserModel usermodel) async{
  
 final response= await http.post(Uri.parse(URLL),body:usermodel.toJsonAdd());
 if(response.statusCode==200){
 final verdictt=(jsonDecode(response.body)) as Map<String,dynamic>;
  
 var v=('${verdictt['verdict']}');
  
 if(v=="Created")
 {return "OK";}
 else{return "ER";}
 }
 else{return "ERROR";}

 }


 Future<String?> regS1(RegAModel regamodel) async{
 final response= await http.post(Uri.parse(Reg1),body:regamodel.toJsonAdd());
 if(response.statusCode==200){
  final idd=(jsonDecode(response.body)) as Map<String,dynamic>;
   var i=('${idd['id']}');
  var v=('${idd['verdict']}');
  var p=('${idd['pin']}');
  if(v=="Verifying")
  {
 
   var name=regamodel.name;
   var phone=regamodel.phone;
   var email=regamodel.email;
   
    _bioBox.put('name', name);
    _bioBox.put('phone', phone);
    _bioBox.put('email', email);
    _bioBox.put('idd', i);///from server
    _bioBox.put('ugenid', email);
    _bioBox.put('pin', "XXXX");
    _bioBox.put('confirm',"XXXX");
          
  return (i);
 }
 else{return "ERROR";}

  }
 }

 ////////////////////////////////////////////////////////////////////////////////////////////////
 Future<String?> regS2(RegAModelb regamodelb) async{
 final response= await http.post(Uri.parse(Reg2),body:regamodelb.toJsonAdd());

 if(response.statusCode==200){
  final iddd=(jsonDecode(response.body)) as Map<String,dynamic>;
   uconfirme=('${iddd['data']}'); ////data:confirmed
   if(uconfirme=="Complete"){
   var id=regamodelb.id;
   var pinn=regamodelb.pinn;
   var email=regamodelb.email;

   var phone=_bioBox.get('phone');
   var name=_bioBox.get('name');
   var emaill=_bioBox.get('email');
   var ugenid=_bioBox.get('ugenid');
   var iddotp=_bioBox.get('idd');

       _bioBox.delete('name');
       _bioBox.delete('phone');
       _bioBox.delete('email');
       _bioBox.delete('idd');
        _bioBox.delete('pin');
        _bioBox.delete('confirm');
       _bioBox.delete('ugenid');

       _bioBox.put('name', name);
       _bioBox.put('phone', phone);
       _bioBox.put('email', email);
        _bioBox.put('idd', id);
       _bioBox.put('pin', pinn);
       _bioBox.put('ugenid', email);
       _bioBox.put('confirm', uconfirme);
       _bioBox.put('registered', "XXXX");
     _bioBox.put('keypinnx',"XXXX");
  return (uconfirme);
   }
   else
   {return "bad";}
 }
 else{ return "ERROR";}
 }  //////end of function
 /////////////////////////////////////////////////////////////////////////////////////////////////////////
 Future<String?> regS3(RegAModelc regamodelc) async{
 final response= await http.post(Uri.parse(Reg3),
 body:regamodelc.toJsonAdd());
 if(response.statusCode==200){
  final iddd=(jsonDecode(response.body)) as Map<String,dynamic>;

  //print(iddd);
   String finreg=('${iddd['id']}'); /////reguid
   

   var surname=regamodelc.surname;
   var snum=regamodelc.snum;
   var gender=regamodelc.gender;
   var address=regamodelc.address;
   var town=regamodelc.town;
   var language=regamodelc.language;
   var country=regamodelc.pinn; 

 var verdi1=_bioBox.get('idd').toString();

 var verdi2=_bioBox.get("pin").toString();

 var verdi3=_bioBox.get("confirm").toString();

 var verdi4=_bioBox.get("email").toString();
 var verdi5=_bioBox.get("phone").toString();
 var verdi6=_bioBox.get("name").toString();
 var verdi7=_bioBox.get("registered").toString();
 var verdi8=_bioBox.get("registeredsub").toString();
 var verdi9=_bioBox.get("ugenid").toString();
 var verdi10=_bioBox.get("reguid").toString();

       _bioBox.delete('name');
       _bioBox.delete('phone');
      _bioBox.delete('email');
       _bioBox.delete('idd');
        _bioBox.delete('pin');
        _bioBox.delete('confirm');
        _bioBox.delete('ugenid');
        _bioBox.delete('registered');
        _bioBox.delete('keypinnx');
          
          
         verdi10=finreg;
         verdi7="Registered";
        _bioBox.put('idd', verdi1);
       _bioBox.put('pin', verdi2); //otppin
       _bioBox.put('confirm', verdi3);
      _bioBox.put('email', verdi4);
      _bioBox.put('phone', verdi5);
       _bioBox.put('name', verdi6);
       _bioBox.put('registered',verdi7);
       _bioBox.put('registeredsub', verdi8);
       _bioBox.put('ugenid', verdi4);
    _bioBox.put('reguid',verdi10);
 _bioBox.put('surname',surname);
  _bioBox.put('gender',gender);
   _bioBox.put('address',address);
   _bioBox.put('town',town);
    _bioBox.put('country',country);
     _bioBox.put('language',language);
      _bioBox.put('staffnumber',snum);
      _bioBox.put('keypinnx',"XXXX");
  return (uconfirme);
 }
 else{ return "ERROR";
 }
 }  //////end of function

 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /////////////////////////////////////////////////////////////////////////////////////////////////////////
 Future<String?> Updatefasd(UpdateModelc updateModelc) async{
 final response= await http.post(Uri.parse(Updf),
 body:updateModelc.toJsonAdd());

 ///////////////////////

 var surname="";
   var snum="";
   var address="";
   var town="";
   var language="";
   var country=""; 
   var phone="";

 
 var verdi1="";

 var verdi2="";

 var verdi3="";

 var verdi4="";
 var verdi5="";
 var verdi6="";
 var verdi7="";
 var verdi8="";
 var verdi9="";
 var verdi10="";   


 var verdi11="";
 var verdi12="";
 var verdi13="";
 var verdi14="";
 var verdi15="";
 var verdi16="";
 var verdi17="";
 var verdi18="";



 /////////////////////////
 if(response.statusCode==200){
  final iddd=(jsonDecode(response.body)) as Map<String,dynamic>;
   String updatefa=('${iddd['data']}'); 
   if(updatefa=="Updated")
 /////////////////////////
 {
    surname=updateModelc.surname;
    snum=updateModelc.snum;
    address=updateModelc.address;
    town=updateModelc.town;
    language=updateModelc.language;
    country=updateModelc.pinn; 
    phone=updateModelc.phone;

 verdi1=_bioBox.get('idd').toString();

 verdi2=_bioBox.get("pin").toString();

 verdi3=_bioBox.get("confirm").toString();

 verdi4=_bioBox.get("email").toString();
 verdi5=_bioBox.get("phone").toString();
 var naam=_bioBox.get("name").toString();
 //verdi6=_bioBox.get("name").toString();
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

       _bioBox.delete('name');
       _bioBox.delete('phone');
      _bioBox.delete('email');
       _bioBox.delete('idd');
        _bioBox.delete('pin');
        _bioBox.delete('confirm');
        _bioBox.delete('ugenid');
       _bioBox.delete('registered');
       _bioBox.delete('registeredsub');
        _bioBox.delete('reguid');
       _bioBox.delete('surname');
        _bioBox.delete('gender');
       _bioBox.delete('address');
       _bioBox.delete('town');
       _bioBox.delete('country');
       _bioBox.delete('language');
       _bioBox.delete('staffnumber');
        _bioBox.delete('keypinnx');
       //////////////////////////////////////////////
         
         verdi7="Registered";
        _bioBox.put('idd', verdi1);
        _bioBox.put('pin', verdi2); //otppin
       _bioBox.put('confirm', verdi3);
       _bioBox.put('email', verdi4);
       _bioBox.put('phone', phone);
       _bioBox.put('name', naam);
       _bioBox.put('registered',verdi7);
       _bioBox.put('registeredsub', verdi8);
       _bioBox.put('ugenid', verdi4);
      _bioBox.put('reguid',verdi10);
      _bioBox.put('surname',surname);
      _bioBox.put('gender',verdi12);
      _bioBox.put('address',address);
      _bioBox.put('town',town);
      _bioBox.put('country',country);
      _bioBox.put('language',language);
      _bioBox.put('staffnumber',snum);
      _bioBox.put('keypinnx',verdi18);
 }  
   ////////////////////////////
  return (uconfirme);
 }
 else{ return "ERROR";}
 }  //////end of function

 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

 ///////////////////////////////keypin

Future<String?> Subfasd(SubAModelc subAModelc) async{
 final response= await http.post(Uri.parse(Subf),
 body:subAModelc.toJsonAdd());

 ///////////////////////


 var verdi1="";

 var verdi2="";

 var verdi3="";

 var verdi4="";
 var verdi5="";
 var verdi6="";
 var verdi7="";
 var verdi8="";
 var verdi9="";
 var verdi10="";   


 var verdi11="";
 var verdi12="";
 var verdi13="";
 var verdi14="";
 var verdi15="";
 var verdi16="";
 var verdi17="";
 var verdi18="";



 ////////////////////////
 if(response.statusCode==200){
  final iddd=(jsonDecode(response.body)) as Map<String,dynamic>;
   String subverdi=('${iddd['data']}'); 
   if(subverdi=="Sub")
 /////////////////////////
 {
  String vounum=subAModelc.keypinnx;

 verdi1=_bioBox.get('idd').toString();

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

       _bioBox.delete('name');
       _bioBox.delete('phone');
      _bioBox.delete('email');
       _bioBox.delete('idd');
        _bioBox.delete('pin');
        _bioBox.delete('confirm');
        _bioBox.delete('ugenid');
       _bioBox.delete('registered');
       _bioBox.delete('registeredsub');
        _bioBox.delete('reguid');
       _bioBox.delete('surname');
        _bioBox.delete('gender');
       _bioBox.delete('address');
       _bioBox.delete('town');
       _bioBox.delete('country');
       _bioBox.delete('language');
       _bioBox.delete('staffnumber');
        _bioBox.delete('keypinnx');
       //////////////////////////////////////////////
         
         verdi7="Registered";
        _bioBox.put('idd', verdi1);
        _bioBox.put('pin', verdi2); //otppin
       _bioBox.put('confirm', verdi3);
       _bioBox.put('email', verdi4);
       _bioBox.put('phone', verdi5);
       _bioBox.put('name', verdi6);
       _bioBox.put('registered',verdi7);
       _bioBox.put('registeredsub', verdi8);
       _bioBox.put('ugenid', verdi4);
      _bioBox.put('reguid',verdi10);
      _bioBox.put('surname',verdi11);
      _bioBox.put('gender',verdi12);
      _bioBox.put('address',verdi13);
      _bioBox.put('town',verdi14);
      _bioBox.put('country',verdi15);
      _bioBox.put('language',verdi16);
      _bioBox.put('staffnumber',verdi17);
      _bioBox.put('keypinnx',vounum);

 }  
   ////////////////////////////
  return (uconfirme);
 }
  else{ return "ERROR";}
 }  //////end of function





 /////////////////////////////////////keypin
 ////////////////////////////////
 List<UserModel> userFromJson(String jsonString){
  final data=jsonDecode(jsonString);
  return List<UserModel>.from(data.mapp((item)=>UserModel.fromJson(item)));
 }
 Future<List<UserModel>> getFasds()async{
  final response=await http.get(Uri.parse(VFURL));
  if(response.statusCode==200){
    List<UserModel> list=userFromJson(response.body);
    return list;
    
  }
  else{
    return List<UserModel>.empty();
  }
 }

 ////////////////////////////////
 Future<String?> Helpa(HelpAModel helpAModel) async{
 final response= await http.post(Uri.parse(Helpd),
 body:helpAModel.toJsonAdd());
 if(response.statusCode==200){
  
  return ("true");
 }
 else{
  return "ERROR";
 }
 }



 Future getData(ViewAModel viewAModel) async {

  const VFURL="https://www.dgfe.co.za/fluviewuserfasd.php";
  var response= await http.post(Uri.parse(VFURL),body:viewAModel.toJsonAdd());
  if(response.statusCode==200)
  {
  var jsonString=response.body;
  return fasVFromJson(jsonString);
  }
 
 }

  





 Future<String?>  feedbaksvs(FeedBackf feedbackf) async{
 final response= await http.post(Uri.parse(Feedblnk),body:feedbackf.toJsonAdd());

 if(response.statusCode==200){
  return "ok";    
 }
 else{ return "ERROR";}
 }


 Future<String?>  reportfasd(ReportModel reportModel) async
 {
  
 final response= await http.post(Uri.parse(Reportlnk),body:reportModel.toJsonReport());

 if(response.statusCode==200){
  
  return "ok"; }
 else{ return "ERROR";}
 }




}

