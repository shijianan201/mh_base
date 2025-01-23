import 'package:landlord_mtech/generated/json/base/json_field.dart';
import 'package:landlord_mtech/generated/json/id_card_recognize_resp_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class IdCardRecognizeRespEntity {
  late int code;
  String? message;
  int? duration;
  IdCardRecognizeRespResult? result;

  IdCardRecognizeRespEntity();

  factory IdCardRecognizeRespEntity.fromJson(Map<String, dynamic> json) =>
      $IdCardRecognizeRespEntityFromJson(json);

  Map<String, dynamic> toJson() => $IdCardRecognizeRespEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IdCardRecognizeRespResult {
  late String type;
  @JSONField(name: "rotated_image_width")
  late int rotatedImageWidth;
  @JSONField(name: "rotated_image_height")
  late int rotatedImageHeight;
  @JSONField(name: "image_angle")
  late int imageAngle;
  @JSONField(name: "item_list")
  late List<IdCardRecognizeRespResultItemList> itemList;

  IdCardRecognizeRespResult();

  factory IdCardRecognizeRespResult.fromJson(Map<String, dynamic> json) =>
      $IdCardRecognizeRespResultFromJson(json);

  Map<String, dynamic> toJson() => $IdCardRecognizeRespResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IdCardRecognizeRespResultItemList {
  late String value;
  late String description;
  late List<int> position;
  late String key;
  late double confidence;

  IdCardRecognizeRespResultItemList();

  factory IdCardRecognizeRespResultItemList.fromJson(
          Map<String, dynamic> json) =>
      $IdCardRecognizeRespResultItemListFromJson(json);

  Map<String, dynamic> toJson() =>
      $IdCardRecognizeRespResultItemListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
