// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:iclean_flutter/services/product_api.dart';

import '../../../models/account.dart';
import '../../../models/product.dart';
import '../../common/user_preferences.dart';
import '../components/product/detail_video_screen.dart';
import '../components/product/product_cart.dart';

class VideoCart extends StatefulWidget {
  const VideoCart({Key? key}) : super(key: key);

  @override
  State<VideoCart> createState() => _VideoCartState();
}

class _VideoCartState extends State<VideoCart> with TickerProviderStateMixin {
  List<Product> datas = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProduct('');
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.fromLTRB(24, 24, 24, 24);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFf3f3f3),
        title: Container(
          height: 56,
          decoration: const BoxDecoration(
            color: Color(0xFFf3f3f3),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Center(
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFBDBDBD),
                ),
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF212121),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final searchTerm = searchController.text;
              fetchProduct(searchTerm);
            },
          ),
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverPadding(
          padding: padding,
          sliver: _buildPopulars(),
        ),
      ]),
    );
  }

  Future<void> fetchProduct(String searchTerm) async {
    Account? account = await UserPreferences.getUserInfomation();
    final userId = account?.id;
    final listProducts =
        await ProductApi.fetchProductNotBuy(userId!, searchTerm, 'video');
    setState(() {
      if (listProducts != null) {
        datas = listProducts;
      } else {}
    });
  }

  Widget _buildPopulars() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 185,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        mainAxisExtent: 230,
      ),
      delegate: SliverChildBuilderDelegate(_buildPopularItem,
          childCount: datas.length),
    );
  }

  Widget _buildPopularItem(BuildContext context, int index) {
    final data = datas[index];
    return ProductCard(
      data: data,
      ontap: (data) => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ShopDetailVideoScreen(product: data, isBuy: false))),
    );
  }
}
