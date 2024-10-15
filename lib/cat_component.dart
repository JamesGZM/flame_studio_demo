import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class CatComponent extends SpriteAnimationComponent  with HasGameRef{
  CatComponent()
      : super(
          size: Vector2.all(64),
          anchor: Anchor.center,
          scale: Vector2.all(2.0),
        );

  @override
  FutureOr<void> onLoad() async {
    // Load the GIF as an image
    final image = await Flame.images.load('cat_addon_energyforcemaster/cat2_base.png');

    // Create the sprite sheet
    final spriteSheet = SpriteSheet(
      image: image,
      srcSize: Vector2.all(64), // Adjust the frame size as needed
    );

    animation = spriteSheet.createAnimation(row: 0, to: 12, stepTime: 0.12);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    position = size / 2;
  }
}
