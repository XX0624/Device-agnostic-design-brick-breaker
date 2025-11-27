import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame/events.dart';

import '../config.dart';

class Bat extends RectangleComponent with CollisionCallbacks, DragCallbacks {
  Bat() : super(size: Vector2(batWidth, batHeight), anchor: Anchor.center) {
    add(RectangleHitbox());
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position += Vector2(event.localDelta.x, 0);
  }
}
