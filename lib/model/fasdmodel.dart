class UserModel{
String name;
String surname;
String phone;
String snum;
String gender;
String address;
String town;
String id;
String keypinnx;
String producTy;
String producNam;
String producNum;
String tokendo;
String listDa;
String ugenid;
String rat;
      
UserModel({  required this.rat, required this.surname, required this.name, 
required this.phone, required this.snum, required this.gender, required this.address, required this.town, required this.id, required this.keypinnx,
 required this.ugenid, required this.producTy, required this.producNam, required this.producNum, required this.tokendo, required this.listDa});

factory UserModel.fromJson(Map<String,dynamic>json){

  return UserModel(
   name:json['name'] as String,
   surname:json['surname'] as String, 
   rat:json['rat'] as String,
   phone:json['phone'] as String,
   snum:json['snum'] as String,
   gender:json['gender'] as String,
      address:json['address'] as String,
   town:json['town'] as String, 
   id:json['id'] as String,
   keypinnx:json['keypinnx'] as String,
   ugenid:json['ugenid'] as String,
   producTy:json['producTy'] as String,
      producNam:json['producNam'] as String,
   producNum:json['producNum'] as String, 
   tokendo:json['tokendo'] as String,
   listDa:json['listDa'] as String,
   
  );
}
Map<Object,dynamic>toJsonAdd(){
return {
  
   "name":name,
   "surname":surname, 
   "rat":rat,
   "phone":phone,
   "snum":snum,
   "gender":gender,
      "address":address,
   "town":town, 
   "id":id,
   "keypinnx":keypinnx,
   "ugenid":ugenid,
   "producTy":producTy,
    "producNam":producNam,
   "producNum":producNum, 
   "tokendo":tokendo,
   "listDa":listDa,
   
};
}

}