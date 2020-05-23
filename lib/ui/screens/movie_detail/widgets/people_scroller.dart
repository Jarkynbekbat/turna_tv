import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/item_models/people.dart';
import '../../../../data/providers/services/api_service.dart';

class PeopleScroller extends StatelessWidget {
  PeopleScroller(this.people);
  final List<People> people;

  Widget _buildPerson(BuildContext context, int index) {
    var person = people[index];

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: person.img == '/use/img/people.svg'
                ? AssetImage('assets/placeholders/people.png')
                : CachedNetworkImageProvider(ApiService.imgBase + person.img),
            radius: 40.0,
          ),
          SizedBox(height: 4.0),
          Text(
            person.name,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.0),
          Text(
            person.postTitle,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 12.0,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(0.5),
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
            'Творческий состав',
            style: textTheme.bodyText2,
          ),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(150.0),
          child: ListView.builder(
            itemCount: people.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            itemBuilder: _buildPerson,
          ),
        ),
      ],
    );
  }
}
