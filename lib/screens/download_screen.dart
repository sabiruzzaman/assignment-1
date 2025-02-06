import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> downloadedItems = [
      {
        'image': 'assets/dw_1.png',
        'title': 'Money Heist | Season - 1',
      },
      {
        'image': 'assets/dw_2.png',
        'title': 'The Umbrella Academy',
      },
      {
        'image': 'assets/dw_3.png',
        'title': 'Pushpa 2',
      },
      {
        'image': 'assets/dw_4.png',
        'title': 'Lucky Baskhar',
      },
      {
        'image': 'assets/dw_5.png',
        'title': 'Black Panther',
      },
      {
        'image': 'assets/dw_6.png',
        'title': 'Castle in The Sky',
      },
      {
        'image': 'assets/dw_1.png',
        'title': 'Money Heist | Season - 1',
      },
      {
        'image': 'assets/dw_2.png',
        'title': 'The Umbrella Academy',
      },
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final availableScreenWidth = screenWidth - 32;

    return Scaffold(
      backgroundColor: const Color(0xFF11161F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Downloads",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: downloadedItems.length,
                  itemBuilder: (context, index) {
                    return _buildGridItem(
                        downloadedItems[index], availableScreenWidth / 2 - 16);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(Map<String, String> item, double itemWidth) {
    return SizedBox(
      width: itemWidth,
      child: Column(
        children: [
          // Movie image with rounded corners.
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item['image']!,
              width: itemWidth,
              height: 96, // Fixed height for the image
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          // Movie title and "Downloaded" label.
          SizedBox(
            width: itemWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D2D2D),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      "Downloaded",
                      style: TextStyle(
                        color: Color(0xFF969696),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
