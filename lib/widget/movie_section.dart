import 'package:flutter/material.dart';

import '../screens/details_screen.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final double availableScreenWidth;

  const MovieSection({
    super.key,
    required this.title,
    required this.items,
    required this.availableScreenWidth,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate each item's width using the availableScreenWidth passed in.
    // Here, we divide by 3 and subtract 24 to account for margins or spacing.
    final itemWidth = availableScreenWidth / 3 - 12;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title row with "See More" button.
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See More',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        // Horizontal list of movies.
        SizedBox(
          height: 200, // Adjust height based on image aspect ratio.
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildMovieItem(items[index], itemWidth, context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMovieItem(
      Map<String, String> movie, double itemWidth, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailsScreen();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: SizedBox(
          width: itemWidth,
          child: Column(
            children: [
              // Movie image with rounded corners.
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  movie['image']!,
                  width: itemWidth,
                  height: itemWidth * 1.25, // Adjust ratio as needed.
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 4),
              // Movie title.
              SizedBox(
                width: itemWidth,
                child: Text(
                  movie['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /*return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: SizedBox(
        width: itemWidth,
        child: Column(
          children: [
            // Movie image with rounded corners.
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                movie['image']!,
                width: itemWidth,
                height: itemWidth * 1.25, // Adjust ratio as needed.
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            // Movie title.
            SizedBox(
              width: itemWidth,
              child: Text(
                movie['title']!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
