import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quizzle/models/user.dart';

class UserRepository extends GetxController {
  // Static instance of the class
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      // Specific error handling
      if (e is FirebaseException) {
        throw ('Firebase error: ${e.message}');
      } else {
        throw ('Unexpected error: $e');
      }
    }
  }
}
