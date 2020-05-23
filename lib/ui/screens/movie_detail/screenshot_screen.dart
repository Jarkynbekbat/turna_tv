import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ScreenshotScreen extends StatelessWidget {
  final String url;
  const ScreenshotScreen({this.url});

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: CachedNetworkImageProvider(url),
    );
  }
}
