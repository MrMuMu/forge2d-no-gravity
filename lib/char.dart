import 'package:flame/sprite.dart';
import 'package:flame_forge2d/sprite_body_component.dart';
import 'package:forge2d/forge2d.dart';

class Char extends SpriteBodyComponent {
  Char(Sprite sprite, Vector2 size) : super(sprite, size);

  List<Vector2> hitbox = [
    Vector2(-22.5 / 16.0, 22.5 / 16.0),
    Vector2(22.5 / 16.0, 22.5 / 16.0),
    Vector2(22.5 / 16.0, -22.5 / 16.0),
    Vector2(-22.5 / 16.0, -22.5 / 16.0),
  ];

  bool isMoving = false;

  @override
  void update(double dt) {
    super.update(dt);
    const maxSpeed = 20;
    if (isMoving && body.linearVelocity.x < maxSpeed) {
      body.applyLinearImpulse(Vector2(2, 0), body.worldCenter, true);
    }
  }

  @override
  Body createBody() {
    BodyDef bd = BodyDef();
    bd.position = spriteComponent.position;
    bd.type = BodyType.DYNAMIC;
    bd.setUserData(this);
    final Body body = world.createBody(bd);

    FixtureDef fd = FixtureDef();
    PolygonShape ps = PolygonShape();
    ps.set(hitbox, hitbox.length);
    fd.shape = ps;
    fd.density = 0.008;
    fd.friction = 0.8;

    return body..createFixture(fd);
  }
}
