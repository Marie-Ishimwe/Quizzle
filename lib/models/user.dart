import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String nickname;
  int coins;
  int wins;

  UserModel({
    required this.id,
    required this.email,
    required this.nickname,
    this.coins = 0,
    this.wins = 0,
  });

  // Convert UserModel to a Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Email': email,
      'Nickname': nickname,
      'coins': coins,
      'wins': wins,
    };
  }

  // Factory method to create UserModel from a Map
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        email:
            data['Email'] ?? '', // Adjust key names to match JSON serialization
        nickname: data['Nickname'] ??
            '', // Adjust key names to match JSON serialization
        coins: data['coins'] ?? 0,
        wins: data['wins'] ?? 0,
      );
    } else {
      // Return a default UserModel instance if data is null
      return UserModel(
        id: document.id,
        email: '',
        nickname: '',
        coins: 0,
        wins: 0,
      );
    }
  }
}
