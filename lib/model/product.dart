
class Food {
  int id;
  String name;
  int price;
  String image;
  String imageURL;
  double quantity;
  String quantityUnit;

  Food();

  Food.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    price = data['price'];
    image = data['image'];
    imageURL = data['imageURL'];
    quantityUnit = data['quantityUnit'];
    quantity = data['quantity'].toDouble();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'imageURL': imageURL,
    };
  }
}