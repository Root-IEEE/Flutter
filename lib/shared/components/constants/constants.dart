import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var kTextFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  hintStyle: const TextStyle(height: 1.5, fontWeight: FontWeight.w300),
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
);

backBtn(BuildContext context) {
  Navigator.pop(context);
}

openPageBottom(BuildContext context, Widget page) {
  Navigator.of(context).push(
    CupertinoPageRoute<bool>(
      fullscreenDialog: true,
      builder: (BuildContext context) => page,
    ),
  );
}

Future openFileExplorer(
  FileType _pickingType,
  bool mounted,
  BuildContext context,
) async {}

SnackBar ksnackBar(BuildContext context, String message) {
  return SnackBar(
    duration: Duration(seconds: 2),
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Theme.of(context).primaryColor,
  );
}

String createCryptoRandomString([int length = 32]) {
  return '';
}

String getChatId(List<String> list) {
  return '';
}
