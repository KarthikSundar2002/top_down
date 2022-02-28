import 'dart:math';

import 'package:flame/components.dart';

class Bullet extends SpriteComponent {
  double _speed = 450;

  Bullet({
    Sprite? sprite,
    Vector2? size,
    Vector2? position,
    double? angle,
  }) : super(sprite: sprite, size: size, position: position, angle: angle);

  @override
  void update(double dt) {
    super.update(dt);

    position += Vector2(cos(angle), sin(angle)) * _speed * dt;
  }
}
