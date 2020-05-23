import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screenshot_screen.dart';

class PhotoScroller extends StatelessWidget {
  final List<String> photoUrls;
  PhotoScroller({@required this.photoUrls});

  Widget _buildPhoto(BuildContext context, int index) {
    var photo = photoUrls[index];

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ScreenshotScreen(url: photo),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: CachedNetworkImage(
            imageUrl: photo,
            width: 160.0,
            height: 120.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Кадры',
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(100.0),
          child: ListView.builder(
            itemCount: photoUrls.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 12.0),
            itemBuilder: _buildPhoto,
          ),
        ),
        SizedBox(height: 12.0),
      ],
    );
  }
}
