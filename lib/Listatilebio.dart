import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListatileBio extends StatelessWidget {
  final Icon icon;
  final String str;
  const ListatileBio({required this.icon,required this.str ,super.key});

  @override
  Widget build(BuildContext context) {
    return 
     Card(
       child: ListTile(
        titleTextStyle: TextStyle(letterSpacing: 1.5,wordSpacing: 2.0,),
                    iconColor: Colors.white,
          title: Text(str, style: GoogleFonts.monda(),
           ),
         leading: Container(
          width: 30,height: 30,
           decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
         color: Colors.grey.withOpacity(0.1)
           ),
           child: icon
                
         ),
           ),
     );
  }
}