import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quizzle/authentication_repository.dart';
import 'package:quizzle/models/user.dart';

class UserRepository extends GetxController {
  // Static instance of the class
  static UserRepository get instance => Get.find();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseFirestore getFirestore() {
    return _db;
  }

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

  // Fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        throw Exception('User not found');
      }
    } on FirebaseException catch (e) {
      // Specific error handling for Firebase exceptions
      throw Exception('Firebase error: ${e.message}');
    } catch (e) {
      // Catch-all for other exceptions
      throw Exception('Unexpected error: $e');
    }
  }

  // Function to update user details and return the updated UserModel
  Future<UserModel> updateUserDetails(UserModel updateUser) async {
    try {
      // Update the user document
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());

      // Fetch the updated document
      final documentSnapshot =
          await _db.collection("Users").doc(updateUser.id).get();

      // Return the updated UserModel
      return UserModel.fromSnapshot(documentSnapshot);
    } on FirebaseException catch (e) {
      // Specific error handling for Firebase exceptions
      throw Exception('Firebase error: ${e.message}');
    } catch (e) {
      // Catch-all for other exceptions
      throw Exception('Unexpected error: $e');
    }
  }

  // Function to update a single attribute of a user
  Future<void> updateSingleAttribute(Map<String, dynamic> json) async {
    try {
      // Update the user document with the new attribute value
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      // Specific error handling for Firebase exceptions
      throw Exception('Firebase error: ${e.message}');
    } catch (e) {
      // Catch-all for other exceptions
      throw Exception('Unexpected error: $e');
    }
  }

// Function to delete the currently authenticated user's document
  // Future<void> deleteUserDocumentAndAuth(String userId) async {
  //   try {
  //     // Delete the user document
  //     await FirebaseFirestore.instance.collection("Users").doc(userId).delete();

  //     // Get the current user
  //     User? currentUser = _auth.currentUser;

  //     // Check if the current user is the one to be deleted
  //     if (currentUser != null && currentUser.uid == userId) {
  //       // Delete the user's authentication account
  //       await currentUser.delete();
  //     } else {
  //       // Handle the case where the current user is not the one to be deleted
  //       // This might involve using the Firebase Admin SDK on a server
  //       throw Exception(
  //           'Cannot delete user: The current user does not match the user to be deleted.');
  //     }
  //   } on FirebaseException catch (e) {
  //     // Specific error handling for Firebase exceptions
  //     throw Exception('Firebase error: ${e.message}');
  //   } catch (e) {
  //     // Catch-all for other exceptions
  //     throw Exception('Unexpected error: $e');
  //   }
  // }
// Function to delete the currently authenticated user's document
  Future<void> deleteUserDocument(String userId) async {
    try {
      // Delete the user document
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      // Specific error handling for Firebase exceptions
      throw Exception('Firebase error: ${e.message}');
    } catch (e) {
      // Catch-all for other exceptions
      throw Exception('Unexpected error: $e');
    }
  }
}
