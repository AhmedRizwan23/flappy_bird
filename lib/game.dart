import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/groud.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late Background background;
  late Ground ground;
  @override
  FutureOr<void> onLoad() {
    //load background
    background = Background(size);
    add(background);
    // load bird
    bird = Bird();
    add(bird);
    // load ground
    ground = Ground();
    add(ground);
  }

  @override
  void onTap() {
    // TODO: implement onTap
    bird.flap();
  }

  //game over
  bool isgameover = false;
  void gameover() {
    if (isgameover) return;
    isgameover = true;
    pauseEngine();
  }
}
