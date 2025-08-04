class SubAModelc{
String ugenid;
String id;
String keypinnx;

SubAModelc({required this.keypinnx,required this.id,required this.ugenid});

factory SubAModelc.fromJson(Map<String,dynamic>json){

  return SubAModelc(
   keypinnx:json['keypinnx'] as String,
   id:json['id'] as String, 
   ugenid:json['ugenid'] as String,
      );
}

Map<Object,dynamic>toJsonAdd(){
 return {
  "keypinnx":keypinnx,
  "id":id,
   "ugenid":ugenid,
  
};
}

}