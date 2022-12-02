import 'package:flutter/material.dart';

const kColorDarkWhite80 = Color(0xCCFAFAFA);
const kColorPrimaryText = Color(0xFF4F4F4F);
const kColorSecondaryText = Color(0xFFA4A4A4);
const kColorValueText = Color(0xFF666666);
const kColorDivider = Color(0xFFE3E3E3);
const kColorLightGrey = Color(0xFFF0F0F0);
const kColorFemale = Color(0xFFCE71E1);
const kColorMale = Color(0xFF80B6F4);

const kColorBug = Color(0xFF9DC130);
const kColorDark = Color(0xFF5F606D);
const kColorDragon = Color(0xFF0773C7);
const kColorElectric = Color(0xFFEDD53F);
const kColorFairy= Color(0xFFEF97E6);
const kColorFight= Color(0xFFD94256);
const kColorFire= Color(0xFFF8A54F);
const kColorFlying= Color(0xFF9BB4E8);
const kColorGhost= Color(0xFF6970C5);
const kColorGrass= Color(0xFF5DBE62);
const kColorGround= Color(0xFFD78555);
const kColorIce= Color(0xFF7ED4C9);
const kColorNormal= Color(0xFF9A9DA1);
const kColorPoison= Color(0xFFB563CE);
const kColorPsychic= Color(0xFFF87C7A);
const kColorRock= Color(0xFFCEC18C);
const kColorSteel= Color(0xFF5596A4);
const kColorWater = Color(0xFF559EDF);

class PrimaryFont {
  static String fontFamily = 'Avenir';

  static TextStyle book(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: size,
    );
  }

  static TextStyle medium(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: size,
    );
  }

  static TextStyle heavy(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w900,
      fontSize: size,
    );
  }
}

class PrimaryGradient {
  static Gradient defaultGradientBackground = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF6E95FD),
      Color(0xFF6FDEFA),
      Color(0xFF8DE061),
      Color(0xFF51E85E),
    ],
  );

  static LinearGradient waterGradientBackground = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF559EDF),
      Color(0xFF69B9E3),
    ],
  );
}
