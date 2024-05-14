import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixela/misc/models.dart';
import 'package:pixela/widgets/text.dart';

Map<pixelaType, String> pixela = {
  pixelaType.normal: 'assets/images/pixela2.svg',
  pixelaType.load: 'assets/images/Pixela_LOAD.svg',
  pixelaType.sad: 'assets/images/Pixela_SAD.svg',
};

class Pixela extends StatelessWidget {
  final double size;
  final pixelaType type;

  const Pixela({required this.size, super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      pixela[type]!,
      width: size,
      height: size,
    );
  }
}

class PixelaInfo extends StatelessWidget {
  final String text;
  final pixelaType type;

  const PixelaInfo({required this.text, super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.78,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Pixela(size: 250, type: type),
            AppText(
                text: text,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
