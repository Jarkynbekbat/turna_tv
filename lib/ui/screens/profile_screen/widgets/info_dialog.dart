import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showInfoDialog(context, content) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.SCALE,
    dialogType: DialogType.INFO,
    body: Center(
      child: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.black,
            ),
        textAlign: TextAlign.center,
      ),
    ),
    btnOkText: 'Закрыть',
    btnOkOnPress: () {},
  ).show();
}
