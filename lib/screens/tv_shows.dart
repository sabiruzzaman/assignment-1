import 'package:flutter/material.dart';

import '../widget/movie_section.dart';

class TvShows extends StatelessWidget {
  TvShows({super.key});

  final List<Map<String, String>> _trendingMovies = [
    {'image': 'assets/trending_movies_1.png', 'title': 'Yes I Do'},
    {'image': 'assets/trending_movies_2.png', 'title': 'Soul Mate'},
    {'image': 'assets/trending_movies_3.png', 'title': 'UB\'s Secret'},
  ];

  final List<Map<String, String>> _recommendedMovies = [
    {'image': 'assets/recommended_1.png', 'title': 'Double Love'},
    {'image': 'assets/recommended_2.png', 'title': 'Curse Of The River'},
    {'image': 'assets/recommended_3.png', 'title': 'Sunita'}
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Subtract 16 padding on left and right (total 32) to get available width.
    final availableScreenWidth = screenWidth - 32;

    return Scaffold(
      backgroundColor: const Color(0xFF11161F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieSection(
                  title: 'TV shows trending today',
                  items: _trendingMovies,
                  availableScreenWidth: availableScreenWidth),
              MovieSection(
                  title: 'Upcoming Movie and TV show  ',
                  items: _recommendedMovies,
                  availableScreenWidth: availableScreenWidth),
              SizedBox(
                height: 200, // Adjust height based on image aspect ratio.
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _trendingMovies.length,
                  itemBuilder: (context, index) {
                    return _buildMovieItem(
                        _trendingMovies[index], availableScreenWidth / 3 - 12);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieItem(Map<String, String> movie, double itemWidth) {
    return Padding(
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
    );
  }
}
