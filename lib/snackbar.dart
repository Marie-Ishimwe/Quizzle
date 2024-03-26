import 'package:flutter/material.dart';

// Step 1: Define a GlobalKey for ScaffoldMessenger
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

Future<void> showCustomSnackBar(
    Color bgColor, IconData icon, String heading, String subheading) {
  final snackBar = SnackBar(
    backgroundColor: bgColor,
    content: Row(
      children: [
        Icon(
          icon,
          size: 30.0,
          color: Colors.white,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 5), // Add some spacing between text
              Text(
                subheading,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  // Step 3: Modify the function to use the global key
  scaffoldMessengerKey.currentState?.showSnackBar(snackBar);

  // Return a Future that completes after a delay
  // Adjust the duration based on how long you want the snackbar to be shown
  return Future.delayed(const Duration(seconds: 5));
}
