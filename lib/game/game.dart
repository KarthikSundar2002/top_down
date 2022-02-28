import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_down/game/bullet.dart';
import 'package:top_down/game/player.dart';

class TopDownGame extends FlameGame with HasDraggables, HasTappables {
  static var buttonSheet = null;

  void fire(Player player) {
    Bullet bullet = Bullet(
      sprite: Sprite(images.fromCache('tile_87.png')),
      size: Vector2(32, 32),
      position: player.position,
      angle: player.angle,
    );

    add(bullet);
  }

  @override
  Future<void> onLoad() async {
    await images.load("tilesheet_complete_2X.png");
    await images.load("spritesheet_characters.png");
    await images.load("ManBlue/manBlue_gun.png");
    await images.load("joystick.png");
    await images.load("tile_87.png");

    buttonSheet = SpriteSheet.fromColumnsAndRows(
        image: images.fromCache("joystick.png"), columns: 6, rows: 1);

    final tileSpriteSheet = SpriteSheet.fromColumnsAndRows(
      image: images.fromCache('tilesheet_complete_2X.png'),
      columns: 27,
      rows: 20,
    );

    final characterSpriteSheet = SpriteSheet.fromColumnsAndRows(
        image: images.fromCache('spritesheet_characters.png'),
        columns: 11,
        rows: 5);

    Player player = Player(
      sprite: Sprite(images.fromCache('ManBlue/manBlue_gun.png')),
      size: Vector2(64, 64),
      position: Vector2(64, 64),
    );

    player.anchor = Anchor.center;

    final buttonComponent = ButtonComponent(
      button: RectangleComponent(
        size: Vector2(185, 50),
        paint: Paint()
          ..color = Colors.orange
          ..style = PaintingStyle.stroke,
      ),
      buttonDown: RectangleComponent(
        size: Vector2(185, 50),
        paint: BasicPalette.magenta.paint(),
      ),
      position: Vector2(20, size.y - 280),
      onPressed: () => fire(player),
    );

    add(player);
    add(player.joystick);
    add(buttonComponent);
  }
}
