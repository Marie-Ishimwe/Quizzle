import 'package:flutter/material.dart';

class DailySpecialPage extends StatelessWidget {
  const DailySpecialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Special'),
      ),
      body: const Center(
        child: Text('Daily Special Page'),
      ),
    );
  }
}
