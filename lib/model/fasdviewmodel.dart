class ViewAModel
{

String keypinnx;
String ugenid;
String id;

ViewAModel
({required this.id,required this.ugenid,required this.keypinnx});

factory ViewAModel.fromJson(Map<String,dynamic>json){

  return ViewAModel
(
  
   keypinnx:json['keypinnx'] as String, 
   ugenid:json['ugenid'] as String,
   id:json['id'] as String,
   );
}



Map<Object,dynamic>toJsonAdd(){
 return {
  "id":id,
  "ugenid":ugenid,
  "keypinnx":keypinnx,
};
}

}