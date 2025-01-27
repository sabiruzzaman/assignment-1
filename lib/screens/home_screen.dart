import 'package:assignment1/widget/category_section.dart';
import 'package:assignment1/widget/continue_watching_section.dart';
import 'package:assignment1/widget/movie_section.dart';
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
    {
      'image': 'assets/continue_watching_1.png',
      'title': 'Wednesday | Season - 1 | Episode - 3',
      'progress': '50'
    },
    {
      'image': 'assets/continue_watching_2.png',
      'title': 'Emily in Paris | Season - 1 | Episode - 1',
      'progress': '100'
    }
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
              MovieSection(title: 'Trending Movies', items: _trendingMovies),
              const SizedBox(height: 16),
              ContinueWatchingSection(continueWatching: _continueWatching),
              MovieSection(title: 'Recommended For You', items: _recommendedMovies),
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

}
