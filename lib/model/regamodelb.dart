class RegAModelb{
String pinn;
String email;
String id;

RegAModelb({required this.id,required this.email,required this.pinn});

factory RegAModelb.fromJson(Map<String,dynamic>json){

  return RegAModelb(
   id:json['id'] as String,
   email:json['emailx'] as String, 
   pinn:json['pinn2x'] as String,
   //idd:json['idd'] as String,
   );
}

Map<Object,dynamic>toJsonAdd(){
 return {
  "id":id,
  "emailx":email,
  "pinn2x":pinn,
};
}

}