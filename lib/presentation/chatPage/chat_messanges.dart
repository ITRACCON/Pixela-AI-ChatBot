import 'package:flutter/material.dart';
import 'package:pixela/db/messages_table.dart';
import 'package:pixela/misc/colors.dart';
import 'package:pixela/widgets/message.dart';

class ChatModule extends StatelessWidget {
  final List<MessageModele> messages;
  final ScrollController scrollController;
  const ChatModule(
      {required this.messages, super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.76,
      decoration: const BoxDecoration(gradient: AppColors.bgGradient),
      child: ListView.builder(
        itemCount: messages.length + 1,
        shrinkWrap: true,
        controller: scrollController,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (context, index) {
          if (index == messages.length) {
            return Container(height: 20);
          } else {
            return Message(
                messageRole: messages[index].messageRole,
                mess: messages[index].messageContent,
                copy: index > 2 ? true : false);
          }
        },
      ),
    );
  }
}
