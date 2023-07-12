import 'package:flutter/material.dart';
import 'shopping/items_shopping.dart';
import 'shopping/order_product_history.dart';
import 'shopping/video_history.dart';
import 'shopping/video_shopping.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener((_handleTabSelection));
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shopping",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple.shade300,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.deepPurple.shade300,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 2, color: Colors.deepPurple.shade300),
                    ),
                    tabs: const [
                      Tab(text: 'Tip Cleanings'),
                      Tab(text: 'Our Products'),
                      Tab(text: 'Your Tips'),
                      Tab(text: 'Order History'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 200,
                    child: const TabBarView(
                      children: [
                        VideoCart(),
                        ItemCart(),
                        VideoHistoryScreen(),
                        OrderProductHistoryScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
