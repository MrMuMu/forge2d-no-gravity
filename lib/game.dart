import 'package:flame/extensions/vector2.dart';
import 'package:flame/flame.dart';
import 'package:flame/keyboard.dart';
import 'package:flame/sprite.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:flutter/services.dart';
import 'package:physics/char.dart';

class Game extends Forge2DGame with KeyboardEvents {
  Char char;
  Game() {
    char = Char(Sprite(Flame.images.fromCache("box_big.png")), Vector2(45, 45));
    super.add(char);
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
