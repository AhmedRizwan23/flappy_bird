import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/game.dart';

class Pipe extends SpriteComponent with CollisionCallbacks, HasGameRef<FlappyBirdGame> {
  final bool isToppipe;
  //init
  Pipe(Vector2 position, Vector2 size, {required this.isToppipe}) : super(position: position, size: size);

//load
  @override
  FutureOr<void> onLoad() async {
    // TODO: implement onLoad
    sprite = await Sprite.load(isToppipe ? "top_pipe_game.png" : "bottom_pipe_game.png");
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    // TODO: implement update
    //scroll pipe to left
    position.x -= 100 * dt;

    //remove pipe if it goes off screen
    if (position.x + size.x <= 0) {
      removeFromParent();
    }
  }
}
