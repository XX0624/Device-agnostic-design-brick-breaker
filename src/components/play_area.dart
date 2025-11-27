import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class PlayArea extends RectangleComponent with CollisionCallbacks {
  PlayArea() : super(size: Vector2.zero(), anchor: Anchor.topLeft) {
    add(RectangleHitbox());
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    size = gameSize;
  }
}
