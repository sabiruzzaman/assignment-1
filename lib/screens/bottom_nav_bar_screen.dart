import 'package:flutter/material.dart';
import 'home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  // List of screens for each navigation item
  final List<Widget> _screens = [
    HomeScreen(),
    const Center(
        child: Text('TV Shows',
            style: TextStyle(fontSize: 24, color: Colors.white))),
    const Center(
        child: Text('Downloads',
            style: TextStyle(fontSize: 24, color: Colors.white))),
    const Center(
        child: Text('Profile',
            style: TextStyle(fontSize: 24, color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11161F),
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF161B24),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.tv, 1),
            _buildNavItem(Icons.download, 2),
            _buildNavItem(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              icon,
              size: 28,
              color: isSelected ? Colors.redAccent : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
