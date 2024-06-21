class Product {
  int? id;
  String? name;
  double? price;
  String? image;

  Product({this.id, this.name, this.price, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}