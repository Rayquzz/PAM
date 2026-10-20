import 'package:flutter/material.dart';

class CarouselSliderPhotos extends StatelessWidget {
  const CarouselSliderPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: SizedBox(
        width: double.infinity,
        height: 286,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/autumn_collection.jpg', fit: BoxFit.cover),
            Positioned(
              right: 16,
              top: 34,
              child: Text('Autumn\nCollection\n2021',
                style: const TextStyle(
                  fontFamily: 'ProductSans', fontSize: 37,
                  height: 1.38, fontWeight: FontWeight.bold, color: Colors.white,
                ),
              ),
            ),
            const Positioned(
              bottom: 18,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Dot(selected: true), SizedBox(width: 12), _Dot(), SizedBox(width: 12), _Dot(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({this.selected = false});
  final bool selected;

  @override
  Widget build(BuildContext context) => Container(
    width: selected ? 12 : 8,
    height: selected ? 12 : 8,
    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
  );
}
