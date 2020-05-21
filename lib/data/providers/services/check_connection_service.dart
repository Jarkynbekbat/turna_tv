import 'dart:io';

Future<bool> checkConnection() async {
  bool has = false;
  try {
    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) has = true;
  } on SocketException catch (_) {
    has = false;
  }
  return has;
}
