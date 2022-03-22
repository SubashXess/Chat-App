import 'package:flutter/material.dart';
import 'package:nova_chat_app/constants/colors.dart';
import 'package:nova_chat_app/models/message.dart';
import 'package:nova_chat_app/screens/detail/widgets/contact_info.dart';
import 'package:nova_chat_app/screens/detail/widgets/detail_app_bar.dart';
import 'package:nova_chat_app/screens/detail/widgets/detail_message.dart';

class DetailPage extends StatelessWidget {
  final Message message;
  const DetailPage(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: Column(
        children: [
          const DetailAppBar(),
          ContactInfo(message: message),
          Expanded(child: DetailMessages()),
        ],
      ),
    );
  }
}
