class RegAModel{
String name;
String phone;
String email;
String idd="";

RegAModel({required this.name,required this.phone,required this.email});

factory RegAModel.fromJson(Map<String,dynamic>json){

  return RegAModel(
   name:json['name'] as String,
   phone:json['phone'] as String, 
   email:json['email'] as String,
   //idd:json['idd'] as String,
   );
}

Map<Object,dynamic>toJsonAdd(){
 return {
  "name":name,
  "phone":phone,
  "email":email,
};
}

}