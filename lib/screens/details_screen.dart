import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/button_widget.dart';
import '../widget/movie_section.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  final List<Map<String, String>> _recommendedMovies = [
    {'image': 'assets/recommended_1.png', 'title': 'Double Love'},
    {'image': 'assets/recommended_2.png', 'title': 'Curse Of The River'},
    {'image': 'assets/recommended_3.png', 'title': 'Sunita'}
  ];

  final _topCast = [
    {
      'image': 'assets/actor_1.jpeg',
      'name': 'Millie Bobby Brown',
    },
    {
      'image': 'assets/actor_2.jpeg',
      'name': 'Finn Wolfhard',
    },
    {
      'image': 'assets/actor_3.jpg',
      'name': 'Joe Keery',
    },
    {
      'image': 'assets/actor_2.jpeg',
      'name': 'Finn Wolfhard',
    },
    {
      'image': 'assets/actor_1.jpeg',
      'name': 'Millie Bobby Brown',
    },
    {
      'image': 'assets/actor_3.jpg',
      'name': 'Joe Keery',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Set system bar colors
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    const bannerHeight = 400.0;
    const itemWidth = 200;
    const top = bannerHeight - itemWidth / 2;
    const bottom = itemWidth / 2;

    final screenWidth = MediaQuery.of(context).size.width;
    // Subtract 16 padding on left and right (total 32) to get available width.
    final availableScreenWidth = screenWidth - 32;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: bottom),
            child: _topSection(top),
          ),
          const SizedBox(height: 16),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Trailer Section
                  const Text(
                    "Watch  Stranger Things Series Trailer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage('assets/details_image_2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // About Section
                  const Text(
                    "About Stranger Things",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "When a young boy vanishes, a small town uncovers a mystery "
                    "involving secret experiments, terrifying supernatural forces "
                    "and one strange little girl.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Starring
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Starring: ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Millie Bobby Brown, Finn Wolfhard, Winona Ryder",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Creators
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Creators: ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "The Duffer Brothers",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text("Top Cast",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),

                  const SizedBox(height: 10),

                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _topCast.length,
                      itemBuilder: (context, index) {
                        return _topCastItem(_topCast[index]);
                      },
                    ),
                  ),

                  MovieSection(
                      title: 'Recommended For You',
                      items: _recommendedMovies,
                      availableScreenWidth: availableScreenWidth),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topSection(double top) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        // Background Image
        Container(
          height: 400,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/details_banner.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Gradient Overlay (Opacity effect)
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.8), // Darker at bottom
                Colors.black.withOpacity(0.0), // Fully transparent at top
              ],
            ),
          ),
        ),

        Positioned(
          right: 16,
          left: 16,
          top: top,
          child: SizedBox(
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Movie Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/image.png",
                    width: 140,
                    height: 200, // Adjusted height for better proportions
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16), // Spacing

                // Movie Details & Buttons
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Stranger Things",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "2016  |  16+  |  4 Seasons  |  Sci-Fi",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Play Button & Download Icon
                      Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              color: const Color(0xFFFF3440),
                              text: "Play Now",
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12), // Spacing
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.file_download_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _topCastItem(Map<String, String> actor) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(actor['image']!),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                actor['name']!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
