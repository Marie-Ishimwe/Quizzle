import "dart:async";

import "package:flutter/material.dart";
import "package:quizzle/start_screen.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // The splash screen redirects to the loading screen
    Timer(const Duration(seconds: 2), ((() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const StartingScreen())));
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF88F1E),
      body: Center(
        child: Image.asset("/images/logo.png", width: 335.0, height: 338),
      ),
    );
  }
}
