import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:bigbang/components/planets.dart';
import 'package:bigbang/myGame.dart';

class Marte extends Planets {
  double get speed => game.tileSize * 2.5;

  Marte(MyGame game, double x, double y) : super(game) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('files/marte.png'));
    deadSprite = Sprite('files/dead.png');
  }
}
