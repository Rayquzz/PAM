import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedColor = 0;
  int selectedSize = 2;
  bool isFavorite = true;
  bool showDescription = true;
  bool showReviews = true;

  static const ink = Color(0xFF202124);
  static const muted = Color(0xFF7F879B);
  static const swatches = [Color(0xFFE8B99F), Colors.black, Color(0xFFEF6265)];
  static const sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final heroHeight = screenHeight * .52;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: heroHeight,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ColoredBox(
                      color: const Color(0xFFFFFCFB),
                      child: Center(
                        child: Image.asset(
                          'assets/images/11.png',
                          width: double.infinity,
                          height: heroHeight,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 54,
                      left: 30,
                      child: _RoundButton(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.arrow_back_ios_new, size: 22, color: Color(0xFF263A5B)),
                      ),
                    ),
                    Positioned(
                      top: 54,
                      right: 30,
                      child: _RoundButton(
                        onTap: () => setState(() => isFavorite = !isFavorite),
                        child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 27, color: isFavorite ? const Color(0xFFFF686B) : ink),
                      ),
                    ),
                    const Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _PageDot(active: true), SizedBox(width: 11), _PageDot(), SizedBox(width: 11), _PageDot(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -18),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(32, 48, 32, 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                    boxShadow: [BoxShadow(color: Color(0x11000000), blurRadius: 10, offset: Offset(0, -3))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(child: Text('Sportwear Set', style: TextStyle(fontFamily: 'ProductSans', fontWeight: FontWeight.w600, fontSize: 22, color: ink))),
                          const SizedBox(width: 8),
                          const Text('\$ 80.00', style: TextStyle(fontFamily: 'ProductSans', fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black)),
                        ],
                      ),
                      const SizedBox(height: 14),
                      const Row(children: [
                        Icon(Icons.star, color: Color(0xFF559184), size: 29),
                        Icon(Icons.star, color: Color(0xFF559184), size: 29),
                        Icon(Icons.star, color: Color(0xFF559184), size: 29),
                        Icon(Icons.star, color: Color(0xFF559184), size: 29),
                        Icon(Icons.star, color: Color(0xFF559184), size: 29),
                        SizedBox(width: 8),
                        Text('(83)', style: TextStyle(fontFamily: 'ProductSans', fontSize: 14, color: Color(0xFF454545))),
                      ]),
                      const SizedBox(height: 24),
                      const Divider(height: 1, color: Color(0xFFE9EAF0)),
                      const SizedBox(height: 22),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            const Text('Color', style: TextStyle(fontFamily: 'ProductSans', fontSize: 18, color: muted)),
                            const SizedBox(height: 16),
                            Row(children: List.generate(swatches.length, (index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () => setState(() => selectedColor = index),
                                child: Container(
                                  width: 34, height: 34,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: swatches[index],
                                    border: selectedColor == index ? Border.all(color: Colors.white, width: 3) : null,
                                    boxShadow: selectedColor == index ? const [BoxShadow(color: Color(0x22000000), blurRadius: 5, offset: Offset(0, 3))] : null,
                                  ),
                                ),
                              ),
                            ))),
                          ])),
                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            const Text('Size', style: TextStyle(fontFamily: 'ProductSans', fontSize: 18, color: muted)),
                            const SizedBox(height: 16),
                            Row(children: List.generate(sizes.length, (index) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                onTap: () => setState(() => selectedSize = index),
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: selectedSize == index ? const Color(0xFF555555) : const Color(0xFFF7F7F7),
                                  child: Text(sizes[index], style: TextStyle(fontFamily: 'ProductSans', fontWeight: FontWeight.w600, color: selectedSize == index ? Colors.white : const Color(0xFFC4C4C4))),
                                ),
                              ),
                            ))),
                          ])),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Divider(height: 1, color: Color(0xFFE9EAF0)),
                      InkWell(
                        onTap: () => setState(() => showDescription = !showDescription),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            const Text('Description', style: TextStyle(fontFamily: 'ProductSans', fontSize: 20, color: Color(0xFF333333))),
                            Icon(showDescription ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 28, color: Color(0xFF333333)),
                          ]),
                        ),
                      ),
                      if (showDescription)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(fontFamily: 'ProductSans', fontSize: 16, height: 1.75, color: Color(0xFF353535)),
                              children: [
                                const TextSpan(text: 'Sportswear is no longer under culture, it is no longer indie or cobbled together as it once was. Sport is fashion today. The top is oversized in fit and style, may need to size down.  '),
                                TextSpan(text: 'Read more', style: const TextStyle(color: Color(0xFF559184), decoration: TextDecoration.underline)),
                              ],
                            ),
                          ),
                        ),
                      const Divider(height: 1, color: Color(0xFFE9EAF0)),
                      InkWell(
                        onTap: () => setState(() => showReviews = !showReviews),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            const Text('Reviews', style: TextStyle(fontFamily: 'ProductSans', fontWeight: FontWeight.w600, fontSize: 20, color: Color(0xFF333333))),
                            Icon(showReviews ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 28, color: const Color(0xFF333333)),
                          ]),
                        ),
                      ),
                      if (showReviews) const _ReviewsSummary(),
                      if (showReviews) const _CustomerReviews(),
                      const _SimilarProducts(),
                      const Divider(height: 1, color: Color(0xFFE9EAF0)),
                      const SizedBox(height: 112),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          color: const Color(0xFFF7F7F7),
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: SizedBox(
            height: 96,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF333333),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
              ),
              child: Stack(children: [
                const Center(child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.shopping_bag_outlined, size: 22),
                  SizedBox(width: 16),
                  Text('Add To Cart', style: TextStyle(fontFamily: 'ProductSans', fontWeight: FontWeight.bold, fontSize: 20)),
                ])),
                Positioned(bottom: 10, left: 0, right: 0, child: Center(child: Container(
                  width: 84,
                  height: 4,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                ))),
              ]),
            ),
          ),
      ),
    );
  }
}

