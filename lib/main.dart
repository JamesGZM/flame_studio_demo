
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';

import 'cat_component.dart';

void main() async {
  await initializeFlame();
  runApp(GameWidget(
    backgroundBuilder: (BuildContext context) {
      return Container(color: Colors.green);
    },
    game: StudioGame(),
  ));
}

initializeFlame() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 设置屏幕方向(设置屏幕方向为横向)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // 禁止所有UI层(设置全屏)
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class StudioGame extends FlameGame {

  late final JoystickComponent joystick;

  @override
  Future<void> onLoad() async {
    final knobPaint = BasicPalette.white.withAlpha(150).paint();
    final backgroundPaint = BasicPalette.white.withAlpha(300).paint();
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 20, paint: knobPaint),
      background: CircleComponent(radius: 60, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 60, bottom: 40),
    );
    add(joystick);
    await add(CatComponent());
  }
}
