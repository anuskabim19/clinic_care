import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void snackBar({required String msg, required BuildContext context, required GlobalKey<ScaffoldState> scaffoldState}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 3),
      content: Text(msg),
    ),
  );
}

void pushPageTransition(
    {required BuildContext context,
    required Widget widget,
    PageTransitionType transitionType = PageTransitionType.fade}) {
  Navigator.push(context, PageTransition(child: widget, type: transitionType));
}
