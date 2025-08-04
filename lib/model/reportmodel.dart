class ReportModel{
String id;
String keypinnx;
String ugenid;
String name;
String surname;
String dob;
String phone;
String snum;
String address;
String town;
String producTy;
String producNam;
String producNum;
ReportModel({required this.id,required this.keypinnx,required this.ugenid,required this.name,required this.surname,required this.dob,required this.phone,required this.snum,required this.address,required this.town,required this.producTy,required this.producNam,required this.producNum});
Map<Object,dynamic> toJsonReport(){

  return 
  {
    'id':id,
    'keypinnx':keypinnx,
    'ugenid':ugenid,
    'name':name,
    'surname':surname,
    'dob':dob,
    'phone':phone,
    'snum':snum,
    'address':address,
    'town':town,
    'producTy':producTy,
    'producNam':producNam,
    'producNum':producNum
   };
}

}




