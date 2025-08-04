class HelpAModel
{

 String phone;
 String email;
 String id;

 HelpAModel({required this.id,required this.phone,required this.email});

 factory HelpAModel.fromJson(Map<String,dynamic>json)
 {

  return HelpAModel
 (
  
   phone:json['phone'] as String, 
   email:json['email'] as String,
   id:json['id'] as String,
   );
 }

 Map<Object,dynamic>toJsonAdd(){
 return {
  "id":id,
  "phone":phone,
  "email":email,
 };
 }

}