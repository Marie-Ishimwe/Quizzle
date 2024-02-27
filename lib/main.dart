import 'package:flutter/material.dart';
import 'package:quizzle/daily_special.dart';
import 'package:quizzle/difficulty_page.dart';
import 'package:quizzle/medium_page.dart';
import 'package:quizzle/splash_screen.dart';

import 'shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quizzle',
      debugShowCheckedModeBanner: false,
      home: MediumLevel(),
    );
  }
}
