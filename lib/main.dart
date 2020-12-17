import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SpaceShooterGame().widget);
}

Paint _white = Paint()..color = Color(0xFFFFFFFF);

class GameObject {
  Rect position;

  void render(Canvas canvas) {
    canvas.drawRect(position, _white);
  }
}

class SpaceShooterGame extends Game {
  GameObject player;

  SpaceShooterGame() {
    player = GameObject()..position = Rect.fromLTWH(100, 500, 50, 50);
  }

  @override
  void update(double dt) {}

  @override
  void render(Canvas canvas) {
    player.render(canvas);
  }
}
