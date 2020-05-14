import 'dart:convert';

import 'package:flutter/foundation.dart';

class Genre {
  final int id;
  final String name;
  final int categoryId;
  Genre({@required this.id, @required this.name, @required this.categoryId});

  static Genre fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Genre(
      id: int.parse(map['genreId']),
      name: map['genreName'],
      categoryId: int.parse(map['genreCategoryId']),
    );
  }

  static Genre fromJson(String source) => fromMap(json.decode(source));
}
