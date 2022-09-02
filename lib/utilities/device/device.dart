import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Device {
  String platform = "";
  String name = "";
  static const List<String> platformNames = [
    "Android",
    "IOS",
    "Linux",
    "Fuchsia",
    "MacOS",
    "Windows",
  ];

  Device() {
    _setUpPlatform();
    _setUpName();
  }

  _setUpPlatform() {
    platform = Platform.operatingSystem;
  }

  Future<void> _setUpName() async {
    name = await getName();
  }

  static Future<String> getName() async {
    if(kIsWeb) {
      return "Web";
    }

    var deviceInfo = DeviceInfoPlugin();
    const unknownDeviceName = "Dispositivo desconocido";

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model ?? unknownDeviceName;
    }

    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.name ?? unknownDeviceName;
    }

    return unknownDeviceName;
  }
}