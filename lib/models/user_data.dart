import 'package:hive/hive.dart';
part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData {
  @HiveField(0)
  int lives;

  @HiveField(1)
  int wins;

  @HiveField(2)
  int hints;

  @HiveField(3)
  int coins;
  
  UserData({
    this.lives = 25, // Default lives for freemium users
    this.wins = 0,
    this.hints = 0,
    this.coins = 0,
  });
}
