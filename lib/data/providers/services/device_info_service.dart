import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:get_ip/get_ip.dart';

Future<String> getIP() async {
  try {
    return await GetIp.ipAddress;
  } catch (e) {
    return "";
  }
}

Future<String> getModel() async {
  String model = "";
  try {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      model = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      model = iosDeviceInfo.model;
    }
    return model;
  } catch (e) {
    return model;
  }
}

String getPlatform() {
  return Platform.operatingSystem;
}
