class Product {
  int productId;
  String title, description, category, imgLink, link;
  double price;
  DateTime createdAt, updatedAt;
  Product(
      {required this.productId,
      required this.title,
      required this.description,
      required this.category,
      required this.imgLink,
      required this.link,
      required this.price,
      required this.createdAt,
      required this.updatedAt});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      imgLink: json['imgLink'] ?? '',
      link: json['link'] ?? '',
      price: json['price'] ?? 0.0,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
