// lib/screens/account_creation_screen.dart

import 'package:flutter/material.dart';
import 'package:housingapp/widgets/custom_button.dart';
import 'package:housingapp/screens/housing_type_selection_screen.dart';
import 'dart:math'; // Import for Random number generation

class AccountCreationScreen extends StatefulWidget {
  const AccountCreationScreen({super.key});

  @override
  State<AccountCreationScreen> createState() => _AccountCreationScreenState();
}

class _AccountCreationScreenState extends State<AccountCreationScreen> {
  final Random _random = Random(); // Initialize Random once

  // List of different house icons to choose from randomly
  final List<IconData> _houseIconTypes = [
    Icons.house_outlined,
    Icons.apartment_outlined,
    Icons.villa_outlined,
    Icons.home_work_outlined,
    Icons.cottage_outlined,
    Icons.architecture_outlined, // Can represent a building structure
  ];

  // Helper to generate a random position within screen bounds
  double _randomX(double screenWidth, {double padding = 10}) =>
      _random.nextDouble() * (screenWidth - 2 * padding) + padding;
  double _randomY(double screenHeight, {double padding = 10}) =>
      _random.nextDouble() * (screenHeight - 2 * padding) + padding;

  // Helper to generate a random rotation angle (in radians)
  double _randomRotation() => (_random.nextDouble() - 0.5) * 2 * pi * 0.3; // -0.3pi to 0.3pi for varied rotation

  // Helper to generate a random size within a range
  double _randomSize(double min, double max) => min + (_random.nextDouble() * (max - min));

  void _continue() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HousingTypeSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * -0.2,
            child: Transform.rotate(
              angle: -0.2,
              child: Opacity(
                opacity: 0.1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.2,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.green.withAlpha((0.05 * 255).round()),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha((0.03 * 255).round()),
                shape: BoxShape.circle,
              ),
            ),
          ),
          ...List.generate(8, (index) {
            final double iconSize = _randomSize(35.0, 70.0);
            final double opacity = _random.nextDouble() * 0.1 + 0.05;
            final IconData selectedIcon = _houseIconTypes[_random.nextInt(_houseIconTypes.length)];

            return Positioned(
              top: _randomY(MediaQuery.of(context).size.height, padding: iconSize),
              left: _randomX(MediaQuery.of(context).size.width, padding: iconSize),
              child: Transform.rotate(
                angle: _randomRotation(),
                child: Opacity(
                  opacity: opacity,
                  child: Icon(
                    selectedIcon,
                    size: iconSize,
                    color: Colors.green,
                  ),
                ),
              ),
            );
          }),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Home!',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Explore housing options.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black54,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  CustomButton(
                    text: 'Get Started',
                    onPressed: _continue,
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}