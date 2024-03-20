import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String nickname;
  final String accountType; // New field for account type
  int coins;
  int wins;
  int hints;

  // Constructor with default values for new fields
  UserModel({
    required this.id,
    required this.email,
    required this.nickname,
    this.accountType = 'freemium', // Default value for account type
    this.coins = 0,
    this.wins = 0,
    this.hints = 0, // Default value for hint
  });

  // Convert UserModel to a Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Email': email,
      'Nickname': nickname,
      'account_type': accountType, // Adjust key for account type
      'coins': coins,
      'wins': wins,
      'hints': hints, // Include hint in the serialized map
    };
  }

  // Factory method to create UserModel from a Map
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        email: data['Email'] ?? '',
        nickname: data['Nickname'] ?? '',
        accountType: data['account_type'] ??
            'freemium', // Retrieve account type from document
        coins: data['coins'] ?? 0,
        wins: data['wins'] ?? 0,
        hints: data['hints'] ??
            0, // Retrieve hint from document, default to 0 if not present
      );
    } else {
      return UserModel(
        id: document.id,
        email: '',
        nickname: '',
        accountType: 'freemium',
        coins: 0,
        wins: 0,
        hints: 0, // Default value for hint
      );
    }
  }
}
