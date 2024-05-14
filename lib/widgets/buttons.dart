import 'package:flutter/material.dart';
import 'package:pixela/misc/colors.dart';
import 'package:pixela/widgets/text.dart';

class AppButton extends StatelessWidget {
  final double radius;
  final String text;
  final void Function() onPressed;
  final TextStyle textStyle;
  final EdgeInsets padding;
  const AppButton(
      {required this.radius,
      required this.text,
      required this.onPressed,
      required this.textStyle,
      required this.padding,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                    side: BorderSide(color: AppColors.borderColor, width: 2))),
            backgroundColor: const MaterialStatePropertyAll(AppColors.bgButton),
            padding: MaterialStatePropertyAll(padding)),
        child: AppText(text: text, textStyle: textStyle));
  }
}

class AppButtonIcon extends StatelessWidget {
  final double radius;
  final String text;
  final void Function() onPressed;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final IconData icon;
  const AppButtonIcon(
      {required this.radius,
      required this.text,
      required this.onPressed,
      required this.textStyle,
      required this.padding,
      super.key,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                    side: BorderSide(color: AppColors.borderColor, width: 2))),
            backgroundColor: const MaterialStatePropertyAll(AppColors.bgButton),
            padding: MaterialStatePropertyAll(padding)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          AppText(text: text, textStyle: textStyle),
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            size: 20,
            color: Colors.white,
          )
        ]));
  }
}
