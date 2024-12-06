import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/game.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame> {
  // contionously spawn pips

  double pipeSpawntimer = 0;

  @override
  void update(double dt) {
    // TODO: implement update

    pipeSpawntimer += dt;
    double pipeinterval = 2;
    if (pipeSpawntimer > pipeinterval) {
      pipeSpawntimer = 0;
      spawnpipe();
    }
  }

  void spawnpipe() {
    double screenHeight = gameRef.size.y;
    double pipegap = 150;
    double minpipeheight = 50;
    double pipewidth = 60;
    // calculate the size of the pipe
    double maxpipeheight = screenHeight - 200 - pipegap - minpipeheight;
    //height of the bottom pipe randomly select between minpipeheight and maxpipeheight
    double bottompipeheight = minpipeheight + Random().nextDouble() * (maxpipeheight - minpipeheight);
    //height of the top pipe
    double toppipeheight = screenHeight - 200 - bottompipeheight - pipegap;

    //create bottom pipe
    final bottompipe = Pipe(
      Vector2(gameRef.size.x, screenHeight - 200 - bottompipeheight),
      Vector2(pipewidth, bottompipeheight),
      isToppipe: false,
    );

    // create top pipe
    final toppipe = Pipe(
     Vector2(gameRef.size.x, 0),
      Vector2(pipewidth, toppipeheight),
      isToppipe: true,
    );
    // add both pipe to game
    gameRef.add(bottompipe);
    gameRef.add(toppipe);
  }
}
