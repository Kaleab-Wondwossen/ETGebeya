import 'package:etgebeya/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'splash_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Auto-advance pages every 3 seconds
    Future.delayed(const Duration(seconds: 3), _nextPage);
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() => _currentPage++);
      Future.delayed(const Duration(seconds: 3), _nextPage);
    } else {
      // Navigate to the home screen after the last splash screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swiping
        children: [
          SplashScreen1(),
          const SplashScreen2(),
          const SplashScreen3(),
        ],
      ),
    );
  }
}