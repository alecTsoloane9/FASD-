import 'package:fasd/userbiocardhead.dart';
import 'package:fasd/viewfasdcontroller.dart';
import 'package:fasd/viewpprepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ViewFasdGe extends StatelessWidget {
ViewFasdGe({super.key});

var fasdContraller=Get.put(ViewfasdController());

DateTime now=DateTime.now();
String datenow=DateFormat('dd - MMMM - yyyy').format(DateTime.now());

void fasdrefresher() async {
try{
fasdContraller.getFasds();
}
catch(e)
{
  //error
}
}


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body:SafeArea(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[  
               SizedBox(height:10),
               Column(children: [
               userbiocardHead(),
               ],)
                   ]
            ),
           

          Expanded(
            child: Obx(
              
              ()=>fasdContraller.isLoading.value?Center(child:CircularProgressIndicator(),):

                   Column(
                     children: [
                    Row(
                            mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(onPressed: (){
              fasdContraller.getFasds();
            
              },
                     child:const Row(children:[ Text("REFRESH  ",
                    
                    ),
                    Icon(Icons.refresh )],)
              ),
             const SizedBox(height:40),
            ],),


fasdContraller.fasdlsta.isEmpty?const Center(child:  Text("NO FASD")):
                       Expanded(

                         child: ListView.builder(
                            itemCount: fasdContraller.fasdlsta.length,
                            itemBuilder:( context,index)
                            {

                            return GestureDetector(
                              onTap: (){},
                              child: Card(
                                     margin: const EdgeInsets.all(12),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
SizedBox(height:3),
                                Row(
                                  children: [const Icon(LineAwesomeIcons.building,color: Colors.white,),const SizedBox(width:15), Text("${fasdContraller.fasdlsta[index].instagra}",style: TextStyle(fontSize: 15.0,fontWeight:FontWeight.bold,color: Colors.white), ),
                                                          
                                                          
                                   ],
                                   ),
                                 
                                 
                                 
                                Row(
                                  children:  [const Icon(LineAwesomeIcons.laptop,color: Colors.white,),const SizedBox(width:15), Text('${fasdContraller.fasdlsta[index].producTy.toUpperCase()}',style: TextStyle(fontSize: 15,color: Colors.white),),],),
                                 Row(
                                  
                                  children: [const  Icon(Icons.abc_outlined,color: Colors.white,),const SizedBox(width:15),Text("${fasdContraller.fasdlsta[index].producNam.toUpperCase()}",style: TextStyle(color: Colors.white),),],),
                                  Row(children:[const Icon(LineAwesomeIcons.barcode,color: Colors.white,),const SizedBox(width:15), Text("${fasdContraller.fasdlsta[index].producNum}",style: TextStyle(fontSize: 20,color: Colors.white),),],),
                                  Row(children:[ const Icon(LineAwesomeIcons.calendar,color: Colors.white,),const SizedBox(width:15),Text("${fasdContraller.fasdlsta[index].startTrade}",style: TextStyle(color: Colors.white),),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.all(1),
                                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey,),
                                     child:
                                     
                                    Text("  TO  ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),), 
                                
                                  ),
                                  
                                  
                                  Text("${fasdContraller.fasdlsta[index].endTrade}",style: TextStyle(color: Colors.white),),
                                  ],),
                                     
                                  Row(children:[const Icon(LineAwesomeIcons.database,color: Colors.white,),const SizedBox(width:15), Text("${fasdContraller.fasdlsta[index].id}",style: TextStyle(fontSize: 25,color: Colors.white),),],),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(40, 5, 1, 1),
                                                    child: ElevatedButton(
                                                      
                                                      onPressed:
                                                     ()
                                                                                         {
                                                                var idnum=fasdContraller.fasdlsta[index].id;
                                                                var ittype=fasdContraller.fasdlsta[index].producTy;
                                                                var itbrand=fasdContraller.fasdlsta[index].producNam;
                                                                var itserialnum=fasdContraller.fasdlsta[index].producNum;
                                                                
                                                              Navigator.push(context,MaterialPageRoute(builder: (context)=>FasdReporta(idnum:idnum,ittype:ittype,itbrand:itbrand,itserialnum:itserialnum)));
                                                      },
                                                     
                                                     child: Text("REPORT ITEM STOLEN")),
                                                  ),
                                     
                                     SizedBox(height:10),
                                     ],
                                   ),
                                    
                                       ],
                                       ),
                                    
                                    
                                     ],
                                   ),
                              ),
                            );
 /////////////end of card




                          }
                          ),
                       ),
                     ],
                   ),
                 
               
              
            ),
          ),
          Text(datenow),
          const SizedBox(height:20),
        ],),
      ),
    );
  }
}