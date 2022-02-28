import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';

import 'package:top_down/game/game.dart';

final controlKnobPaint = BasicPalette.blue.withAlpha(200).paint();
final controlBackgroundPaint = BasicPalette.blue.withAlpha(100).paint();

class Player extends SpriteComponent {
  Vector2 moveDirection = Vector2.zero();

  double _speed = 100;

  final joystick = JoystickComponent(
    knob: SpriteComponent(
        sprite: TopDownGame.buttonSheet.getSpriteById(1),
        size: Vector2.all(100)),
    background: SpriteComponent(
        sprite: TopDownGame.buttonSheet.getSpriteById(0),
        size: Vector2.all(150)),
    margin: const EdgeInsets.only(left: 40, bottom: 40),
  );

  Player({
    Sprite? sprite,
    Vector2? position,
    Vector2? size,
  }) : super(
          sprite: sprite,
          position: position,
          size: size,
        );

  @override
  void update(double dt) {
    super.update(dt);
    if (joystick.direction != JoystickDirection.idle) {
      position.add(joystick.relativeDelta * _speed * dt);

      angle = joystick.delta.screenAngle() - pi / 2;
    }
  }

  void setMoveDirection(Vector2 newMoveDirection) {
    moveDirection = newMoveDirection;
  }
}