class _ReviewsSummary extends StatelessWidget {
  const _ReviewsSummary();

  static const green = Color(0xFF559184);
  static const grey = Color(0xFF969696);

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 26),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('4.9', style: TextStyle(fontFamily: 'ProductSans', fontWeight: FontWeight.bold, fontSize: 52, color: Color(0xFF242124))),
            const SizedBox(width: 12),
            const Padding(padding: EdgeInsets.only(top: 19), child: Text('OUT OF 5', style: TextStyle(fontFamily: 'ProductSans', fontSize: 14, color: grey))),
            const Spacer(),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              const Row(children: [
                Icon(Icons.star, color: green, size: 24), Icon(Icons.star, color: green, size: 24),
                Icon(Icons.star, color: green, size: 24), Icon(Icons.star, color: green, size: 24),
                Icon(Icons.star, color: green, size: 24),
              ]),
              const SizedBox(height: 4),
              Text('83 ratings', style: TextStyle(fontFamily: 'ProductSans', fontSize: 13, color: grey)),
            ]),
          ],
        ),
      ),
      const _RatingBar(stars: 5, percent: 80, value: .80),
      const _RatingBar(stars: 4, percent: 12, value: .19),
      const _RatingBar(stars: 3, percent: 5, value: .09),
      const _RatingBar(stars: 2, percent: 3, value: .06),
      const _RatingBar(stars: 1, percent: 0, value: 0),
      Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 8),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('47 Reviews', style: TextStyle(fontFamily: 'ProductSans', fontSize: 14, color: grey)),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 17, color: Color(0xFFB9BBC1)),
            label: const Text('WRITE A REVIEW', style: TextStyle(fontFamily: 'ProductSans', fontSize: 13, color: grey)),
          ),
        ]),
      ),
    ],
  );
}

