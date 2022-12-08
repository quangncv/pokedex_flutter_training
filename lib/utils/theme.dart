import 'package:flutter/material.dart';

const kColorDarkWhite80 = Color(0xCCFAFAFA);
const kColorPrimaryText = Color(0xFF4F4F4F);
const kColorSecondaryText = Color(0xFFA4A4A4);
const kColorValueText = Color(0xFF666666);
const kColorDivider = Color(0xFFE3E3E3);
const kColorLightGrey = Color(0xFFF0F0F0);
const kColorFemale = Color(0xFFCE71E1);
const kColorMale = Color(0xFF80B6F4);
const kColorCaptureRate = Color(0xFF80B6F4);

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


}

const LinearGradient bugGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF92BC2C),
    Color(0xFFAFC836),
  ],
);

const LinearGradient darkGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF595761),
    Color(0xFF6E7587),
  ],
);

const LinearGradient dragonGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF0C69C8),
    Color(0xFF0180C7),
  ],
);

const LinearGradient electricGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFEDD53E),
    Color(0xFFFBE273),
  ],
);

const LinearGradient fairyGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFEC8CE5),
    Color(0xFFF3A7E7),
  ],
);

const LinearGradient fightGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFCE4265),
    Color(0xFFE74347),
  ],
);

const LinearGradient fireGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFFB9B51),
    Color(0xFFFBAE46),
  ],
);

const LinearGradient flyingGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF90A7DA),
    Color(0xFFA6C2F2),
  ],
);

const LinearGradient ghostGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF516AAC),
    Color(0xFF7773D4),
  ],
);

const LinearGradient grassGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF5FBC51),
    Color(0xFF5AC178),
  ],
);

const LinearGradient groundGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFDC7545),
    Color(0xFFD29463),
  ],
);

const LinearGradient iceGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF70CCBD),
    Color(0xFF8CDDD4),
  ],
);

const LinearGradient normalGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF9298A4),
    Color(0xFFA3A49E),
  ],
);

const LinearGradient poisonGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFA864C7),
    Color(0xFFC261D4),
  ],
);

const LinearGradient psychicGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFF66F71),
    Color(0xFFFE9F92),
  ],
);

const LinearGradient rockGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFFC5B489),
    Color(0xFFD7CD90),
  ],
);

const LinearGradient steelGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF52869D),
    Color(0xFF58A6AA),
  ],
);

const LinearGradient waterGradientBackground = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF559EDF),
    Color(0xFF69B9E3),
  ],
);
