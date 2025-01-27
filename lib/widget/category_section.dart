import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              child:
                  const Text('See More', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _buildCategoryChips(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildCategoryChips() {
    final categories = ['All', 'Action', 'Anime', 'Sci-fi', 'Thriller'];

    return categories.map((category) {
      bool isSelected = category == selectedCategory;
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = category; // Update the selected category
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          // Horizontal spacing between chips
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFFFF3440)
                  : const Color(0xFF221821),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF969696),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
