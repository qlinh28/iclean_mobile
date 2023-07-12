// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/order_product.dart';
import 'package:iclean_flutter/services/order_product_api.dart';
import 'package:intl/intl.dart';

import '../../../models/account.dart';
import '../../common/user_preferences.dart';
import '../components/product/detail_order_screen.dart';

class OrderProductHistoryScreen extends StatefulWidget {
  const OrderProductHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderProductHistoryScreen> createState() =>
      _OrderProductHistoryScreenState();
}

class _OrderProductHistoryScreenState extends State<OrderProductHistoryScreen> {
  List<OrderProduct> products = [];

  @override
  void initState() {
    super.initState;
    fetchOrderProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < products.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailOrderScreen(
                                    orderProduct: products[i])));
                      },
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  products[i].products.isNotEmpty
                                      ? products[i].products[0].imgLink
                                      : 'https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-1932.jpg?w=2000',
                                  width: 120,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Text('Error'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    products[i].products.isNotEmpty
                                        ? products[i].products[0].title
                                        : 'Your History Order',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${NumberFormat('#,###').format(products[i].totalAmount)} VNĐ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                      color: Colors.deepPurple.shade300,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          DateFormat('MMM d, yyyy | hh:mm aaa')
                                              .format(products[i].orderDate),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            color: Colors.grey.shade600,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchOrderProduct() async {
    Account? account = await UserPreferences.getUserInfomation();
    final userId = account?.id;
    final listOrders = await OrderProductApi.fetchOrderProduct(userId!, '', -1);
    setState(() {
      if (listOrders != null) {
        products = listOrders;
      } else {}
    });
  }
}
