import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';

class Bird extends SpriteComponent {
  Bird() : super(position: Vector2(birdStartx,birdStarty), size: Vector2(birdwidth, birdheight));
  double velocity = 0;


  @override
  FutureOr<void> onLoad() async {
    // TODO: implement onLoad

    sprite = await Sprite.load("bird_game.png");
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
}
