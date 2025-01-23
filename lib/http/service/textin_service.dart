import 'dart:io';

import 'package:dio/dio.dart';
import '../error/api_error_code.dart';
import '../error/http_error.dart';
import '../http_result.dart';
import 'http_service.dart';

enum IdCardItemKeyType {
  name,
  date_of_birth,
  sex,
  date_of_issue,
  id,
  father,
  mother,
  spouse,
  grade_of_military,
  place_of_birth,
  address,
  number
}

enum IdCardRecognizeType { taiwan_idcard_front, taiwan_idcard_back, other }

class TwIDCardRecognizeResult {
  bool isFront;
  late String? id;
  late String? name;
  late String? sex;
  late String? birthDay;
  late String? address;

  TwIDCardRecognizeResult(
    this.isFront,
  );

  @override
  String toString() {
    return 'TwIDCardRecognizeResult{isFront: $isFront, id: $id, name: $name, sex: $sex, birthDay: $birthDay, address: $address}';
  }
}

class TextInService extends HttpService {
  String appId = "aa643d292412a9b8a45e182a52091d54";
  String secretCode = "3abeb3024b831a291b4d1e123d89a012";

  TextInService({required super.dio});

  Future<HttpResult<TwIDCardRecognizeResult>> recognizeTwIDCard(
      String imagePath) async {
    try {
      var compressFilePath =
          await ImageUtil.compress(imagePath, Environment.maxImageUploadSize);
      File file = File(compressFilePath ?? imagePath);
      var data = await file.readAsBytes();
      Stream<List<int>> stream = MultipartFile.fromBytes(data).finalize();
      var res = await request("/ai/service/v1/taiwan_idcard",
          data: stream,
          options: Options(
              method: "POST",
              sendTimeout: Duration(minutes: 1),
              receiveTimeout: Duration(minutes: 1),
              headers: {
                "connection": "Keep-Alive",
                "Content-Type": "application/octet-stream",
                "x-ti-app-id": appId,
                "x-ti-secret-code": secretCode,
                "content-length": data.length
              },
              contentType: "application/octet-stream",
              responseType: ResponseType.json));
      var resp = IdCardRecognizeRespEntity.fromJson(res);
      resp.toString().logD();
      var detail = resp.result;
      var type = detail?.type;
      var itemList = detail?.itemList ?? [];
      if (resp.code == TextInApiErrorCode.success && itemList.isNotEmpty) {
        //成功
        var isFront = type == null ||
            type != IdCardRecognizeType.taiwan_idcard_back.name; //默認是前
        TwIDCardRecognizeResult result = TwIDCardRecognizeResult(isFront);
        for (var element in itemList) {
          if (element.key == IdCardItemKeyType.name.name) {
            if (element.confidence >= 0.9) {
              result.name = element.value;
            }
          } else if (element.key == IdCardItemKeyType.id.name) {
            if (element.confidence >= 0.9) {
              result.id = element.value;
            }
          } else if (element.key == IdCardItemKeyType.date_of_birth.name) {
            if (element.confidence >= 0.9) {
              result.birthDay = element.value;
            }
          } else if (element.key == IdCardItemKeyType.sex.name) {
            if (element.confidence >= 0.9) {
              result.sex = element.value;
            }
          } else if (element.key == IdCardItemKeyType.address.name) {
            if (element.confidence >= 0.9) {
              result.address = element.value;
            }
          }
        }
        if (isFront) {
          if (TextUtil.isNullOrEmpty(result.name) ||
              TextUtil.isNullOrEmpty(result.id) ||
              TextUtil.isNullOrEmpty(result.sex) ||
              TextUtil.isNullOrEmpty(result.birthDay)) {
            return HttpResult.getError(
                error: TextInApiError(resp.code, resp.message));
          }
        } else {
          if (TextUtil.isNullOrEmpty(result.address)) {
            return HttpResult.getError(
                error: TextInApiError(resp.code, resp.message));
          }
        }
        return HttpResult.getSuccess<TwIDCardRecognizeResult>(result);
      } else {
        //失敗
        return HttpResult.getError(
            error: TextInApiError(resp.code, resp.message));
      }
    } catch (e) {
      return HttpResult.getError(error: e);
    }
  }
}
