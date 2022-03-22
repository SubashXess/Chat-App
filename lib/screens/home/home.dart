import 'package:flutter/material.dart';
import 'package:nova_chat_app/constants/colors.dart';
import 'package:nova_chat_app/screens/home/messages.dart';
import 'package:nova_chat_app/screens/home/widgets/recent_contacts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Chat with\nyour friends',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
            RecentContact(),
            Messages(),
          ],
        ),
      ),
    );
  }
}
