
class SqlLiteModel {
  String image;
  String name;
  String price;
  int quantity;

  SqlLiteModel({
    this.image,
    this.name,
    this.price,
    this.quantity
  });

  SqlLiteModel.fromJson(Map<dynamic,dynamic> map){
    if(map == null){
      return ;
    }else{
      name = map["name"];
      image = map["image"];
      price = map["price"];
      quantity = map["quantity"];
    }
  }

  toJson(){
    return {
      'name' : name,
      'image' : image,
      'price' : price,
      'quantity' : quantity,
    };
  }
}
