import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Category {
  final int id;
  final String name;

  Category({@required this.id, @required this.name});

  static Category fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      id: int.parse(map['categoryId']),
      name: map['categoryName'],
    );
  }

  static Category fromJson(String source) => fromMap(json.decode(source));
}
