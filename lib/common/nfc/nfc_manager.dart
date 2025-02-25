
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class NfcManager{
  NfcManager._internal();
  static final NfcManager _instance = NfcManager._internal();
  factory NfcManager() => _instance;
  static NfcManager get instance => _instance;

  StreamSubscription<NFCTag>? stream;
  bool _listening = false;

  Future<bool> isAvailable() async {
    try {
      return (await FlutterNfcKit.nfcAvailability) == NFCAvailability.available;
    }catch(e){
      return false;
    }
  }

  int _count = 1;

  Future<void> startSession(ValueChanged<String> onTagChange) async {
    if(_listening){
      return;
    }
    _count++;
    var a = await isAvailable();
    if(!a){
      await Future.delayed(Duration(seconds: 10));
      onTagChange("01931939139139$_count");
      return;
    }
    _listening = true;
    stream?.cancel();
    stream = FlutterNfcKit.tagStream.listen((tag){
      onTagChange(tag.id);
    });
    await Future.delayed(Duration(seconds: 10));
    onTagChange("01931939139139$_count");
  }

  Future<void> stopSession() async {
    var a = await isAvailable();
    if(!a){
      return;
    }
    stream?.cancel();
    _listening = false;
  }
}