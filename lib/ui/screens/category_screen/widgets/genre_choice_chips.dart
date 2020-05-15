import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

class GenreChoiceChips extends StatelessWidget with PreferredSizeWidget {
  final String value;
  final List<String> options;
  final Function onChanged;

  GenreChoiceChips({
    @required this.value,
    @required this.options,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ChipsChoice<String>.single(
      value: value,
      options: ChipsChoiceOption.listFrom<String, String>(
        source: options,
        value: (i, v) => v,
        label: (i, v) => v,
      ),
      onChanged: (val) {},
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
