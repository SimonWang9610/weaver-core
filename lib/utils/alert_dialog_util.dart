import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:weaver_core/widgets/weaver/ucp_button.dart';

class AlertDialogUtil {
  static String payPassword = '';

  static showAlertDialog(BuildContext context, String content) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              translate('labels.notice'),
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'halter',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(content),
            actions: [
              UcpButton(
                label: translate('button.close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  static void showCustomAlertDialog(BuildContext context,
      {required Text content, required Text title}) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: content,
            title: Center(
              child: title, // center the title
            ),
            actions: <Widget>[
              UcpButton(
                label: 'OK',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  static void showYesOrNoDialog(BuildContext callerContext, String title,
      String content, Function yesOnPressed,
      {data}) {
    showDialog(
        context: callerContext,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'halter',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(content),
            actions: [
              UcpButton(
                label: translate('button.confirm'),
                onPressed: () async {
                  Navigator.of(context).pop(true); // Return true,
                  await yesOnPressed(callerContext, data: data);
                },
              ),
              UcpButton(
                label: translate('button.cancel'),
                onPressed: () {
                  Navigator.of(context).pop(false); // Return false
                },
              ),
            ],
          );
        });
  }

  static void showPayPasswordDialog(
      BuildContext callerContext, Function callback) {
    payPassword = '';

    showDialog(
        context: callerContext,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              translate('common.enter_pay_password'),
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'halter',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: buildPayPasswordField(),
            actions: [
              UcpButton(
                label: translate('button.confirm'),
                onPressed: () async {
                  if (!payPassword.isEmpty) {
                    Navigator.of(context).pop(true); // Return true,
                    await callback(callerContext, payPassword);
                  }
                },
              ),
              UcpButton(
                label: translate('button.cancel'),
                onPressed: () {
                  Navigator.of(context).pop(false); // Return false
                },
              ),
            ],
          );
        });
  }

  static Widget buildPayPasswordField() {
    return TextField(
      obscureText: true,
      cursorColor: const Color.fromRGBO(64, 143, 77, 1),
      decoration: InputDecoration(
        labelText: translate('common.pay_password'),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      onChanged: (value) {
        payPassword = value;
      },
    );
  }
}
