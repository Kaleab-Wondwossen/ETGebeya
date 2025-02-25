import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SplashScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor, // White background
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/shoppingCart.png', width: 150, height: 150), // App logo
            const SizedBox(height: 20),
            const Text(
              'Welcome to E-Commerce App',
              style: TextStyle(
                color: AppColors.primaryTextColor, // Black text
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor, // White background
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.explore, size: 100, color: AppColors.primaryColor), // Feature icon
            SizedBox(height: 20),
            Text(
              'Explore Thousands of Products',
              style: TextStyle(
                color: AppColors.primaryTextColor, // Black text
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor, // White background
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_add, size: 100, color: AppColors.accentColor), // Sign-up icon
            SizedBox(height: 20),
            Text(
              'Sign Up to Get Started',
              style: TextStyle(
                color: AppColors.primaryTextColor, // Black text
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}