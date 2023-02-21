import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static Future<void> push(BuildContext context, Widget widget,
      {VoidCallback? whenComplete}) async {
    await Navigator.push(
      context,
      Platform.isIOS
          ? CupertinoPageRoute(builder: (context) => widget)
          : MaterialPageRoute(builder: (context) => widget),
    ).whenComplete(() {
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }

  static Future<void> pushReplacement(BuildContext context, Widget widget,
      {VoidCallback? whenComplete}) async {
    await Navigator.pushReplacement(
      context,
      Platform.isIOS
          ? CupertinoPageRoute(builder: (context) => widget)
          : MaterialPageRoute(builder: (context) => widget),
    ).whenComplete(() {
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }

  static Future<void> pushAndRemoveAll(BuildContext context, Widget widget) async {
    await Navigator.pushAndRemoveUntil(
      context,
      Platform.isIOS
          ? CupertinoPageRoute(builder: (context) => widget)
          : MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }

  static Future<void> pushAndRemoveTillFirst(BuildContext context, Widget widget) async {
    await Navigator.pushAndRemoveUntil(
      context,
      Platform.isIOS
          ? CupertinoPageRoute(builder: (context) => widget)
          : MaterialPageRoute(builder: (context) => widget),
      (route) => route.isFirst,
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
