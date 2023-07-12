class ProductDto {
  int productId, quantity;
  double price;

  ProductDto(
      {required this.productId, required this.quantity, required this.price});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
