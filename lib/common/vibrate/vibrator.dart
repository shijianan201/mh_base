

import 'package:vibration/vibration.dart';

class Vibrator{

  static Future<bool> hasVibrator() async {
    return await Vibration.hasVibrator();
  }

  static void vibrate() async {
    if(await hasVibrator()){
      await Vibration.vibrate();
    }
  }

}