import 'package:assignment1/widget/category_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> _trendingMovies = [
    {'image': 'assets/trending_movies_1.png', 'title': 'Yes I Do'},
    {'image': 'assets/trending_movies_2.png', 'title': 'Soul Mate'},
    {'image': 'assets/trending_movies_3.png', 'title': 'UB\'s Secret'},
    {'image': 'assets/trending_movies_4.png', 'title': 'Yes I Do'}
  ];

  final List<Map<String, String>> _continueWatching = [
    {'image': 'assets/continue_watching_1.png', 'title': 'Wednesday | Season - 1 | Episode - 3', 'progress': '50'},
    {'image': 'assets/continue_watching_2.png', 'title': 'Emily in Paris | Season - 1 | Episode - 1', 'progress': '100'}
  ];

  final List<Map<String, String>> _recommendedMovies = [
    {'image': 'assets/recommended_1.png', 'title': 'Double Love'},
    {'image': 'assets/recommended_2.png', 'title': 'Curse Of The River'},
    {'image': 'assets/recommended_3.png', 'title': 'Sunita'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11161F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(),
              const SizedBox(height: 20),
              const CategorySection(),
              const SizedBox(height: 20),
              _buildBannerSection(),
              const SizedBox(height: 16),
              _buildMovieSection('Trending Movies', _trendingMovies),
              const SizedBox(height: 16),
              _buildContinueWatchingSection(),
              _buildMovieSection('Recommended For You', _recommendedMovies),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Rafsan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Let's watch today",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle:
                      const TextStyle(color: Color(0xFF969696), fontSize: 16),
                  filled: true,
                  fillColor: const Color(0xFF11161F),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 16),
                    // Right padding for the search icon
                    child: Icon(Icons.search, color: Color(0xFF7C7D80)),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    // Rounded corners
                    borderSide: const BorderSide(
                        color: Color(0xFF969696), width: 1), // Border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Color(0xFF969696), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFFF3440),
                borderRadius: BorderRadius.circular(16),
              ),
              child: IconButton(
                icon: const Icon(Icons.tune, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBannerSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/banner.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMovieSection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    color: Colors.white),
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
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildMovieItem(items[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMovieItem(Map<String, String> movie) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: SizedBox(
        width: 120, // Ensure the entire item has a fixed width
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevent unnecessary space expansion
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                movie['image']!,
                width: 120,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 120, // Keep text aligned with the image width
              child: Text(
                movie['title']!,
                maxLines: 1,
                // Allow maximum of 2 lines
                overflow: TextOverflow.ellipsis,
                // Show "..." if text is too long
                textAlign: TextAlign.start,
                // Align text under the image
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

  Widget _buildContinueWatchingSection() {
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
            itemCount: _continueWatching.length,
            itemBuilder: (context, index) {
              return _buildContinueWatchingItem(_continueWatching[index]);
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
