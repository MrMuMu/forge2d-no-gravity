import 'package:flame/extensions/vector2.dart';
import 'package:flame/flame.dart';
import 'package:flame/keyboard.dart';
import 'package:flame/sprite.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:flutter/services.dart';

import 'char.dart';

class Game extends Forge2DGame with KeyboardEvents {
  Char char;
  Game() : super(gravity: Vector2(0, 0), scale: 16.0) {
    char = Char(Sprite(Flame.images.fromCache("box_big.png")), Vector2(45 / 16.0, 45 / 16.0));
    super.add(char);
  }

  @override
  void update(double dt) {
    // print(fps());
    super.update(dt);
    print("char world: ${char.body.position}");
    print("char screen: ${viewport.getWorldToScreen(char.body.position)}");
    cameraFollow(char, horizontal: 0.0, vertical: 0.0);
    print("viewport.center: ${viewport.center}");
  }

  @override
  void onKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.character == "w") {
        char.body.applyLinearImpulse(Vector2(0, 1), char.body.worldCenter, true);
      } else if (event.character == "s") {
        char.body.applyLinearImpulse(Vector2(0, -1), char.body.worldCenter, true);
      }
    }
  }
}
