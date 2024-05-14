import 'package:flutter/material.dart';
import 'package:pixela/misc/models.dart';
import 'package:pixela/presentation/chatPage/chat.dart';
import 'package:pixela/presentation/homePage/home/list_service.dart';
import 'package:pixela/widgets/buttons.dart';
import 'package:pixela/widgets/pixela.dart';
import 'package:pixela/widgets/text.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 25),
          child: const Pixela(size: 225, type: pixelaType.normal),
        ),
        const AppText(
            text: 'Могу ли я вам чем-нибудь помочь?',
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: AppButton(
                radius: 45,
                text: 'Перейти к чату',
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                padding: const EdgeInsets.symmetric(horizontal: 75),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ChatPage(
                      title: "Chat AI",
                      id: 0,
                    );
                  }));
                })),
        AppText(
            text: 'Список ИИ сервисов',
            textStyle:
                TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14)),
        const ListAIS()
      ],
    );
  }
}
