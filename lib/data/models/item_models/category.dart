import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:turna_tv/data/models/item_models/genre.dart';

class Category {
  final int id;
  final String name;
  final List<Genre> genres;

  Category({
    @required this.id,
    @required this.name,
    @required this.genres,
  });

  static Category fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      id: int.parse(map['categoryId']),
      name: map['categoryName'],
    );
  }

  static Category fromJson(String source) => fromMap(json.decode(source));
}
