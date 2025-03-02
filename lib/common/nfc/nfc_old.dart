import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mh_base/common/util/run_util.dart';
import 'package:mh_base/log/mh_logger.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';

class NfcOld {
  NfcOld._internal();

  static final NfcOld _instance = NfcOld._internal();

  factory NfcOld() => _instance;

  static NfcOld get instance => _instance;

  bool _listening = false;

  Future<bool> isAvailable() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      return isAvailable;
    } catch (e) {
      return false;
    }
  }

  Future<String?> startSession({
    Duration timeout = const Duration(seconds: 30),
    String? startAlertMessageIOS,
    String? stopAlertMessageIOS,
    String? stopErrorMessageIOS,
  }) async {
    if (_listening) {
      return null;
    }
    var a = await isAvailable();
    if (!a) {
      return null;
    }
    _listening = true;
    Completer<String?> completer = Completer();
    try {
      await NfcManager.instance.startSession(
          pollingOptions: {
            NfcPollingOption.iso14443,
            NfcPollingOption.iso15693,
            NfcPollingOption.iso18092,
          },
          onDiscovered: (NfcTag tag) async {
            await stopSession();
            var data = tag.data;
            var id = _getIdentifierFromTag(tag);
            logD("NFC scan result: $id ${jsonEncode(data)}");
            if (!completer.isCompleted) {
              completer.complete(id);
            }
          },
          alertMessage: startAlertMessageIOS,
          onError: (error) async {
            logD("NFC scan failed: ${error.type} ${error.message}");
            if (_listening && !completer.isCompleted) {
              completer.completeError(error);
            }
          });
      Future.delayed(timeout, () async {
        if (_listening) {
          await stopSession(
              alertMessageIOS: stopAlertMessageIOS,
              errorMessageIOS: stopErrorMessageIOS);
          if (!completer.isCompleted) {
            completer.completeError(TimeoutException("NFC session timeout"));
          }
        }
      });
    } catch (e) {
      _listening = false;
      if (!completer.isCompleted) {
        completer.completeError(e);
      }
    }
    return await completer.future;
  }

  // Future<String?> _decodeTag(NfcTag tag) async {
  //   Uint8List? id;
  //   if (Platform.isAndroid) {
  //     var ndef = Ndef.from(tag);
  //     if (ndef != null) {
  //       var additional = ndef.additionalData;
  //       var additionalId = additional["identifier"];
  //       var records = ndef.cachedMessage?.records;
  //       if (records != null) {
  //         for (var e in records) {
  //           id = e.identifier;
  //           if (e.identifier.isNotEmpty) {
  //             break;
  //           }
  //         }
  //       }
  //       if (id == null || id.isEmpty) {
  //         if (additionalId is Uint8List) {
  //           id = additionalId;
  //         }
  //       }
  //     }
  //     id = NfcA.from(tag)?.identifier;
  //     id ??= NfcB.from(tag)?.identifier;
  //     id ??= NfcF.from(tag)?.identifier;
  //     id ??= NfcV.from(tag)?.identifier;
  //     id ??= IsoDep.from(tag)?.identifier;
  //     id ??= MifareClassic.from(tag)?.identifier;
  //     id ??= MifareUltralight.from(tag)?.identifier;
  //     id ??= NdefFormatable.from(tag)?.identifier;
  //   } else if (Platform.isIOS) {
  //     var felica =  FeliCa.from(tag);
  //     if(felica != null){
  //       felica?.
  //     }else{
  //       id ??= Iso7816.from(tag)?.identifier;
  //       id ??= Iso15693.from(tag)?.identifier;
  //       id ??= MiFare.from(tag)?.identifier;
  //     }
  //   }
  //   String? nfcIdText =
  //       id?.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
  //   if (nfcIdText == null || nfcIdText.isEmpty) {
  //     nfcIdText = null;
  //   }
  //   return nfcIdText;
  // }

  Future<void> stopSession({
    String? alertMessageIOS,
    String? errorMessageIOS,
  }) async {
    var a = await isAvailable();
    if (!a) {
      return;
    }
    try {
      await NfcManager.instance.stopSession(
          alertMessage: alertMessageIOS, errorMessage: errorMessageIOS);
    } catch (e) {
      logD("nfc stop failed $e");
    }
    _listening = false;
  }

  // 从NFC标签中提取identifier
  String? _getIdentifierFromTag(NfcTag tag) {
    // 打印完整标签数据以便调试
    print('完整标签数据: ${tag.data}');

    // 尝试从不同类型的标签中获取identifier

    // 1. 尝试从NFC-A标签获取
    if (tag.data.containsKey('nfca')) {
      final nfcaData = tag.data['nfca'];
      if (nfcaData.containsKey('identifier')) {
        return _formatIdentifier(nfcaData['identifier']);
      }
    }

    // 2. 尝试从MIFARE标签获取
    if (tag.data.containsKey('mifare')) {
      final mifareData = tag.data['mifare'];
      if (mifareData.containsKey('identifier')) {
        return _formatIdentifier(mifareData['identifier']);
      }
    }

    // 3. 尝试从MIFARE Ultralight标签获取
    if (tag.data.containsKey('mifareultralight')) {
      final mifareUlData = tag.data['mifareultralight'];
      if (mifareUlData.containsKey('identifier')) {
        return _formatIdentifier(mifareUlData['identifier']);
      }
    }

    // 4. 尝试从NFC-B标签获取
    if (tag.data.containsKey('nfcb')) {
      final nfcbData = tag.data['nfcb'];
      if (nfcbData.containsKey('identifier')) {
        return _formatIdentifier(nfcbData['identifier']);
      }
    }

    // 5. 尝试从NFC-F标签获取
    if (tag.data.containsKey('nfcf')) {
      final nfcfData = tag.data['nfcf'];
      if (nfcfData.containsKey('identifier')) {
        return _formatIdentifier(nfcfData['identifier']);
      }
    }

    // 6. 尝试从NFC-V标签获取
    if (tag.data.containsKey('nfcv')) {
      final nfcvData = tag.data['nfcv'];
      if (nfcvData.containsKey('identifier')) {
        return _formatIdentifier(nfcvData['identifier']);
      }
    }

    // 7. 尝试从ISO-DEP标签获取
    if (tag.data.containsKey('isodep')) {
      final isodepData = tag.data['isodep'];
      if (isodepData.containsKey('identifier')) {
        return _formatIdentifier(isodepData['identifier']);
      }
      // 有些ISO-DEP标签可能使用historicalBytes作为标识符
      if (isodepData.containsKey('historicalBytes')) {
        return _formatIdentifier(isodepData['historicalBytes']);
      }
    }

    return null;
  }

  // 将字节数组格式化为十六进制字符串
  String _formatIdentifier(Uint8List bytes) {
    return bytes
        .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
        .join('')
        .toUpperCase();
  }

}
