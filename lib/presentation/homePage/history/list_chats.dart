import 'package:flutter/material.dart';
import 'package:pixela/db/messages_table.dart';
import 'package:pixela/presentation/homePage/history/history_card.dart';

class ListChats extends StatelessWidget {
  final List<Messages> chats;
  final void Function(int id) deleteChat;
  const ListChats({required this.chats, super.key, required this.deleteChat});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.87,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              return HistoryCard(
                  id: chats[index].id,
                  title: chats[index].title,
                  mess: chats[index].messages.last.messageContent,
                  role: chats[index].messages.last.messageRole,
                  deleteChat: (id) {
                    deleteChat(id);
                  });
            }));
  }
}
