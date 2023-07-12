import 'product_dto.dart';

class OrderProductDto {
  int userId;
  List<ProductDto> orderProducts;

  OrderProductDto({required this.userId, required this.orderProducts});
}
