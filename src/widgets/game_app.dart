import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../brick_breaker.dart';
import 'overlay_screen.dart';

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    final game = BrickBreakerGame();

    return MaterialApp(
      title: 'Brick Breaker',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: GameWidget<BrickBreakerGame>(
          game: game,
          overlayBuilderMap: {
            OverlayScreen.id: (context, game) =>
                OverlayScreen(game: game as BrickBreakerGame),
          },
        ),
      ),
    );
  }
}
