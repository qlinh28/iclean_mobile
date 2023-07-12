import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enableInfiniteScroll: true,
        viewportFraction: 1.0,
      ),
      items: [
        "assets/images/cleaning-1.png",
        "assets/images/cleaning-2.jpg",
        "assets/images/cleaning-3.jpg",
        "assets/images/cleaning-4.jpg",
      ].map((String imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
