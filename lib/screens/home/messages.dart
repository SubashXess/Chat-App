import 'package:flutter/material.dart';
import 'package:nova_chat_app/constants/colors.dart';
import 'package:nova_chat_app/models/message.dart';
import 'package:nova_chat_app/screens/detail/detail.dart';

class Messages extends StatelessWidget {
  Messages({Key? key}) : super(key: key);
  final messagesList = Message.generateHomePageMessages();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: _buildMessages(),
      ),
    );
  }

  Widget _buildMessages() {
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => _buildMessage(context, index),
        separatorBuilder: (_, index) => const SizedBox(height: 30),
        itemCount: messagesList.length);
  }

  Widget _buildMessage(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(messagesList[index])));
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: messagesList[index].user.bgColor,
                shape: BoxShape.circle),
            child: Image.asset(
              messagesList[index].user.iconUrl,
              width: 60.0,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${messagesList[index].user.firstName} ${messagesList[index].user.lastName}',
                      style: const TextStyle(
                          fontSize: 16,
                          color: kPrimaryDark,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      messagesList[index].lastTime,
                      style: const TextStyle(color: kGrayLight),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  messagesList[index].lastMessage,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: kPrimaryDark),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
