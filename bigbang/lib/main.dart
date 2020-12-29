import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:bigbang/myGame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

void main() async {
  Util flameUtil = Util();
  WidgetsFlutterBinding.ensureInitialized();

  Flame.images.loadAll(<String>[
    'bg/backyard.png',
    'files/terra.png',
    'files/marte.png',
    'files/dead.png',
  ]);

  MyGame game = MyGame();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  // ignore: deprecated_member_use
  flameUtil.addGestureRecognizer(tapper);
}
