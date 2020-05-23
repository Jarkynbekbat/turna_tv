import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> showMakesureDialog(context, content) async {
  bool result = false;

  await AwesomeDialog(
    context: context,
    animType: AnimType.SCALE,
    dialogType: DialogType.WARNING,
    body: Center(
      child: Text(
        content,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.black,
            ),
        textAlign: TextAlign.center,
      ),
    ),
    btnOkText: 'да',
    btnCancelText: 'отмена',
    btnOkOnPress: () {
      result = true;
    },
    btnCancelOnPress: () {},
  ).show();

  return result;
}
