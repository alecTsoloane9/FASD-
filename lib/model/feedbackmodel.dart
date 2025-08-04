class FeedBackf{
String name;
String gender;
String town;
String phone;
String id;
String email;
String smss;
String departments;
String ugenid;

 FeedBackf({required this.name,required this.gender,required this.town,required this.phone,required this.id,required this.email,required this.smss,required this.departments,required this.ugenid});



 Map<Object,dynamic>toJsonAdd(){
 return {
  "id":id,
  "phone":phone,
  "email":email,
  "smss":smss,
  "departments":departments,
  "town":town,
  "gender":gender,
  "name":name,
  "ugenid":ugenid
 };
 }

}