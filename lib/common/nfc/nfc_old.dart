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
            var id = await _decodeTag(tag);
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

  Future<String?> _decodeTag(NfcTag tag) async {
    var ndef = Ndef.from(tag);
    Uint8List? id;
    if (ndef != null) {
      var additional = ndef.additionalData;
      var additionalId = additional["identifier"];
      var records = ndef.cachedMessage?.records;
      if (records != null) {
        for (var e in records) {
          id = e.identifier;
          if (e.identifier.isNotEmpty) {
            break;
          }
        }
      }
      if (id == null || id.isEmpty) {
        if (additionalId is Uint8List) {
          id = additionalId;
        }
      }
    } else {
      if (Platform.isAndroid) {
        id = NfcA.from(tag)?.identifier;
        id ??= NfcB.from(tag)?.identifier;
        id ??= NfcF.from(tag)?.identifier;
        id ??= NfcV.from(tag)?.identifier;
        id ??= IsoDep.from(tag)?.identifier;
        id ??= MifareClassic.from(tag)?.identifier;
        id ??= MifareUltralight.from(tag)?.identifier;
        id ??= NdefFormatable.from(tag)?.identifier;
      } else if (Platform.isIOS) {
        id = FeliCa.from(tag)?.currentIDm;
        id ??= Iso7816.from(tag)?.identifier;
        id ??= Iso15693.from(tag)?.identifier;
        id ??= MiFare.from(tag)?.identifier;
      }
    }
    String? nfcIdText =
        id?.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
    if (nfcIdText == null || nfcIdText.isEmpty) {
      nfcIdText = null;
    }
    return nfcIdText;
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
          alertMessage: alertMessageIOS, errorMessage: errorMessageIOS);
    } catch (e) {
      logD("nfc stop failed $e");
    }
    _listening = false;
  }
}
