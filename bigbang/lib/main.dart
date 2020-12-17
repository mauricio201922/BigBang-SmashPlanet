import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:bigbang/myGame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

void main() {
  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(<String>[
    'bg/backyard.png',
  ]);

  MyGame game = MyGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  // ignore: deprecated_member_use
  flameUtil.addGestureRecognizer(tapper);
}
