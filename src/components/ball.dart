import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import '../brick_breaker.dart';
import '../config.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameRef<BrickBreakerGame> {
  Vector2 velocity = Vector2(ballSpeed, -ballSpeed);

  Ball() : super(anchor: Anchor.center) {
    add(CircleHitbox());
  }

  void resetVelocity() {
    velocity = Vector2(ballSpeed, -ballSpeed);
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += velocity * dt;

    final size = gameRef.size;

    if (position.x - radius <= 0 || position.x + radius >= size.x) {
      velocity.x = -velocity.x;
    }

    if (position.y - radius <= 0) {
      velocity.y = -velocity.y;
    } else if (position.y - radius >= size.y) {
      gameRef.resetBall();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    velocity.y = -velocity.y;
  }
}
