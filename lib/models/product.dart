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
}
