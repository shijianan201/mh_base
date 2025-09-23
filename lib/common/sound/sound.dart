import 'dart:async';
import 'dart:collection';
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

  static final HashMap<String, String> _downloadAudioCache = HashMap();

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

  Future<String> getRecorderDownloadPath() async {
    Directory directory = await getTemporaryDirectory();
    return "${directory.path}/download/";
  }

  Future<void> startRecorder(BuildContext context,
      {int maxLen = maxLength,Function(int)? onTickerCallback, Function(String?)? autoCloseCallback}) async {
    String fileName = "${DateTime.now().millisecondsSinceEpoch}.wav";
    String filePath = "${await getRecorderDirectoryPath()}$fileName";
    var file = File(filePath);
    if (file.existsSync()) {
      await file.delete(recursive: true);
    }
    file.createSync(recursive: true, exclusive: true);
    var res = await iRecorder.start(filePath, maxLen,onTickerCallback, autoCloseCallback);
    if (res) {
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
  StreamSubscription<Duration>? durationSubs;

  Future<void> play(String path,
      {ValueChanged<Duration>? onDurationChanged,
      ValueChanged<Duration>? onPositionChanged}) async {
    Completer<void> completer = Completer();
    playStreamSubs?.cancel();
    playStreamSubs = audioPlayer.onPlayerComplete.listen((v) {
      completer.complete();
      playDurationSubs?.cancel();
      playStreamSubs?.cancel();
      durationSubs?.cancel();
    });
    playDurationSubs?.cancel();
    playDurationSubs = audioPlayer.onPositionChanged.listen((d) {
      onPositionChanged?.call(d);
    });
    durationSubs?.cancel();
    durationSubs = audioPlayer.onDurationChanged.listen((a) {
      onDurationChanged?.call(a);
    });
    Future<void> playLocal(String filePath) async {
      var fileExist = await File(filePath).exists();
      if (fileExist) {
        await audioPlayer
            .play(DeviceFileSource(filePath, mimeType: "audio/wav"));
      } else {
        completer.completeError(AssertionError());
      }
    }

    await stopPlayer();
    if (Platform.isAndroid) {
      if (path.startsWith("http://") || path.startsWith("https://")) {
        await audioPlayer.play(UrlSource(path, mimeType: "audio/wav"));
      } else {
        var fileExist = await File(path).exists();
        if (fileExist) {
          await audioPlayer.play(DeviceFileSource(path, mimeType: "audio/wav"));
        } else {
          completer.completeError(AssertionError());
        }
      }
    } else if (Platform.isIOS) {
      if (path.startsWith("http://") || path.startsWith("https://")) {
        var cachedPath = _downloadAudioCache[path];
        if (cachedPath == null) {
          var serverName = path.split("/").last;
          var savePath = "${await getRecorderDownloadPath()}$serverName";
          var fileExist = await File(savePath).exists();
          if (fileExist) {
            await audioPlayer
                .play(DeviceFileSource(savePath, mimeType: "audio/wav"));
          } else {
            await Dio().download(path, savePath);
            _downloadAudioCache[path] = savePath;
            await playLocal(savePath);
          }
        } else {
          await playLocal(cachedPath);
        }
      } else {
        await playLocal(path);
      }
    } else {
      completer.completeError(UnsupportedError("unsupport platform"));
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
      playDurationSubs?.cancel();
      playStreamSubs?.cancel();
      durationSubs?.cancel();
      await iRecorder.dispose();
      await audioPlayer.dispose();
    } catch (e) {}
  }
}
