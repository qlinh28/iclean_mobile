import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:iclean_flutter/models/product.dart';
import '../../../../constant/size_config.dart';
import '../../shopping/cart/review_cart.dart';
import 'yt_player.dart';

class ShopDetailVideoScreen extends StatefulWidget {
  final Product product;
  final bool isBuy;
  const ShopDetailVideoScreen(
      {Key? key, required this.product, required this.isBuy})
      : super(key: key);

  static String route() => '/shop_detail';

  @override
  State<ShopDetailVideoScreen> createState() => _ShopDetailVideoScreenState();
}

class _ShopDetailVideoScreenState extends State<ShopDetailVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: getProportionateScreenHeight(428),
                  leading: IconButton(
                    icon: Image.asset('assets/icons/back@2x.png', scale: 2),
                    onPressed: () => Navigator.pop(context),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: const Color(0xFFeeeeee),
                      child: Image.network(
                        widget.product.imgLink,
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ..._buildTitle(),
                        const SizedBox(height: 16),
                        _buildLine(),
                        const SizedBox(height: 16),
                        widget.isBuy
                            ? YoutubePlayerExample(
                                videoURL: widget.product.link,
                              )
                            : const Text('Disable!'),
                        const SizedBox(height: 16),
                        ..._buildDescription(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            widget.isBuy ? Container() : _buldFloatBar(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTitle() {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Text(
              widget.product.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Color(0xFFeeeeee),
            ),
            child: const Text(
              '9,742 sold',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 16),
          Image.asset('assets/icons/start@2x.png', height: 20, width: 20),
          const SizedBox(width: 8),
          const Text(
            '4.8 (6,573 reviews)',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ];
  }

  Widget _buildLine() {
    return Container(height: 1, color: const Color(0xFFEEEEEE));
  }

  List<Widget> _buildDescription() {
    return [
      const Text('Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      ExpandableText(
        widget.product.description,
        expandText: 'view more',
        collapseText: 'view less',
        linkStyle: const TextStyle(
            color: Color(0xFF424242), fontWeight: FontWeight.bold),
      ),
    ];
  }

  Widget _buldFloatBar() {
    buildAddCard() => Container(
          height: 58,
          width: getProportionateScreenWidth(126),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(29)),
            color: const Color(0xFF101010),
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 8),
                blurRadius: 20,
                color: const Color(0xFF101010).withOpacity(0.25),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(29)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ReviewCart(product: widget.product, quantity: 1)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/detail/bag@2x.png', scale: 2),
                  const SizedBox(width: 16),
                  const Text(
                    'Buy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            _buildLine(),
            const SizedBox(height: 21),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total price',
                        style:
                            TextStyle(color: Color(0xFF757575), fontSize: 12)),
                    const SizedBox(height: 6),
                    Text('${widget.product.price.toStringAsFixed(0)} VNĐ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                  ],
                ),
                buildAddCard()
              ],
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
