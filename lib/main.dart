import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:quizzle/authentication_repository.dart';
import 'package:quizzle/firebase_options.dart';
import 'package:quizzle/sign_up.dart';

Future main() async {
  //Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quizzle',
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
