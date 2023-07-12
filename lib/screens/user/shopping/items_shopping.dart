// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/user/components/product/detail_item_screen.dart';
import 'package:iclean_flutter/services/product_api.dart';

import '../../../models/product.dart';
import '../components/product/product_cart.dart';

class ItemCart extends StatefulWidget {
  const ItemCart({Key? key}) : super(key: key);

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> with TickerProviderStateMixin {
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

  Future<void> fetchProduct(String search) async {
    final listProducts = await ProductApi.fetchProductNotBuy(0, search, 'item');
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
              builder: (context) => ShopDetailItemScreen(product: data))),
    );
  }
}
