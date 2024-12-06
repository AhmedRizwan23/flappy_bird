import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/groud.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/components/pipe_manager.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late Background background;
  late Ground ground;
  late PipeManager pipeManager;

  @override
  Future<void> onLoad() async {
    // Load background
    background = Background(size);
    add(background);

    // Load bird
    bird = Bird();
    add(bird);

    // Load ground
    ground = Ground();
    add(ground);

    // Load pipes
    pipeManager = PipeManager();
    add(pipeManager);
  }

  @override
  void onTap() {
    bird.flap(); // Make the bird jump
  }

  // Game Over
  bool isgameover = false;

  void gameover() {
    if (isgameover) return;
    isgameover = true;
    pauseEngine();

    // Show dialog box for the user
    showDialog(
      barrierDismissible: false, // Prevent dismissal by tapping outside
      context: buildContext!, // Ensure this is set in the parent widget
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              resetgame(); // Restart the game
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }

  // Reset Game
  void resetgame() {
    // Reset bird
    bird.position = Vector2(birdStartx, birdStarty);
    bird.velocity = 0;

    //reset pipe
    children.whereType<Pipe>().forEach((Pipe pipe) => pipe.removeFromParent());

    isgameover = false;
    resumeEngine(); // Resume the game engine
  }
}
