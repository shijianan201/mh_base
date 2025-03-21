import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mh_base/common/sound/recorder.dart';
import 'package:mh_base/widget/mh_toast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Sound {
  static const int maxLength = 5;
  AudioPlayer audioPlayer = AudioPlayer();
  IRecorder iRecorder = RecordRecorder();
  static Dio dio = Dio();

  String? filePath;

  Sound() {
    init();
  }

  void init() async {
    await iRecorder.init();
  }

  Future<String> getRecorderDirectoryPath() async {
    Directory directory = await getTemporaryDirectory();
    return "${directory.path}/audio/";
  }

  Future<bool> checkRecordPermission() async {
    var permission = await Permission.microphone.status;
    if (permission == PermissionStatus.granted) {
      return true;
    } else {
      return await Permission.microphone.request() == PermissionStatus.granted;
    }
  }

  Future<void> startRecorder(BuildContext context,
      {int maxLen = maxLength, Function(String?)? autoCloseCallback}) async {
    String fileName = "${DateTime.now().millisecondsSinceEpoch}.wav";
    String filePath = "${await getRecorderDirectoryPath()}$fileName";
    if (await checkRecordPermission()) {
      var file = File(filePath);
      if (file.existsSync()) {
        await file.delete(recursive: true);
      }
      file.createSync(recursive: true, exclusive: true);
      await iRecorder.start(filePath, maxLen, autoCloseCallback);
      this.filePath = filePath;
    } else {
      await openAppSettings();
    }
  }

  Future<void> cancelRecorder() async {
    try {
      await iRecorder.cancel();
      filePath = null;
    } catch (e) {}
  }

  Future<String?> stopRecorder() async {
    return await iRecorder.stop();
  }

  void playCurrent() async {
    if (filePath == null || filePath!.isEmpty) {
      return;
    }
    await play(filePath!);
  }

  StreamSubscription<void>? playStreamSubs;
  StreamSubscription<void>? playDurationSubs;

  Future<void> play(String path,
      {ValueChanged<Duration>? onPositionChanged}) async {
    Completer<void> completer = Completer();
    playStreamSubs?.cancel();
    playStreamSubs = audioPlayer.onPlayerComplete.listen((v) {
      completer.complete();
      playDurationSubs?.cancel();
      playStreamSubs?.cancel();
    });
    playDurationSubs?.cancel();
    playDurationSubs = audioPlayer.onPositionChanged.listen((d) {
      onPositionChanged?.call(d);
    });
    try {
      await stopPlayer();
      if (path.startsWith("http")) {
        await audioPlayer.play(UrlSource(path));
      } else {
        var fileExist = await File(path).exists();
        if (fileExist) {
          await audioPlayer.play(DeviceFileSource(path));
        } else {
          "播放失敗".toast();
        }
      }
    } catch (e) {
      "播放失敗".toast();
      completer.complete();
    }
    return await completer.future;
  }

  Future<void> stopPlayer() async {
    try {
      await audioPlayer.stop();
    } catch (e) {}
  }

  void dispose() async {
    try {
      await iRecorder.dispose();
      await audioPlayer.dispose();
    } catch (e) {}
  }
}
