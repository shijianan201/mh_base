import 'dart:async';
import 'dart:io';
import 'package:record/record.dart';

abstract class IRecorder {
  Future<void> init();

  Future<bool> start(String filePath, int durationSeconds,
      Function(int)? onTickerCallback, Function(String?)? autoCloseCallback);

  Future<String?> stop();

  Future<void> cancel();

  Future<void> dispose();
}

class RecordRecorder extends IRecorder {
  final record = AudioRecorder();
  Timer? timer;
  String? filePath;
  int timeCount = 0;

  @override
  Future<void> dispose() async {
    record.dispose();
    timer?.cancel();
    timeCount = 0;
  }

  @override
  Future<void> init() async {}

  @override
  Future<bool> start(
      String filePath,
      int durationSeconds,
      Function(int)? onTickerCallback,
      Function(String? p1)? autoCloseCallback) async {
    if (await record.hasPermission()) {
      if (await record.isRecording()) {
        record.cancel();
      }
      this.filePath = filePath;
      try {
        timeCount = 0;
        timer?.cancel();
        ///0 1 2 3 4 5
        timer = Timer.periodic(Duration(seconds: 1), (a) async {
          if (timeCount >= durationSeconds) {
            await stop();
            autoCloseCallback?.call(filePath);
          } else {
            timeCount++;
            onTickerCallback?.call(timeCount);
          }
        });
        await record.start(
            const RecordConfig(
                encoder: AudioEncoder.wav,
                bitRate: 128,
                sampleRate: 16000,
                numChannels: 1,
                autoGain: true,
                noiseSuppress: true,
                echoCancel: true),
            path: filePath);
        return true;
      } catch (e) {
        timer?.cancel();
        timeCount = 0;
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Future<String?> stop() async {
    if (await record.isRecording()) {
      return await record.stop();
    }
    return filePath;
  }

  @override
  Future<void> cancel() async {
    await record.cancel();
    if (filePath != null && File(filePath!).existsSync()) {
      File(filePath!).deleteSync(recursive: true);
    }
    timer?.cancel();
    timeCount = 0;
  }
}
