import 'package:flutter/material.dart';
import 'package:pixela/db/messages_table.dart';
import 'package:pixela/misc/colors.dart';
import 'package:pixela/presentation/chatPage/chat_bottom.dart';
import 'package:pixela/presentation/chatPage/chat_messanges.dart';
import 'package:pixela/widgets/text.dart';

class ChatContent extends StatelessWidget {
  final List<MessageModele> messages;
  final TextEditingController chatInputController;
  final String title;
  final void Function() onPressed;
  final ScrollController scrollController;

  const ChatContent(
      {super.key,
      required this.messages,
      required this.chatInputController,
      required this.onPressed,
      required this.title,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppText(
              text: title,
              textStyle: const TextStyle(color: Colors.white, fontSize: 18)),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.bgAppBar,
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              ChatModule(
                  messages: messages, scrollController: scrollController),
              ChatBottom(
                  onPress: onPressed, chatInputController: chatInputController),
            ],
          ),
        ));
  }
}
