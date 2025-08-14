class MyItem{
static const String collection='my_item';
String? id;
  String? titel;
  String? brands;
String? price;
 String? imageUrl;
  MyItem({required this.titel,required this.price,required this.brands,required this.imageUrl,required this.id});


MyItem.fromFireStore(Map<String, dynamic>data){
  titel=data['titel'];
  brands=data['brands'];
  price=data['price'];
  imageUrl= data['imageUrl'];
  id=data['id'];
}



  Map<String,dynamic>toFireStore(){
  return{
   'id':id,
    'titel':titel,
  'brands':brands,
  'price':price,
  'imageUrl':imageUrl,
  };

}

}