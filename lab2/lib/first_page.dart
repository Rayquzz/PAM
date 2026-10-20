import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab2/util/carousel_slider.dart';
import 'package:lab2/util/category_button.dart';
import 'package:lab2/product_detail_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('GemStore', style: TextStyle(
          fontFamily: 'ProductSans', fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black,
        )),
        leading: Builder(builder: (context) => IconButton(
          icon: SvgPicture.asset('assets/icons/menu.svg', width: 28, height: 28),
          onPressed: () => Scaffold.of(context).openDrawer(),
        )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(clipBehavior: Clip.none, children: [
              const Icon(Icons.notifications_none_outlined, size: 30, color: Colors.black),
              Positioned(right: 0, top: 0, child: Container(
                width: 11, height: 11,
                decoration: const BoxDecoration(color: Color(0xFFEF4562), shape: BoxShape.circle),
              )),
            ]),
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const Drawer(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 30, 22, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CategoryPicker(),
                const SizedBox(height: 42),
                const CarouselSliderPhotos(),
                const SizedBox(height: 58),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Feature Products', style: TextStyle(
                      fontFamily: 'ProductSans', fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black,
                    )),
                    TextButton(onPressed: () {}, child: const Text('Show all', style: TextStyle(
                      fontFamily: 'ProductSans', fontSize: 18, color: Color(0xFF999999),
                    ))),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 385,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    children: [
                      const _ProductCard(image: 'assets/images/1.png', name: 'Turtleneck Sweater', price: '\$ 39.99'),
                      const SizedBox(width: 28),
                      const _ProductCard(image: 'assets/images/2.png', name: 'Long Sleeve Dress', price: '\$ 45.00'),
                      const SizedBox(width: 28),
                      _ProductCard(image: 'assets/images/3.png', name: 'Sportwear Set', price: '\$ 80.00', grayBackground: true, onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const ProductDetailPage()))),
                      const SizedBox(width: 28),
                      const _ProductCard(image: 'assets/images/4.png', name: 'Elegant Outfit', price: '\$ 62.00', grayBackground: true),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.asset('assets/images/5.png', width: double.infinity, fit: BoxFit.fitWidth),
                ),
                const SizedBox(height: 42),
                _SectionHeading(title: 'Recommended', onShowAll: () {}),
                const SizedBox(height: 24),
                SizedBox(
                  height: 74,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    children: const [
                      _RecommendationCard(asset: 'assets/images/6.png'),
                      SizedBox(width: 14),
                      _RecommendationCard(asset: 'assets/images/7.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                _SectionHeading(title: 'Top Collection', onShowAll: () {}),
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/8.png', width: double.infinity, fit: BoxFit.fitWidth),
                ),
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/9.png', width: double.infinity, fit: BoxFit.fitWidth),
                ),
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset('assets/images/10.png', width: double.infinity, fit: BoxFit.fitWidth),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.title, required this.onShowAll});
  final String title;
  final VoidCallback onShowAll;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: const TextStyle(
        fontFamily: 'ProductSans', fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black,
      )),
      TextButton(onPressed: onShowAll, child: const Text('Show all', style: TextStyle(
        fontFamily: 'ProductSans', fontSize: 18, color: Color(0xFF999999),
      ))),
    ],
  );
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.asset});
  final String asset;

  @override
  Widget build(BuildContext context) => Image.asset(
    asset,
    height: 74,
    fit: BoxFit.contain,
  );
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.image, required this.name, required this.price, this.grayBackground = false, this.onTap});
  final String image;
  final String name;
  final String price;
  final bool grayBackground;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 214,
      child: GestureDetector(
       onTap: onTap,
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 214,
              height: 292,
              color: grayBackground ? const Color(0xFFF0F0F0) : null,
              child: Image.asset(
                image,
                width: 214,
                height: 292,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(
            fontFamily: 'ProductSans', fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF202124),
          )),
          const SizedBox(height: 8),
          Text(price, style: const TextStyle(
            fontFamily: 'ProductSans', fontSize: 23, fontWeight: FontWeight.bold, color: Color(0xFF202124),
          )),
        ],
       ),
      ),
    );
  }
}
