import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:top_down/game/game.dart';

import 'package:top_down/socket/socket.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscapeLeftOnly();

  final socket = GameSockets("ws://localhost:10000/ws");
  socket.init();
  print("Hi frm main");
  socket.send("Hello");
  runApp(StreamBuilder(
    stream: socket.channel.stream,
    builder: (context, snapshot) {
      print(snapshot);
      return GameWidget(
        game: TopDownGame(),
      );
    },
  ));
}
