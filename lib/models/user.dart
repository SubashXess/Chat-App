import 'package:flutter/material.dart';

class User {
  num id;
  String firstName;
  String lastName;
  String iconUrl;
  Color bgColor;
  User(this.id, this.firstName, this.lastName, this.iconUrl, this.bgColor);

  static List<User> generateUsers() {
    return [
      User(1, 'Cecily', 'Trujillo', 'assets/images/user1.png',
          const Color(0xFFFDBEC8)),
      User(2, 'James', 'Jacob', 'assets/images/user2.png',
          const Color(0xFFFA8072)),
      User(3, 'Sarah', 'Kyle', 'assets/images/user3.png',
          const Color(0xFF00BEFE)),
      User(4, 'Robert', 'Smith', 'assets/images/user4.png',
          const Color(0xFF00FE7F)),
      User(5, 'Maria', 'Garcia', 'assets/images/user5.png',
          const Color(0xFFFFFF00)),
      User(6, 'Williams', 'Reece', 'assets/images/user6.png',
          const Color(0xFFFF6347)),
    ];
  }
}
