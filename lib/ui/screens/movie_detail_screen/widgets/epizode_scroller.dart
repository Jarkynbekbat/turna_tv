import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/item_models/epizode.dart';
import '../../../../data/models/item_models/serie.dart';
import '../../../../data/providers/services/api_service.dart';
import '../../video_player_screen/video_player.dart';

class EpizodeScroller extends StatelessWidget {
  final Epizode epizode;
  EpizodeScroller({@required this.epizode});

  Widget _buildSerie(BuildContext context, int index) {
    Serie serie = epizode.series[index];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                VideoPlayerPage(title: serie.title, url: serie.url),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: CachedNetworkImage(
            imageUrl: ApiService.imgBase + serie.img,
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
          child: Text(epizode.epizodeTitle),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(100.0),
          child: ListView.builder(
            itemCount: epizode.series.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 12.0),
            itemBuilder: _buildSerie,
          ),
        ),
        SizedBox(height: 12.0),
      ],
    );
  }
}
