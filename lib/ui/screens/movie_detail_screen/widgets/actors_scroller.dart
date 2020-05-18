import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/item_models/actor.dart';
import '../../../../data/providers/services/api_service.dart';

class ActorScroller extends StatelessWidget {
  ActorScroller(this.actors);
  final List<Actor> actors;

  Widget _buildActor(BuildContext context, int index) {
    var actor = actors[index];

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage:
                CachedNetworkImageProvider(ApiService.imgBase + actor.img),
            radius: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              actor.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Создатели',
            style: textTheme.bodyText2,
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
          child: ListView.builder(
            itemCount: actors.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            itemBuilder: _buildActor,
          ),
        ),
      ],
    );
  }
}
