
class FavouriteModel {
  String image;
  String name;
  String price;
  String rate;

  FavouriteModel({
    this.image,
    this.name,
    this.price,
    this.rate
  });

  FavouriteModel.fromJson(Map<dynamic,dynamic> map){
    if(map == null){
      return ;
    }else{
      name = map["name"];
      image = map["image"];
      price = map["price"];
      rate = map["rate"];
    }
  }

  toJson(){
    return {
      'name' : name,
      'image' : image,
      'price' : price,
      'rate' : rate,
    };
  }
}
