import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the services library
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:quizzle/authentication_repository.dart';
import 'package:quizzle/dashboard.dart';
import 'package:quizzle/firebase_options.dart';
import 'package:quizzle/start_screen.dart';
import 'package:quizzle/utils/popups/loading_page.dart';
import 'package:quizzle/verify_email.dart';
import 'authentication/controllers/signup/signup_controller.dart';
import 'user_repository.dart';

Future<void> _initializeApp() async {
  print("Initializing Firebase...");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Firebase initialized.");

  print("Initializing AuthenticationRepository...");
  Get.put(AuthenticationRepository());
  print("AuthenticationRepository initialized.");

  print("Initializing SignUpController...");
  Get.put(SignUpController());
  print("SignUpController initialized.");
  Get.put(UserRepository());
  print("UserRepository initialized.");
}

Future main() async {
  // Ensure that the Flutter engine is initialized before using any services.
  WidgetsFlutterBinding.ensureInitialized();

  // Await the initialization of Firebase and other services
  await _initializeApp();
  print("All initializations complete.");

  // Hide the system UI
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quizzle',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future:
            _initializeApp(), // This ensures that the app waits for initialization before proceeding
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Directly use the currentScreen value to determine the screen
            switch (AuthenticationRepository.instance.currentScreen.value) {
              case 'LoadingPage':
                return const LoadingPage();
              case 'StartingScreen':
                return const StartingScreen();
              case 'VerifyEmailScreen':
                return const VerifyEmailScreen();
              case 'Playground':
                return const Playground();
              default:
                return const SizedBox
                    .shrink(); // Placeholder for unexpected states
            }
          } else {
            // Show a loading indicator while waiting for initialization
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
