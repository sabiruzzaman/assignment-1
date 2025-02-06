import 'package:assignment1/screens/code_verification_screen.dart';
import 'package:flutter/material.dart';

import '../widget/button_widget.dart';
import '../widget/input_field_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11161F),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Forgot Password?",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),

                const SizedBox(height: 20),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "No worries, we’ll send you reset instructions.",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Email Field
                const InputFieldWidget(
                  label: 'Enter Your Mail Address',
                  hintText: 'youremail@gmail.com',
                  icon: Icons.mail,
                  type: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity, // Makes button full width
                  child: ButtonWidget(
                    color: const Color(0xFFFF3440),
                    text: "Get Code",
                    onTap: () {
                      // Add login logic here
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CodeVerificationScreen()));
                    },
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
