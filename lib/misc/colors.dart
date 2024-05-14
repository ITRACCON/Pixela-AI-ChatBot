import 'package:flutter/material.dart';

class AppColors {
  static const LinearGradient bgGradient = LinearGradient(
    colors: [Color(0xFF2a0845), Color(0xFF6441a5)],
    stops: [0, 1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Color bgAppBar = Color(0xFF2a0845);
  static const Color bgButton = Color(0xFF210637);
  static const Color bgButton2 = Color(0xFF40296A);
  static final Color bgMessAI = const Color(0xFF25073e).withOpacity(0.8);
  static final Color bgMessUser = const Color(0xFF3A1F51).withOpacity(0.7);
  static final Color borderColor = Colors.white.withOpacity(0.08);
}
