import 'package:flutter/material.dart';

class ContinueWatchingSection extends StatelessWidget {
  final List<Map<String, String>> continueWatching;

  const ContinueWatchingSection({super.key, required this.continueWatching});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Continue Watching',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('See More',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: continueWatching.length,
            itemBuilder: (context, index) {
              return _buildContinueWatchingItem(continueWatching[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContinueWatchingItem(Map<String, String> movie) {
    double progressPercentage =
        double.parse(movie['progress']!) / 100; // Convert progress to decimal

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // Center-aligning the contents
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    movie['image']!,
                    width: 170,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                // Progress Bar Background (Grey)
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 5,
                    width: 170,
                    decoration: const BoxDecoration(
                      color: Color(0xFF221821),
                      // Grey background for progress bar
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                // Dynamic Progress Bar (Red) - Starts from left and grows to right
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 5,
                    width: 170 * progressPercentage,
                    // Dynamic width based on progress
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF3440), // Red progress bar
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(12),
                        bottomRight:
                            Radius.circular(progressPercentage == 1 ? 12 : 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                movie['title']!,
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
    );
  }
}
