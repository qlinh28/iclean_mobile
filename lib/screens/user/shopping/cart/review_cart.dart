// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:iclean_flutter/dto/order_product_dto.dart';
import 'package:iclean_flutter/dto/product_dto.dart';
import 'package:iclean_flutter/models/product.dart';
import 'package:iclean_flutter/screens/common/user_preferences.dart';
import 'package:iclean_flutter/services/order_product_api.dart';
import 'package:iclean_flutter/services/user_api.dart';
import 'package:intl/intl.dart';

import '../../../../models/account.dart';

class ReviewCart extends StatefulWidget {
  final Product product;
  final int quantity;
  const ReviewCart({Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  Future<void> _makeOrderProduct() async {
    Account? account = await UserPreferences.getUserInfomation();
    int? id = account?.id;
    ProductDto dto = ProductDto(
        productId: widget.product.productId,
        quantity: widget.quantity,
        price: widget.product.price);
    List<ProductDto> products = [];
    products.add(dto);
    OrderProductDto orderProductDto =
        OrderProductDto(orderProducts: products, userId: id!);
    await _handleAddNewOrderProduct(orderProductDto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    "Review Summary",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Product ",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              widget.product.title,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Category",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              widget.product.category,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Date & Time",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              DateFormat('MMM d, yyyy | hh:mm aaa')
                                  .format(DateTime.now()),
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Quantity",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                            ),
                          ),
                          Text(
                            widget.quantity.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Sum",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              "${NumberFormat('#,###').format(widget.product.price * widget.quantity)} VNĐ",
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Promo',
                              style: TextStyle(
                                color: Colors.deepPurple.shade300,
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                color: Colors.deepPurple.shade300,
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                            ),
                          ),
                          Text(
                            "${NumberFormat('#,###').format(widget.product.price * widget.quantity)} VNĐ",
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          children: [
            Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {
                _makeOrderProduct();
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 16,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    "Confirm Payment",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateMoney(int newMoney) async {
    await UserApi.updateMoneyByUserId(newMoney);
  }

  Future<bool?> _handleAddNewOrderProduct(
      OrderProductDto orderProductDto) async {
    int statusCode = await OrderProductApi.createBooking(orderProductDto);
    if (statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Add new order success!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      Account? account = await UserPreferences.getUserInfomation();
      int updateMoney = (account!.point -
          orderProductDto.orderProducts[0].quantity *
              orderProductDto.orderProducts[0].price.toInt());
      await _updateMoney(updateMoney);
      return true;
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Some error occur!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return false;
    }
  }
}
