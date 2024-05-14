import 'package:flutter/material.dart';
import 'package:pixela/misc/colors.dart';
import 'package:pixela/misc/models.dart';
import 'package:pixela/widgets/pixela.dart';
import 'package:pixela/widgets/text.dart';

class AppSnackBar {
  Future<void> visiual(mess, context) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.bgMessAI),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Pixela(size: 40, type: pixelaType.normal,),
            SizedBox(
              width: 10,
            ),
            AppText(
                text: 'Вы скопировали сообщение',
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 170,
          right: 20,
          left: 20),
    ));
  }
}
