import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showErrorDialog(context, content) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.SCALE,
    dialogType: DialogType.ERROR,
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
