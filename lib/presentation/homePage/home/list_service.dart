import 'package:flutter/material.dart';
import 'package:pixela/presentation/chatPage/chat.dart';
import 'package:pixela/misc/list_ai.dart';
import 'package:pixela/widgets/buttons.dart';

class ListAIS extends StatelessWidget {
  const ListAIS({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.37,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: listAI.length,
            itemBuilder: (BuildContext context, int index) {
              return AppButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChatPage(
                      title: listAI[index],
                      id: 0,
                    );
                  }));
                },
                text: listAI[index],
                textStyle: const TextStyle(color: Colors.white, fontSize: 14),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                radius: 10,
              );
            }));
  }
}
