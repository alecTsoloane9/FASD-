class RegAModelc{
String name;
String surname;
String pinn;
String phone;
String snum="0000";
String gender;
String address;
String town;
String ugenid;
String language;


RegAModelc({required this.name,required this.surname,required this.pinn,required this.phone, required this.snum,required this.gender,
required this.address,required this.town,required this.ugenid,required this.language});

factory RegAModelc.fromJson(Map<String,dynamic>json){

  return RegAModelc(
   name:json['name'] as String,
   surname:json['surname'] as String, 
   pinn:json['pinn'] as String,
   phone:json['phone'] as String,
   snum:json['snum'] as String,
   gender:json['gender'] as String,
   address:json['address'] as String,
   town:json['town'] as String,
   ugenid:json['ugenid'] as String,
   language:json['language'] as String,
      );
}

Map<Object,dynamic>toJsonAdd(){
 return {
  "name":name,
  "surname":surname,
   "pinn":pinn,
  "phone":phone,
  "snum":snum,
    "gender":gender,
  "address":address,
    "town":town,
  "ugenid":ugenid,
  "language":language,
};
}

}