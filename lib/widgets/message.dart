import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixela/misc/colors.dart';
import 'package:pixela/misc/models.dart';
import 'package:pixela/widgets/buttons.dart';
import 'package:pixela/widgets/pixela.dart';
import 'package:pixela/widgets/snackbar.dart';
import 'package:pixela/widgets/text.dart';

class Message extends StatelessWidget {
  final roleMess messageRole;
  final String mess;
  final bool copy;
  const Message(
      {required this.messageRole,
      required this.mess,
      super.key,
      required this.copy});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: messageRole == roleMess.AI
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            messageRole == roleMess.AI
                ? const Pixela(size: 35, type: pixelaType.normal)
                : Container(),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.only(
                            topLeft: messageRole == roleMess.AI
                                ? const Radius.circular(0)
                                : const Radius.circular(20),
                            topRight: messageRole == roleMess.user
                                ? const Radius.circular(0)
                                : const Radius.circular(20),
                            bottomLeft: const Radius.circular(20),
                            bottomRight: const Radius.circular(20)),
                        color: messageRole == roleMess.AI
                            ? AppColors.bgMessAI
                            : AppColors.bgMessUser,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: AppText(
                          text: mess,
                          textAlign: TextAlign.left,
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold))),
                  const SizedBox(
                    height: 5,
                  ),
                  messageRole == roleMess.AI && copy == true
                      ? AppButtonIcon(
                          radius: 10,
                          text: "COPY",
                          icon: Icons.copy,
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: mess))
                                .then((value) async {
                              await AppSnackBar()
                                  .visiual("Вы скопировали сообщение", context);
                            }); // -> show a notification
                          },
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20))
                      : const SizedBox()
                ],
              ),
            ),
          ]),
    );
  }
}
