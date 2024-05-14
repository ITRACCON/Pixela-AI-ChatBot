import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixela/misc/colors.dart';

class ChatBottom extends StatelessWidget {
  final void Function() onPress;
  final TextEditingController chatInputController;

  const ChatBottom(
      {super.key, required this.onPress, required this.chatInputController});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.bgAppBar,
              border: Border.symmetric(
                  horizontal:
                      BorderSide(color: AppColors.borderColor, width: 2))),
          padding: const EdgeInsets.only(left: 10, bottom: 5, top: 5),
          height: size.height * 0.12,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(
                  controller: chatInputController,
                  maxLines: 20,
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(color: Colors.white)),
                  decoration: const InputDecoration(
                      hintText: "Напиши свой запрос",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              TextButton.icon(
                onPressed: onPress,
                icon: const Icon(
                  Icons.send_sharp,
                  color: Colors.white,
                  size: 30,
                ),
                label: const Text(''),
              )
            ],
          ),
        ));
  }
}
