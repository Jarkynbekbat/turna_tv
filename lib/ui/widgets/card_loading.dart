import 'package:flutter/material.dart';

cardLoading(context, url, downloadProgress) {
  return CircularProgressIndicator(value: downloadProgress.progress);
}
