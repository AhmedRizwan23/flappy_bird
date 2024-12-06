import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/game.dart';

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame>,CollisionCallbacks {
  Ground() : super();

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(2 * gameRef.size.x, 200);
    position = Vector2(0, gameRef.size.y - 200);
    sprite = await Sprite.load("ground_game.png");
    //add a collison box
    add(RectangleHitbox());
  }

  //scrolling effect
  @override
  void update(double dt) {
    // TODO: implement update
    position.x = position.x - 100 * dt;

    //reset round if it goes off screen
    if (position.x + size.x / 2 <= 0) {
      position.x = 0;
    }
  }
}
