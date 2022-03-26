import 'package:flutter/material.dart';

showAlertDialog({required BuildContext context, required Widget title, required Widget content, required List<Widget> actions}){
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: title,
        content: content,
        actions: actions,
      );
    }
 );
}

successAlertDialog({required BuildContext context, required String title, required String bodyMessage}){
  Widget titleWidget() {
    return Text(title);
  }

  Widget contentWidget() {
    return Text(bodyMessage);
  }

  List<Widget> actionsWidget() {
    return <Widget>[
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Ok"),
      ),
    ];
  }

  return showAlertDialog(context: context, title: titleWidget(), content: contentWidget(), actions: actionsWidget());
}