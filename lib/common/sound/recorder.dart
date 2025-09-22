import 'dart:async';
import 'dart:io';

import 'package:record/record.dart';

abstract class IRecorder {
  Future<void> init();

  Future<bool> start(String filePath, int durationSeconds,
      Function(String?)? autoCloseCallback);

  Future<String?> stop();

  Future<void> cancel();

  Future<void> dispose();
}

// class SoundRecorder extends IRecorder {
//   FlutterSoundRecorder flutterSoundRecorder = FlutterSoundRecorder();
//   StreamSubscription<RecordingDisposition>? recorderSubscription;
//   String? filePath;
//
//   @override
//   Future<void> init() async {
//     await flutterSoundRecorder.openRecorder();
//     await flutterSoundRecorder.setSubscriptionDuration(Duration(seconds: 1));
//   }
//
//   @override
//   Future<void> start(String filePath, int durationSeconds,
//       Function(String?)? autoCloseCallback) async {
//     if (flutterSoundRecorder.isRecording) {
//       await flutterSoundRecorder.stopRecorder();
//       recorderSubscription?.cancel();
//     }
//     try {
//       await flutterSoundRecorder.startRecorder(
//           codec: Codec.pcm16WAV,
//           sampleRate: 16000,
//           toFile: filePath,
//           bitRate: 128,
//           numChannels: 1);
//       this.filePath = filePath;
//       recorderSubscription = flutterSoundRecorder.onProgress?.listen((a) async {
//         var duration = a.duration.inSeconds;
//         if (duration >= durationSeconds) {
//           await stop();
//           autoCloseCallback?.call(filePath);
//         }
//       });
//     } catch (e) {
//     }
//   }
//
//   @override
//   Future<String?> stop() async {
//     if (flutterSoundRecorder.isRecording) {
//       await flutterSoundRecorder.stopRecorder();
//     }
//     return filePath;
//   }
//
//   @override
//   Future<void> dispose() async {
//     filePath = null;
//     recorderSubscription?.cancel();
//     await flutterSoundRecorder.closeRecorder();
//   }
//
//   @override
//   Future<void> cancel() async {
//     filePath = null;
//     recorderSubscription?.cancel();
//     await flutterSoundRecorder.stopRecorder();
//     if (filePath != null) {
//       File(filePath!).deleteSync(recursive: true);
//     }
//   }
// }

class RecordRecorder extends IRecorder {
  final record = AudioRecorder();
  Timer? timer;
  String? filePath;

  @override
  Future<void> dispose() async {
    record.dispose();
  }

  @override
  Future<void> init() async {}

  @override
  Future<bool> start(String filePath, int durationSeconds,
      Function(String? p1)? autoCloseCallback) async {
    if(await record.hasPermission()){
      if (await record.isRecording()) {
        record.cancel();
      }
      this.filePath = filePath;
      timer?.cancel();
      timer = Timer(Duration(seconds: durationSeconds), () async {
        await stop();
        autoCloseCallback?.call(filePath);
      });
      try {
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
      }catch(e){
        return false;
      }
    }else{
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
    if (filePath != null) {
      File(filePath!).deleteSync(recursive: true);
    }
  }
}
