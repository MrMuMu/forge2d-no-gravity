import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.util.fullScreen();
  await Flame.util.setLandscapeLeftOnly();

  await Flame.images.load("box_big.png");
  Game game = Game();
  runApp(game.widget);
}
