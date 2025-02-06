import 'package:assignment1/screens/login_screen.dart';
import 'package:assignment1/widget/password_input_field_widget.dart';
import 'package:flutter/material.dart';

import '../widget/button_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11161F),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Reset Your Password",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter your email address below to receive the password reset instructions.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                const PasswordInputFieldWidget(
                    label: "Enter New Password",
                    type: TextInputType.visiblePassword),

                const SizedBox(height: 16),

                const PasswordInputFieldWidget(
                    label: "Confirm Password",
                    type: TextInputType.visiblePassword),

                const SizedBox(height: 30),

                // Verify Button
                SizedBox(
                  width: double.infinity, // Makes button full width
                  child: ButtonWidget(
                    color: const Color(0xFFFF3440),
                    text: "Reset Now",
                    onTap: () {
                      // Add login logic here
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
