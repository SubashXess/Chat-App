import 'package:flutter/material.dart';
import 'package:nova_chat_app/models/user.dart';

class Message {
  User user;
  String lastMessage;
  String lastTime;
  bool isContinue;
  Message(this.user, this.lastMessage, this.lastTime,
      {this.isContinue = false});

  static List<Message> generateHomePageMessages() {
    return [
      Message(
          users[0], 'Hey there! What\'s up? What are you doing now?', '18:32'),
      Message(
          users[1], 'Can I call you back? I\'m in the hospital now.', '18:06'),
      Message(
          users[2], 'Yeah, Do you have any good songs to suggest?', '15:58'),
      Message(users[3], 'Hi! I went shopping today and I missed your message!',
          '13:35'),
      Message(users[4], 'I passed you on the ride into work, have you see me?',
          '12:11'),
      Message(users[5], 'Hey there! What\'s up? Is everything going well?',
          '12:00'),
    ];
  }

  static List<Message> generateMessagesFromUser() {
    return [
      Message(users[0], 'Hey there! What\'s up? Is everything going well?',
          '18:35'),
      Message(
          me,
          'Nothing. Just chilling and watching YouTube. What about you?',
          '18:36'),
      Message(
          users[0],
          'Same here! Been watching YouTube for the past 5 hours despite of having so much to do! 😅',
          '18:39',
          isContinue: true),
      Message(users[0], 'It\'s hard to be productive, man 🙄', '18:39'),
      Message(me, 'Yeah I know, I\'m in the same position', '18:40'),
      Message(users[0], 'lol 🤣', '18:45'),
    ];
  }
}

var users = User.generateUsers();
var me = User(
    0, 'Sylvanus', 'Xess', 'assets/images/user0.png', const Color(0xFFFFFFFF));
