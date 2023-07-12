// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/account.dart';
import '../../../models/product.dart';
import '../../../services/product_api.dart';
import '../../common/user_preferences.dart';
import '../components/product/detail_video_screen.dart';

class VideoHistoryScreen extends StatefulWidget {
  const VideoHistoryScreen({Key? key}) : super(key: key);

  @override
  State<VideoHistoryScreen> createState() => _VideoHistoryScreenState();
}

class _VideoHistoryScreenState extends State<VideoHistoryScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState;
    fetchProduct();
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
                                builder: (context) => ShopDetailVideoScreen(
                                    product: products[i], isBuy: true)));
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
                                  products[i].imgLink,
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
                                    products[i].title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${NumberFormat('#,###').format(products[i].price)} VNĐ",
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
                                              .format(products[i].createdAt),
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

  Future<void> fetchProduct() async {
    Account? account = await UserPreferences.getUserInfomation();
    final userId = account?.id;
    final listProducts = await ProductApi.fetchProductVideoBought(userId!);
    setState(() {
      if (listProducts != null) {
        products = listProducts;
      } else {}
    });
  }
}
