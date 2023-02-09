
class ProductModel{

  int? id;
  String? images;
  String? name;
  String? price;


  ProductModel({required this.id,required this.images,required this.name,required this.price});

  factory ProductModel.fromJson(Map<String,dynamic>json){
    return ProductModel(
        id: json['id'],
        images: json['images'],
        name: json['name'],
        price: json['price']
    );
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> tojson=Map<String,dynamic>();
    tojson['id']=this.id;
    tojson['images']=this.images;
    tojson['name']=this.name;
    tojson['price']=this.price;
    return tojson;
  }
}

