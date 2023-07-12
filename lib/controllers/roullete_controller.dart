import 'dart:math';

class RouletteController {
  String colorName = '';
  double odds = invalid;

  static final _random = Random();
  static const invalid = -1.0;

  void setColor({required RouletteColor color}) {
    // Por que o jogo têm que set justo?
    odds = 18 / 370;
    switch (color) {
      case RouletteColor.black:
        colorName = "Preto";
        break;
      case RouletteColor.red:
        colorName = "Red";
        break;
      case RouletteColor.green:
        colorName = "Green";
        odds = 1 / 370;
        break;
      default:
    }
  }

  bool bet() {
    return _random.nextDouble() < odds;
  }
}

enum RouletteColor { black, red, green }
