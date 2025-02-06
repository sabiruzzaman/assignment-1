import 'package:assignment1/screens/bottom_nav_bar_screen.dart';
import 'package:assignment1/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:assignment1/widget/input_field_widget.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selection = 1; // Default selection to Monthly

  String? selectedOption = "Pay by Card";

  void selectPlan(int? planSelected) {
    if (planSelected != null) {
      setState(() {
        _selection = planSelected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11161F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              const Text(
                "Set up Your Payment & Buy Subscription",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text("Select a Plan",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),

              // Plan Selection Box
              _buildPlanSelection(),

              const SizedBox(height: 40),

              _buildSectionTitle("Billed To"),
              const SizedBox(height: 16),
              const InputFieldWidget(label: "Account Name", icon: Icons.person),
              const SizedBox(height: 16),
              _buildSectionTitle("Payment Details"),
              const SizedBox(height: 16),
              // Payment Methods
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildPaymentOption(
                      icon: Icons.credit_card,
                      text: "Pay by Card",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildPaymentOption(
                      icon: Icons.account_balance,
                      text: "Bank Transfer",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const InputFieldWidget(
                label: "Card Number",
                icon: Icons.credit_card,
              ),
              const SizedBox(height: 20),
              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      color: const Color(0xFF1C212A),
                      text: "Cancel",
                      onTap: () {
                        // Add cancel logic here
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ButtonWidget(
                      color: const Color(0xFFFF3440),
                      text: "Subscribe",
                      onTap: () {
                        // Add subscribe logic here
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavBarScreen()));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildPlanSelection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF1C212A),
      ),
      child: Column(
        children: [
          _buildPlanOption("Pay Monthly", 1),
          const Divider(color: Colors.white54, height: 20),
          _buildPlanOption("Pay Yearly (Save 20%)", 2),
        ],
      ),
    );
  }

  Widget _buildPlanOption(String title, int value) {
    return InkWell(
      onTap: () => selectPlan(value),
      child: Row(
        children: [
          Radio<int>(
            value: value,
            groupValue: _selection,
            onChanged: selectPlan,
            activeColor: const Color(0xFFFF3440),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({required IconData icon, required String text}) {
    bool isSelected = selectedOption == text;

    return Material(
      color: Colors.transparent, // Prevent InkWell from affecting background
      child: InkWell(
        splashColor: Colors.transparent, // Remove ripple effect
        highlightColor: Colors.transparent, // Remove highlight effect
        onTap: () {
          setState(() {
            selectedOption = text;
          });
        },
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                isSelected ? const Color(0xFF1C212A) : const Color(0xFF141922),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 30),
              const SizedBox(height: 8),
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
