import 'package:image_picker/image_picker.dart';
import 'package:mh_base/log/mh_logger.dart';

enum MhImagePickerMode {
  gallery,
  camera,
  both,
}

class MhImagePickerConfig {
  final MhImagePickerMode mode;
  final int count;

  MhImagePickerConfig({this.mode = MhImagePickerMode.both, this.count = 1});
}

class MhImagePicker {
  final ImagePicker imagePicker = ImagePicker();
  bool isPicking = false;
  MhImagePicker._internal();
  static final MhImagePicker _instance = MhImagePicker._internal();
  factory MhImagePicker() => _instance;
  static MhImagePicker get instance => _instance;

  Future<List<XFile>> select(MhImagePickerConfig config) async {
    List<XFile> files = [];
    if (isPicking) {
      return files;
    }
    isPicking = true;
    try {
      if (config.mode == MhImagePickerMode.gallery) {
        if (config.count <= 1) {
          var file = await imagePicker.pickImage(
            source: ImageSource.gallery,
          );
          if (file != null) {
            files.add(file);
          }
        } else {
          var file = await imagePicker.pickMultiImage();
          files.addAll(file);
        }
      } else if (config.mode == MhImagePickerMode.camera) {
        if (config.count <= 1) {
          var file = await imagePicker.pickImage(
            source: ImageSource.camera,
          );
          if (file != null) {
            files.add(file);
          }
        } else {
          var file = await imagePicker.pickMultiImage();
          files.addAll(file);
        }
      } else {
        if (config.count <= 1) {
          var file = await imagePicker.pickMedia();
          if (file != null) {
            files.add(file);
          }
        } else {
          var file = await imagePicker.pickMultipleMedia();
          files.addAll(file);
        }
      }
    } catch (e) {
      logE("pick image failed $e", error: e);
    } finally {
      isPicking = false;
    }
    return files;
  }
}
