import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/groud.dart';
import 'package:flappy_bird/components/pipe.dart';

import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
  Bird() : super(position: Vector2(birdStartx, birdStarty), size: Vector2(birdwidth, birdheight));
  double velocity = 0;

  @override
  FutureOr<void> onLoad() async {
    // TODO: implement onLoad

    sprite = await Sprite.load("bird_game.png");

    // add hitbox
    add(RectangleHitbox());
  }

  void flap() {
    velocity = jumpstrength;
  }

  @override
  void update(double dt) {
    // TODO: implement update
    velocity += gravity * dt;

    position.y += velocity * dt;
  }

  // collides with other objects
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    //if bird collides with ground
    if (other is Ground) {
      (parent as FlappyBirdGame).gameover();
    }

    //if bird collides with pipe
    if (other is Pipe) {
      (parent as FlappyBirdGame).gameover();
    }
  }
}
