import 'package:etgebeya/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'utils/auth_guard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _getLandingPage() async {
    final loggedIn = await isUserLoggedIn();
    return loggedIn ? const HomeScreen() : const HomeScreen(); // HomePage always default
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ETGebeya',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<Widget>(
        future: _getLandingPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return snapshot.data!;
          } else {
            return const HomeScreen();
          }
        },
      ),
    );
  }
}
