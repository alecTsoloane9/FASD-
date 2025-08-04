import 'package:fasd/constantsfasd.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

String? verdi11,verdi12,verdi6;var imgg;
var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
  
class userbiocardHead extends StatefulWidget {
  const userbiocardHead({super.key});

  @override
  State<userbiocardHead> createState() => _userbiocardHeadState();
}

class _userbiocardHeadState extends State<userbiocardHead> {
    final _bioBox=Hive.box(dbfasdlocal);
      @override
void initState(){
  super.initState();
verdi6=_bioBox.get("name").toString();
verdi11= _bioBox.get('surname').toString();
verdi12= _bioBox.get('gender').toString();


if(verdi12=="Male")
 {
 imgg='lib/img/fasdmalee.PNG';
 }
 else if(verdi12=="Female")
 {
  imgg='lib/img/fasdfemalee.PNG';
  }
 else
  {
  imgg='lib/img/otherr.PNG';
  }
}

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                 height: 80,child:
                 Column(children: [
                    CircleAvatar(
                    radius: 27,
                     backgroundImage: AssetImage(imgg)),
                     
                     Text("${verdi6!} ${verdi11!}", style: GoogleFonts.monda(),),
const SizedBox(height: 5.0,),
                  
],)
      
    );
  }
}