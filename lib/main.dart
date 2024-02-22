import 'package:flutter/material.dart';
import 'package:quizzle/category_description.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/difficulty_page.dart';
import 'package:quizzle/nickname.dart';
import 'package:quizzle/arena.dart';
import 'package:quizzle/sign_in.dart';
import 'package:quizzle/sign_up.dart';
import 'package:quizzle/splash_screen.dart';
import 'package:quizzle/start_screen.dart';

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
      home: Difficultiness(),
    );
  }
}
