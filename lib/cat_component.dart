import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame_ext/flame_ext.dart';
import 'package:flame_studio_demo/gen/assets.gen.dart';

class CatComponent extends SpriteAnimationComponent with HasGameRef {
  CatComponent()
      : super(
          size: Vector2.all(64),
          anchor: Anchor.center,
          scale: Vector2.all(1.5),
        );

  @override
  FutureOr<void> onLoad() async {
    // Load the GIF as an image
    final image = await Flame.images.load(Assets.images.player.cat.catAni.spriteBaseAddon.keyName);

    // Create the sprite sheet
    final spriteSheet = SpriteSheet(
      image: image,
      srcSize: Vector2.all(64), // Adjust the frame size as needed
    );

    List<Sprite> sprites = spriteSheet.getRowSprites(row: 1, count: 8);

    animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 0.12,
      loop: true,
    );
    // Set the initial position to the center of the screen
    position = gameRef.size / 2;
    // Add a hitbox for collision detection
    //add(RectangleHitbox()..debugMode = true);
  }

  double speed = 200.0; // Pixels/ 秒

  void move(double dt, Vector2 relativeDelta) {
    Vector2 ds = relativeDelta * speed * dt;
    position.add(ds);
  }

  void updateDirection(Vector2 delta) {
    if (delta.x > 0) {
      // 向右移动
      scale.x = 1.5;
    } else if (delta.x < 0) {
      // 向左移动
      scale.x = -1.5;
    }
  }
}

enum CatAction {
  idle,
  walk,
  run,
  jump,
  attack,
  hurt,
  die,
}
