import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static Color gray900 = hexToColor('#0e0f0f');
  static Color kGrey = const Color(0xFF191919);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
