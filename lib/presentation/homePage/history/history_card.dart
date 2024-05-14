import 'package:flutter/material.dart';
import 'package:pixela/misc/colors.dart';
import 'package:pixela/misc/models.dart';
import 'package:pixela/presentation/chatPage/chat.dart';
import 'package:pixela/widgets/pixela.dart';
import 'package:pixela/widgets/text.dart';

class HistoryCard extends StatelessWidget {
  final int id;
  final String title;
  final String mess;
  final roleMess role;

  final Function(int id) deleteChat;
  const HistoryCard(
      {super.key,
      required this.id,
      required this.title,
      required this.mess,
      required this.role,
      required this.deleteChat});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(20),
        color: AppColors.bgButton,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
              text: "#$id | $title",
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Divider(color: AppColors.borderColor),
          role == roleMess.AI
              ? const Row(
                  children: [
                    Pixela(size: 25, type: pixelaType.normal),
                    AppText(
                        text: "Pixela",
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold))
                  ],
                )
              : Container(),
          Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: AppHistoryText(
                  text: mess,
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 12))),
          Divider(color: AppColors.borderColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {
                  deleteChat(id);
                },
                icon: const Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.red,
                  size: 30,
                ),
                label: const Text(''),
              ),
              TextButton.icon(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChatPage(
                      title: title,
                      id: id,
                    );
                  }));
                },
                icon: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.white,
                  size: 45,
                ),
                label: const Text(''),
              )
            ],
          )
        ],
      ),
    );
  }
}
