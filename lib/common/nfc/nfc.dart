/*
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mh_base/common/util/run_util.dart';
import 'package:mh_base/log/mh_logger.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/nfc_manager_android.dart';
import 'package:nfc_manager/nfc_manager_ios.dart';

enum NfcTagType {
  ndef,
  // iOS 支持的类型
  feliCa(iosOnly: true),
  iso7816(iosOnly: true),
  iso15693(iosOnly: true),
  mifare(iosOnly: true),
  // Android 支持的类型
  nfcA(androidOnly: true),
  nfcB(androidOnly: true),
  nfcF(androidOnly: true),
  nfcV(androidOnly: true),
  isoDep(androidOnly: true),
  mifareClassic(androidOnly: true),
  mifareUltralight(androidOnly: true),
  ndefFormatable(androidOnly: true),
  nfcBarcode(androidOnly: true);

  final bool iosOnly;
  final bool androidOnly;

  const NfcTagType({this.iosOnly = false, this.androidOnly = false});

  bool isSupportedOnPlatform(String platform) {
    if (platform.toLowerCase() == 'ios') {
      return iosOnly || (!androidOnly && !iosOnly);
    } else if (platform.toLowerCase() == 'android') {
      return androidOnly || (!androidOnly && !iosOnly);
    } else {
      return false;
    }
  }
}

class Nfc {
  Nfc._internal();

  static final Nfc _instance = Nfc._internal();

  factory Nfc() => _instance;

  static Nfc get instance => _instance;

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
            var mTag = await _loopMapTag(tag);
            logD("NFC scan result: $mTag ${tag}");
            if (!completer.isCompleted) {
              completer.complete(mTag);
            }
          },
          alertMessageIOS: startAlertMessageIOS,
          onSessionErrorIOS: (error) {
            logD("NFC scan ios failed: ${error.code} ${error.message}");
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

  Future<String?> _loopMapTag(NfcTag tag) async {
    var supportTypes = NfcTagType.values.where((element) =>
        element.isSupportedOnPlatform(Platform.isAndroid ? "android" : "ios"));
    String? res;
    for (var a in supportTypes) {
      res = await RunUtil.safeRun<String?>(() async {
        return _mapTag(a, a, tag);
      });
      if (res != null) {
        logD("nfc scan success type = ${a.name},res = $res");
        break;
      }
    }
    return res;
  }

  String? _mapTag(NfcTagType expectAndroidTagType, NfcTagType expectIosTagType,
      NfcTag tag) {
    Uint8List? nfcId;
    if (Platform.isAndroid) {
      switch (expectAndroidTagType) {
        case NfcTagType.ndef:
          var ndef = NdefAndroid.from(tag);
          nfcId = ndef?.tag.id;
          break;
        case NfcTagType.nfcA:
          var nfcA = NfcAAndroid.from(tag);
          nfcId = nfcA?.tag.id;
          break;
        case NfcTagType.nfcB:
          var nfcB = NfcBAndroid.from(tag);
          nfcId = nfcB?.tag.id;
          break;
        case NfcTagType.nfcF:
          var nfcF = NfcFAndroid.from(tag);
          nfcId = nfcF?.tag.id;
          break;
        case NfcTagType.nfcV:
          var nfcV = NfcVAndroid.from(tag);
          nfcId = nfcV?.tag.id;
          break;
        case NfcTagType.isoDep:
          var isoDep = IsoDepAndroid.from(tag);
          nfcId = isoDep?.tag.id;
          break;
        case NfcTagType.mifareClassic:
          var mifareClassic = MifareClassicAndroid.from(tag);
          nfcId = mifareClassic?.tag.id;
          break;
        case NfcTagType.mifareUltralight:
          var mifareUltralight = MifareUltralightAndroid.from(tag);
          nfcId = mifareUltralight?.tag.id;
          break;
        case NfcTagType.ndefFormatable:
          var ndefFormatable = NdefFormatableAndroid.from(tag);
          nfcId = ndefFormatable?.tag.id;
          break;
        case NfcTagType.nfcBarcode:
          var nfcBarcode = NfcBarcodeAndroid.from(tag);
          nfcId = nfcBarcode?.tag.id;
          break;
        default:
          nfcId = null;
          break;
      }
    } else {
      switch (expectIosTagType) {
        case NfcTagType.ndef:
          var ndef = NdefAndroid.from(tag);
          nfcId = ndef?.tag.id;
          break;
        case NfcTagType.feliCa:
          var feliCa = FeliCaIOS.from(tag);
          nfcId = feliCa?.currentIDm;
          break;
        case NfcTagType.iso7816:
          var iso7816 = Iso7816IOS.from(tag);
          nfcId = iso7816?.identifier;
          break;
        case NfcTagType.iso15693:
          var iso7816 = Iso15693IOS.from(tag);
          nfcId = iso7816?.identifier;
          break;
        case NfcTagType.mifare:
          var mifare = MiFareIOS.from(tag);
          nfcId = mifare?.identifier;
          break;
        default:
          nfcId = null;
          break;
      }
    }
    logD(
        "nfc scan finish type =  ${expectIosTagType}、${expectIosTagType},res = $nfcId");
    if (nfcId == null) {
      return null;
    } else {
      String nfcIdText =
          nfcId.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
      logD("NFC scan result original: $nfcIdText");
      return nfcIdText;
    }
  }

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
          alertMessageIOS: alertMessageIOS, errorMessageIOS: errorMessageIOS);
    } catch (e) {
      logD("nfc stop failed $e");
    }
    _listening = false;
  }
}
*/
