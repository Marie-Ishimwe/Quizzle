import 'package:flutter/material.dart';
import 'package:quizzle/dashboard.dart';

// Import the custom dialog widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //         appBar: AppBar(
  //           title: const Text('Custom Dialog Example'),
  //         ),
  //         body: const CustomDialog(
  //           image: AssetImage('assets/images/bear.png'),
  //           title: "Sample",
  //           message: "Look here",
  //         )),
  //   );
  // }
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Playground(),
    );
  }
}
