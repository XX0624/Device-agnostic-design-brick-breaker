import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import '../config.dart';
import '../brick_breaker.dart';

class Brick extends RectangleComponent
    with CollisionCallbacks, HasGameRef<BrickBreakerGame> {
  Brick()
      : super(
          size: Vector2(brickWidth, brickHeight),
          anchor: Anchor.center,
        ) {
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is CircleComponent) {
      gameRef.addScore(10);
      removeFromParent();
    }
  }
}
