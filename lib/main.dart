import 'package:flame/flame.dart';
import 'package:flame/game/game_widget.dart';
import 'package:flutter/material.dart';

import 'game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.util.fullScreen();
  await Flame.util.setLandscapeLeftOnly();

  await Flame.images.load("box_big.png");
  GameWidget gameWidget = GameWidget(
    game: Game(),
  );
  runApp(gameWidget);
}
