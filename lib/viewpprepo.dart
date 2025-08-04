import 'package:fasd/constantsfasd.dart';
import 'package:fasd/fasdservice/fasdservice.dart';
import 'package:fasd/hiveuserlocale.dart';
import 'package:fasd/model/reportmodel.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

HiveUserLocale hi2=HiveUserLocale();
 List userBiore=hi2.getBio();


var hivedbobj=Co();
  var dbfasdlocal=hivedbobj.dbhi;
class FasdReporta extends StatefulWidget {
  String idnum;
  String ittype;
  String itbrand;
  String itserialnum;

  FasdReporta({super.key, required this.idnum, required this.ittype, required this.itbrand, required this.itserialnum});

  @override
  State<FasdReporta> createState() => _FasdReportaState();
}

class _FasdReportaState extends State<FasdReporta> {
 subreport(ReportModel reportModel) async{
 try{

    showDialog(context: context, builder:(context){

      return AlertDialog(
        title: Text("Please wait"),
        content: Text("Reporting..."),
      );
    } );

 await UserService().reportfasd(reportModel).then((value) {
  Navigator.of(context, rootNavigator: true).pop();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("REPORTED....")));  
 });
 
 }
 catch(e)
 {
  //error here.
 }
  

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:Padding(
  padding: const EdgeInsets.only(left: 30,right:30),
  child:  Column(
      children:[
    
        Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  SizedBox(height:50),
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
    
      
    Card(
          elevation: 3.0,
      child: Container(
      padding: const EdgeInsets.all(10.0),
        
        child: Column(
          children: [
            Row(children: [const Icon(LineAwesomeIcons.laptop,color: Colors.white),const SizedBox(width:15),  Text(widget.ittype,style: TextStyle(color: Colors.white),),],),
            const SizedBox(height:20),
            Row(children: [ const  Icon(Icons.abc_outlined,color: Colors.white),const SizedBox(width:15),  Text(widget.itbrand,style: TextStyle(color: Colors.white),),],),
            const SizedBox(height:20),
            Row(children: [const Icon(LineAwesomeIcons.barcode,color: Colors.white),const SizedBox(width:15),   Text(widget.itserialnum,style: TextStyle(color: Colors.white),),],),
            const SizedBox(height:15),
          
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [const SizedBox(width:40),
      
                Container(
                  child: ElevatedButton(onPressed:()
                  {
                  
                  ReportModel reportModel=ReportModel(id: userBiore[9], keypinnx: userBiore[17], ugenid: userBiore[8], name: userBiore[5], surname: userBiore[10],
                   dob: userBiore[14], phone: userBiore[4], snum: userBiore[16], address: userBiore[12], town: userBiore[13], producTy: widget.ittype.toString(), producNam: widget.itbrand.toString(), producNum: widget.itserialnum.toString());  
                               
                   subreport(reportModel);
                     }, 
                  
                  child: Text("REPORT")),
                ),
                
              ],
            ),
            SizedBox(height:5),
          ],
        ),
      ),
    ),
  
    ]
  
    ),
  
),


    );
  }
}