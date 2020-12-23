import 'package:flame/extensions/vector2.dart';
import 'package:flame/flame.dart';
import 'package:flame/keyboard.dart';
import 'package:flame/sprite.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:flutter/services.dart';

import 'char.dart';

class Game extends Forge2DGame with KeyboardEvents {
  Char char;
  Game() : super(gravity: Vector2(0, -1000), scale: 16.0) {
    char = Char(Sprite(Flame.images.fromCache("box_big.png")), Vector2(45 / 16.0, 45 / 16.0));
    super.add(char);
  }

  @override
  void update(double dt) {
    cameraFollow(char, horizontal: 0.0, vertical: 0.0);
    // print(fps());
    super.update(dt);
  }

  @override
  void onKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.character == "d") {
        char.isMoving = true;
      } else if (event.character == "a") {
        char.isMoving = false;
      }
    }
  }
}
