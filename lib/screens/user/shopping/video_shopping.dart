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

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.fromLTRB(24, 24, 24, 24);
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverPadding(
          padding: padding,
          sliver: _buildPopulars(),
        ),
      ]),
    );
  }

  Future<void> fetchProduct() async {
    Account? account = await UserPreferences.getUserInfomation();
    final userId = account?.id;
    final listProducts =
        await ProductApi.fetchProductNotBuy(userId!, '', 'video');
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
        mainAxisExtent: 285,
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
                  ShopDetailVideoScreen(product: data, isBuy: true))),
    );
  }
}
