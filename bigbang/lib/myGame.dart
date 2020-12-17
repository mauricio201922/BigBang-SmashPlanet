import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:bigbang/components/planets.dart';
import 'package:bigbang/components/backyard.dart';

class MyGame extends Game {
  Size screenSize;
  double tileSize;
  List<Planets> flies;
  Random rnd;
  double x, y;

  Backyard background;

  MyGame() {
    initialize();
  }

  void initialize() async {
    flies = List<Planets>();
    resize(await Flame.util.initialDimensions());
    rnd = Random();

    background = Backyard(this);
    spawnFly();
  }

  void spawnFly() {
    x = rnd.nextDouble() * (screenSize.width - tileSize);
    y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(Planets(this, x, y));
  }

  void render(Canvas canvas) {
    background.render(canvas);

    flies.forEach((Planets planets) => planets.render(canvas));
  }

  void update(double t) {
    flies.forEach((Planets planets) => planets.update(t));
    flies.removeWhere((Planets planets) => planets.isOffScreen);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    flies.forEach((Planets planets) {
      if (planets.flyRect.contains(d.globalPosition)) {
        planets.onTapDown();
      }
    });
  }
}
