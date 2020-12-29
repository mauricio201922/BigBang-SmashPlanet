import 'dart:ui';
import 'package:bigbang/view.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:bigbang/components/planets.dart';
import 'package:bigbang/components/terra.dart';
import 'package:bigbang/components/backyard.dart';
import 'package:bigbang/components/marte.dart';

class MyGame extends Game {
  Size screenSize;
  double tileSize;
  List<Planets> flies;
  Random rnd;
  double x, y;

  int score;

  Backyard background;

  View activeView = View.home;

  MyGame() {
    initialize();
  }

  void initialize() async {
    flies = List<Planets>();
    rnd = Random();
    score = 0;
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
    spawnFly();
  }

  void spawnFly() {
    x = rnd.nextDouble() * (screenSize.width - tileSize);
    y = rnd.nextDouble() * (screenSize.height - tileSize);
    switch (rnd.nextInt(2)) {
      case 0:
        flies.add(Terra(this, x, y));
        break;
      case 1:
        flies.add(Marte(this, x, y));
        break;
    }
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
        score++;
        print("Points: " + score.toString());
        planets.onTapDown();
      }
    });
  }
}
