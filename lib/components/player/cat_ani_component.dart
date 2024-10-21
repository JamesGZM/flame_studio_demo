

import 'dart:async';

import 'package:flame/components.dart';

class CatAniComponent extends SpriteAnimationComponent with HasGameRef {

  CatAniComponent()
      : super(
    size: Vector2.all(64),
    anchor: Anchor.center,
    scale: Vector2.all(1.5),
  );

  @override
  FutureOr<void> onLoad() {
  }
}