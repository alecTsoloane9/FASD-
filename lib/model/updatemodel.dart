class UpdateModelc{
String reguid;
String surname;
String pinn;
String phone;
String snum;
String address;
String town;
String language;
String keypinnx;
String ugenid;


UpdateModelc({required this.keypinnx,required this.ugenid,required this.reguid,required this.surname,required this.pinn,required this.phone,required this.snum,required this.address,required this.town,required this.language});

factory UpdateModelc.fromJson(Map<String,dynamic>json){

  return UpdateModelc(

   ugenid: json['ugenid'] as String,
   keypinnx: json['keypinnx'] as String,
   reguid: json['reguid'] as String,
   surname:json['surname'] as String, 
   pinn:json['pinn'] as String,
   phone:json['phone'] as String,
   snum:json['snum'] as String,
   address:json['address'] as String,
   town:json['town'] as String,
   language:json['language'] as String,
      );
}

Map<Object,dynamic>toJsonAdd(){
 return {
  "surname":surname,
   "pinn":pinn,
  "phone":phone,
  "snum":snum,
  "address":address,
   "town":town,
  "language":language,
  "reguid":reguid,
  "keypinnx":keypinnx,
  "ugenid":ugenid,
};
}

}