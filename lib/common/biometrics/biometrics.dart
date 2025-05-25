import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Biometrics {
  static final LocalAuthentication auth = LocalAuthentication();

  static Future<bool> authByBiometrics() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: const AuthenticationOptions(
              useErrorDialogs: false, biometricOnly: true));
      return didAuthenticate;
    } on PlatformException catch (e) {
      return false;
    }
  }
}
