import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';

class FlappyBirdGame extends FlameGame with TapDetector {
  late Bird bird;
  late Background background;
  @override
  FutureOr<void> onLoad() {
    //load background
    background = Background(size);
    add(background);
    // load bird
    bird = Bird();
    add(bird);
  }

  @override
  void onTap() {
    // TODO: implement onTap
    bird.flap();
  }
}
