class ProductModel {
  final int id;
  final String title;
  final double price;
  final int stock;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.stock});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        stock: json['stock']);
  }
}
