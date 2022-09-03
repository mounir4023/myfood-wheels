class ProductModel {
  String? name;
  String? price;
  String? rate;
  String? clients;
  String? image;

  ProductModel({
    this.name,
    this.price,
    this.clients,
    this.image,
    this.rate,
  });

  factory ProductModel.from(Map<String, dynamic> map) {
    return ProductModel(
        clients: map['clients'],
        image: map['image'],
        name: map['name'],
        price: map['price'],
        rate: map['rate']);
  }
}
