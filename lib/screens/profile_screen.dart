import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11161F),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildHeaderSection(),
          const SizedBox(height: 32),
          _buildProfileMenu('Manage your account', Icons.person, () {}),
          const SizedBox(height: 16),
          _buildProfileMenu('Switch Account', Icons.switch_account, () {}),
          const SizedBox(height: 16),
          const Divider(color: Colors.white54, height: 20),
          const SizedBox(height: 16),
          _buildProfileMenu('Device Theme', Icons.brightness_4, () {}),
          const SizedBox(height: 16),
          _buildProfileMenu('Language: English', Icons.language, () {}),
          const SizedBox(height: 16),
          _buildProfileMenu('Location : USA', Icons.location_on, () {}),
          const SizedBox(height: 16),
          _buildProfileMenu('Settings', Icons.settings, () {}),
          const SizedBox(height: 16),
          const Divider(color: Colors.white54, height: 20),
          const SizedBox(height: 16),
          _buildProfileMenu('Help & Support', Icons.help, () {}),
          const SizedBox(height: 16),
          _buildProfileMenu('Feedback', Icons.feedback, () {}),
          const SizedBox(height: 16),
          const Divider(color: Colors.white54, height: 20),
          const SizedBox(height: 16),
          _buildProfileMenu('Sign Out', Icons.logout, () {

            print("'Sign Out' button is pressed");

          }),
        ]),
      )),
    );
  }

  Widget _buildHeaderSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rafsan Jany',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "@rafsanjany",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Image(image: AssetImage('assets/edit.png'), height: 35, color: Colors.white,),
           // Icon(Icons.edit, color: Colors.white),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileMenu(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Icon(Icons.keyboard_arrow_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
