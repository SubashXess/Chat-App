import 'package:flutter/material.dart';
import 'package:nova_chat_app/constants/colors.dart';
import 'package:nova_chat_app/models/message.dart';

class DetailMessages extends StatelessWidget {
  DetailMessages({Key? key}) : super(key: key);
  final myId = 0;
  final list = Message.generateMessagesFromUser();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var messageList = List.from(list.reversed);
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.fromLTRB(25, 50, 25, 80),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView.separated(
              reverse: true,
              controller: _scrollController,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) =>
                  messageList[index].user.id == myId
                      ? _buildReceivedText(messageList[index])
                      : _buildSenderText(messageList[index]),
              separatorBuilder: (_, index) => const SizedBox(height: 20),
              itemCount: messageList.length),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 50,
            width: 300,
            child: Stack(
              children: [
                TextField(
                  onTap: () {
                    _scrollController.animateTo(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  },
                  decoration: InputDecoration(
                    fillColor: kGrayLight.withOpacity(0.2),
                    filled: true,
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Type your message...',
                    hintStyle: TextStyle(
                      color: kPrimaryDark.withOpacity(0.3),
                      fontSize: 14,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: kPrimary, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildReceivedText(Message message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          message.lastTime,
          style: const TextStyle(color: kGrayLight, fontSize: 12),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: kPrimaryLight,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 180),
            child: Text(
              message.lastMessage,
              style: const TextStyle(height: 1.5, color: kPrimaryDark),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSenderText(Message message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            message.isContinue
                ? const SizedBox(width: 40)
                : Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: message.user.bgColor, shape: BoxShape.circle),
                    child: Image.asset(
                      message.user.iconUrl,
                      width: 30,
                    ),
                  ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kGrayLight.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 180),
                child: Text(
                  message.lastMessage,
                  style: const TextStyle(height: 1.5, color: kPrimaryDark),
                ),
              ),
            ),
          ],
        ),
        Text(
          message.lastTime,
          style: const TextStyle(color: kGrayLight, fontSize: 12),
        ),
      ],
    );
  }
}