class _RatingBar extends StatelessWidget {
  const _RatingBar({required this.stars, required this.percent, required this.value});
  final int stars;
  final int percent;
  final double value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(children: [
      SizedBox(width: 14, child: Text('$stars', style: const TextStyle(fontFamily: 'ProductSans', fontSize: 14, color: Color(0xFF999999)))),
      const SizedBox(width: 4),
      const Icon(Icons.star, color: Color(0xFF559184), size: 19),
      const SizedBox(width: 12),
      Expanded(child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: LinearProgressIndicator(value: value, minHeight: 4, backgroundColor: const Color(0xFFEFEFEF), valueColor: const AlwaysStoppedAnimation(Color(0xFF559184)),),
      )),
      const SizedBox(width: 14),
      SizedBox(width: 32, child: Text('$percent%', textAlign: TextAlign.right, style: const TextStyle(fontFamily: 'ProductSans', fontSize: 14, color: Color(0xFF333333)))),
    ]),
  );
}

class _CustomerReviews extends StatelessWidget {
  const _CustomerReviews();

  @override
  Widget build(BuildContext context) => const Column(
    children: [
      _CustomerReview(
        image: 'assets/images/12.png',
        name: 'Jennifer Rose',
        time: '5m ago',
        message: 'Love it. Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!',
      ),
      SizedBox(height: 34),
      _CustomerReview(
        image: 'assets/images/13.png',
        name: 'Kelly Rihana',
        time: '9m ago',
        message: "I'm very happy with order, It was delivered on and good quality. Recommended!",
      ),
    ],
  );
}

class _CustomerReview extends StatelessWidget {
  const _CustomerReview({required this.image, required this.name, required this.time, required this.message});
  final String image;
  final String name;
  final String time;
  final String message;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(children: [
        ClipOval(child: Image.asset(image, width: 36, height: 36, fit: BoxFit.cover)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: const TextStyle(fontFamily: 'ProductSans', fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xFF333333))),
          const SizedBox(height: 5),
          const Row(children: [
            Icon(Icons.star, color: Color(0xFF559184), size: 17),
            Icon(Icons.star, color: Color(0xFF559184), size: 17),
            Icon(Icons.star, color: Color(0xFF559184), size: 17),
            Icon(Icons.star, color: Color(0xFF559184), size: 17),
            Icon(Icons.star, color: Color(0xFF559184), size: 17),
          ]),
        ])),
        Text(time, style: const TextStyle(fontFamily: 'ProductSans', fontSize: 13, color: Color(0xFFBDBDBD))),
      ]),
      const SizedBox(height: 18),
      Text(message, style: const TextStyle(fontFamily: 'ProductSans', fontSize: 14, height: 1.65, color: Color(0xFF333333))),
    ],
  );
}

class _SimilarProducts extends StatefulWidget {
  const _SimilarProducts();

  @override
  State<_SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<_SimilarProducts> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      InkWell(
        onTap: () => setState(() => expanded = !expanded),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Similar Product', style: TextStyle(fontFamily: 'ProductSans', fontWeight: FontWeight.w600, fontSize: 20, color: Color(0xFF333333))),
            Icon(expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 28, color: const Color(0xFF333333)),
          ]),
        ),
      ),
      if (expanded)
        SizedBox(
          height: 227,
          child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            children: const [
              Image(width: 126, height: 227, image: AssetImage('assets/images/14.png'), fit: BoxFit.contain),
              SizedBox(width: 20),
              Image(width: 126, height: 227, image: AssetImage('assets/images/15.png'), fit: BoxFit.contain),
              SizedBox(width: 20),
              Image(width: 126, height: 227, image: AssetImage('assets/images/16.png'), fit: BoxFit.contain),
            ],
          ),
        ),
    ],
  );
}

class _RoundButton extends StatelessWidget {
  const _RoundButton({required this.onTap, required this.child});
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    elevation: 2,
    shape: const CircleBorder(),
    child: InkWell(onTap: onTap, customBorder: const CircleBorder(), child: SizedBox(width: 42, height: 42, child: Center(child: child))),
  );
}

class _PageDot extends StatelessWidget {
  const _PageDot({this.active = false});
  final bool active;

  @override
  Widget build(BuildContext context) => Container(
    width: active ? 12 : 7,
    height: active ? 12 : 7,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: active ? Colors.white : const Color(0xFF505050),
      border: active ? Border.all(color: const Color(0xFF505050), width: 1.5) : null,
    ),
  );
}
