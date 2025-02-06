import 'package:assignment1/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';

import '../widget/button_widget.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({super.key});

  @override
  _CodeVerificationScreenState createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  int _resendSeconds = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_resendSeconds > 0) {
        setState(() {
          _resendSeconds--;
        });
        _startResendTimer();
      } else {
        setState(() {
          _canResend = true;
        });
      }
    });
  }

  void _onOtpEntered(int index, String value) {
    if (value.isNotEmpty && index < _controllers.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

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
                  "Enter Your Verification Code",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter the verification code sent to your email.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                // OTP Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => _buildOtpField(index),
                  ),
                ),

                const SizedBox(height: 16),

                // Resend Code Timer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _canResend
                          ? "Resend Code"
                          : "Resend Code in $_resendSeconds Sec",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity, // Makes button full width
                  child: ButtonWidget(
                    color: const Color(0xFFFF3440),
                    text: "Verify Now",
                    onTap: () {
                      // Add login logic here
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPasswordScreen()));
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

  Widget _buildOtpField(int index) {
    return Container(
      height: 65,
      width: 65,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1C212A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        // Center horizontally
        textAlignVertical: TextAlignVertical.center,
        // Center vertically
        style: const TextStyle(color: Colors.white, fontSize: 22),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero, // Remove default padding
        ),
        onChanged: (value) => _onOtpEntered(index, value),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
