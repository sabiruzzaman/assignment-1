import 'package:flutter/material.dart';
import '../widget/input_field_widget.dart';
import '../widget/password_input_field_widget.dart';
import '../widget/button_widget.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false; // State for checkbox

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
                const SizedBox(height: 100),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Sign Up",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Let's get started. Are you ready to be a part of something new? Then boldly move forward with us.",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 20),

                // User Field
                const InputFieldWidget(
                  label: 'User Name',
                  hintText: 'John Doe',
                  icon: Icons.person,
                  type: TextInputType.emailAddress,
                ),

                // Email Field
                const InputFieldWidget(
                  label: 'Email Address',
                  hintText: 'youremail@gmail.com',
                  icon: Icons.mail,
                  type: TextInputType.emailAddress,
                ),

                // Password Field
                const PasswordInputFieldWidget(
                    label: "Password", type: TextInputType.visiblePassword),

                const SizedBox(
                  height: 4,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    highlightColor: Colors.transparent,
                    // Removes highlight color
                    splashColor: Colors.transparent, // Removes ripple effect
                  ),
                  child: CheckboxListTile(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    title: const Text(
                      "I agree to the Terms and Conditions",
                      style: TextStyle(color: Colors.white),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    // Checkbox on the left
                    checkColor: Colors.white,
                    activeColor: const Color(0xFFFF3440),
                    contentPadding: EdgeInsets.zero,
                    hoverColor: Colors.transparent,
                    splashRadius: 0,
                    autofocus: false, // Remove unwanted padding

                    // Remove unwanted padding
                  ),
                ),

                // Sign Up Button
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ButtonWidget(
                    color: const Color(0xFFFF3440),
                    text: "Sign Up",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),
                const Text("Or Sign Up with",
                    style: TextStyle(color: Colors.white)),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Image(image: AssetImage('assets/google.png')),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Image(image: AssetImage('assets/facebook.png')),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Image(image: AssetImage('assets/twitter.png')),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),

          // Sign Up Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Text(
                    "Login",
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
