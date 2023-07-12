import 'product.dart';

class OrderProduct {
  int orderId, userId, orderStatus;
  DateTime orderDate;
  double totalAmount;
  String address;
  List<Product> products;
  OrderProduct(
      {required this.orderId,
      required this.userId,
      required this.orderDate,
      required this.totalAmount,
      required this.orderStatus,
      required this.address,
      required this.products});
}
