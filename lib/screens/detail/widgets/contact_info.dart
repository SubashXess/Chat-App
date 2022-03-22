import 'package:flutter/material.dart';
import 'package:nova_chat_app/models/message.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key, required this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${message.user.firstName}\n${message.user.lastName}',
            style: const TextStyle(
                height: 1.2,
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              _buildCallButton(Icons.phone),
              const SizedBox(
                width: 10,
              ),
              _buildCallButton(Icons.video_call),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCallButton(IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.2),
      ),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
