import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mh_base/common/util/image_util.dart';
import 'package:mh_base/log/mh_logger.dart';
import 'package:share_plus/share_plus.dart';

class ShareUtil {
  static Future<void> shareMemoryImage(BuildContext context,
      Uint8List imageData, {String? text, String? subject}) async {
    var res = await ImageUtil.saveBytes2localSafely(context, imageData);
    if (res.success && res.filePath != null) {
      var shareRes = await Share.shareXFiles([XFile(res.filePath!)],
          text: text, subject: subject);
      logD("share success response：${shareRes.raw}");
    } else {
      logD("share failed response");
    }
  }

  static Future<void> shareText(String content,{String? subject}) async{
    try {
      await Share.share(content, subject: subject);
    }catch(e){

    }
  }
}
