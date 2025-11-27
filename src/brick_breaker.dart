import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flame/collisions.dart';

import 'config.dart';
import 'components/components.dart';

class BrickBreakerGame extends FlameGame
    with HasCollisionDetection, HasDraggables {
  late Bat bat;
  late Ball ball;
  int score = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera.viewfinder.visibleGameSize = Vector2(480, 800);
    camera.viewfinder.position = camera.viewport.virtualSize / 2;

    add(PlayArea());

    bat = Bat()..position = Vector2(size.x / 2, size.y - batOffsetFromBottom);
    add(bat);

    ball = Ball()
      ..position = size / 2
      ..radius = ballRadius;
    add(ball);

    const double topOffset = 80;
    final double totalWidth = bricksPerRow * brickWidth;
    final double startX = (size.x - totalWidth) / 2 + brickWidth / 2;

    for (int row = 0; row < brickRows; row++) {
      for (int col = 0; col < bricksPerRow; col++) {
        final brick = Brick()
          ..position = Vector2(
            startX + col * brickWidth,
            topOffset + row * (brickHeight + 8),
          );
        add(brick);
      }
    }
  }

  void addScore(int value) {
    score += value;
  }

  void resetBall() {
    ball
      ..position = size / 2
      ..resetVelocity();
  }

  @override
  Color backgroundColor() => const Color(0xFF000000);
}
