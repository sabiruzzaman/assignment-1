import 'package:assignment1/screens/sign_up_screen.dart';
import 'package:assignment1/screens/subscription_screen.dart';
import 'package:assignment1/widget/input_field_widget.dart';
import 'package:assignment1/widget/password_input_field_widget.dart';
import 'package:flutter/material.dart';

import '../widget/button_widget.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11161F),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const Image(
                      image: AssetImage('assets/logo.png'), height: 100),
                  const Text("Welcome!",
                      style: TextStyle(fontSize: 32, color: Colors.white)),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("to ",
                          style: TextStyle(fontSize: 32, color: Colors.white)),
                      Text("UIPtv",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFF3440))),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Email Field
                  const InputFieldWidget(
                    label: 'Email Address',
                    hintText: 'yourmail@gmail.com',
                    icon: Icons.mail,
                    type: TextInputType.emailAddress,
                  ),

                  // Password Field
                  const PasswordInputFieldWidget(
                      label: "Password", type: TextInputType.visiblePassword),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity, // Makes button full width
                    child: ButtonWidget(
                      color: const Color(0xFFFF3440),
                      text: "Login",
                      onTap: () {
                        // go to home screen
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SubscriptionScreen()));
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () {
                      // go forgot password screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen()));
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // Sign Up Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don’t have an account? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    // go to sign up screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color(0xFFFF3440),
                      fontWeight: FontWeight.bold,
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
