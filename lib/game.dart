import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/groud.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flutter/material.dart';

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

    //show dialog box for user
    showDialog(
      context: buildContext!,
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                resetgame();
              },
              child: const Text("Restart"))
        ],
      ),
    );
  }

  void resetgame() {
    bird.position = Vector2(birdStartx, birdStarty);
    bird.velocity = 0;
    isgameover = false;
    resumeEngine();
  }
}
