import 'package:flutter/material.dart';
class CategoryPicker extends StatefulWidget {
  const CategoryPicker({super.key});

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  int selectedIndex = 0;

  final categories = const [
    (label: 'Women', icon: Icons.female),
    (label: 'Men', icon: Icons.male),
    (label: 'Accessories', icon: Icons.dry_cleaning_outlined),
    (label: 'Beauty', icon: Icons.spa_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(categories.length, (index) {
        final category = categories[index];
        final selected = index == selectedIndex;

        return Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => setState(() => selectedIndex = index),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected ? const Color(0xFF332B28) : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: selected
                          ? const Color(0xFF332B28)
                          : const Color(0xFFF3F3F3),
                      child: Icon(
                        category.icon,
                        color: selected ? Colors.white : (index == 1 ? const Color(0xFFBD4545) : Colors.grey.shade400),
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selected
                          ? const Color(0xFF332B28)
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
