import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/order_product.dart';

class DetailOrderScreen extends StatefulWidget {
  final OrderProduct orderProduct;
  const DetailOrderScreen({Key? key, required this.orderProduct})
      : super(key: key);

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
  @override
  void initState() {
    super.initState;
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
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'Order History',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (widget.orderProduct.products.isNotEmpty)
                  for (int i = 0; i < widget.orderProduct.products.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 150,
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
                                    widget.orderProduct.products[i].imgLink,
                                    width: 120,
                                    height: 150,
                                    fit: BoxFit.cover,
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
                                      widget.orderProduct.products[i].title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Total: ${NumberFormat('#,###').format(widget.orderProduct.products[i].price)} VNĐ",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato',
                                        color: Colors.deepPurple.shade300,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      "Quantity: 1",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato',
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      'Order Date: ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      DateFormat('MMM d, yyyy | hh:mm aaa')
                                          .format(
                                              widget.orderProduct.orderDate),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        color: Colors.grey.shade600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
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
}
