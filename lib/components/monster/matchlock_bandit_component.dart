import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame_studio_demo/gen/assets.gen.dart';

/// 怪物-火铳盗贼组件
class MatchlockBanditComponent extends SpriteAnimationComponent
    with HasGameRef {
  MatchlockBanditComponent()
      : super(
          size: Vector2(92, 32),
          anchor: Anchor.center,
          scale: Vector2.all(1.5),
        );

  @override
  FutureOr<void> onLoad() async {
    final image = await Flame.images.load(Assets.images.monster.strawhatBandits.matchlockBandit.matchlockBanditRun.keyName);

    // Create the sprite sheet
    final spriteSheet = SpriteSheet(
      image: image,
      srcSize: Vector2(92, 32), // Adjust the frame size as needed
    );

    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.1, loop: true);

    // 翻转
    scale.x = -1.5;

    //屏幕右侧
    position = Vector2(gameRef.size.x - size.x / 2, gameRef.size.y / 2);
    // Add a hitbox for collision detection
    //add(RectangleHitbox()..debugMode = true);
  }

  @override
  update(double dt) {
    super.update(dt);
    // Move the component
    position.x += scale.x * 50 * dt;

    // Check if the component has reached the left or right edge of the screen
    if (position.x <= size.x / 2) {
      // Reached the left edge, flip to move right
      scale.x = 1.5;
    } else if (position.x >= gameRef.size.x - size.x / 2) {
      // Reached the right edge, flip to move left
      scale.x = -1.5;
    }
  }
}
