import 'package:flutter/material.dart';

void ucpAlert(BuildContext context, String content) {
  ucpAlertWidget(context, Text(content));
}

void ucpAlertWidget(BuildContext context, Widget content) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Information'),
        scrollable: true,
        content: content,
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void ucpConfirm(BuildContext context, String content, onConfirm) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Information'),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Confirm'),
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm(context);
            },
          ),
        ],
      );
    },
  );
}

ucpDialog({
  required BuildContext context,
  required String title,
  Widget? body,
  Future? then,
  double? width,
  double? height,
}) {
  AppBar header = AppBar(
    title: Text(title),
  );
  var result = Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          header,
          Expanded(
            child: SingleChildScrollView(
              child: body,
            ),
          ),
        ],
      ));
  return showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: result,
    ),
  );
}
