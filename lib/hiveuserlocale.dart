import 'package:hive/hive.dart';
import 'package:fasd/constantsfasd.dart';

var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;

String verdi1="";String verdi2="";String verdi3="";String verdi4="";String verdi5="";String verdi6="";String verdi7="";String verdi8="";String verdi9="";String verdi10="";
String verdi11="";String verdi12="";String verdi13="";String verdi14="";String verdi15="";String verdi16="";String verdi17="";String verdi18="";String verdi19="";String verdi20="";
var imgg="";
 
class HiveUserLocale  {
 final _bioBox=Hive.box(dbfasdlocal);

 
List  getBio(){
  
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

 if(verdi12=="Male")
 {
 imgg='lib/img/sxmals.png';
 }
 else if(verdi12=="Female")
 {
  imgg='lib/img/sxfems.png';
  }
 else
  {
  imgg='lib/img/otherr.PNG';
  }
  List bioLista=[];

     bioLista.addAll([verdi1,verdi2,verdi3,verdi4,verdi5,verdi6,verdi7,verdi8,verdi9,verdi10,verdi11,verdi12,verdi13,verdi14,verdi15,verdi16,verdi17,verdi18,verdi19,verdi20
]);
return bioLista;

}


}

