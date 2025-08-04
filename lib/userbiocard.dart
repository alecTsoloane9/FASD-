import 'package:fasd/Listatilebio.dart';
import 'package:fasd/hiveuserlocale.dart';
import 'package:flutter/material.dart';
import 'package:fasd/constantsfasd.dart';


 HiveUserLocale hi2=HiveUserLocale();
 List userBiore=hi2.getBio();

var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
  

class  fasdUserbiocard extends StatefulWidget {
  const fasdUserbiocard({super.key});

  @override
  State<fasdUserbiocard> createState() => _fasdUserbiocardState();
}

class _fasdUserbiocardState extends State<fasdUserbiocard> {
    @override
void initState(){
  super.initState();

}

  @override
  Widget build(BuildContext context) {
    return  Card(
    elevation: 3.0,
   
    child:
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
      children: [

SizedBox(

      child: 
      ListatileBio(icon: Icon(Icons.phone_android_rounded), str: userBiore[4]),
      ),

SizedBox(

      child:
            ListatileBio(icon: Icon(Icons.house), str: userBiore[12]),
            ),
  
  
  
    
    SizedBox(
      child: 
      ListatileBio(icon: Icon(Icons.location_city), str: userBiore[13]),
      ),

SizedBox(
      child: 
      ListatileBio(icon: Icon(Icons.flag_circle_rounded), str: userBiore[14]),
      ),

    SizedBox(
      child: 
      ListatileBio(icon: Icon(Icons.badge_outlined), str: userBiore[16]),
      ),
    
    
    
    ],)
    
    
    );

  }
}