import 'package:fasd/fasdservice/fasdservice.dart';
import 'package:fasd/hiveuserlocale.dart';
import 'package:fasd/model/fasdviewmodel.dart';
import 'package:fasd/model/testviewmodel.dart';
import 'package:get/get.dart';

import 'dart:async';

import 'package:fasd/constantsfasd.dart';
Timer? timer;
var fasdlength1;
var fasdlength2;
  HiveUserLocale hi2=HiveUserLocale(); 
  List userBiore=hi2.getBio(); 

var imgg;
late var countFasdItems;
var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
class ViewfasdController extends GetxController{
var isLoading=false.obs;

var fasdlsta=List<FasV>.empty().obs;


@override
void onInit(){
super.onInit();


getFasds();
 
}

Future getFasds() async {

   try{
    isLoading(true);
   UserService uss=UserService();
   var fasds=await uss.getData(ViewAModel(id: userBiore[9], ugenid: userBiore[8], keypinnx: userBiore[17]));
   
    if(fasds!=null)
    {
      fasdlsta.value=fasds;
      fasdlength1=fasdlsta.length;
  }else{ 
 }
   }
   catch(e)
   {
   }
   finally{isLoading(false); }
}


}