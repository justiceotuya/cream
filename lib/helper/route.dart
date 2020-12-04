import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

pop(BuildContext context) {
  Navigator.pop(context);
}

pushReplace({@required BuildContext context, @required Widget child}) {
  Navigator.pushReplacement(
      context,
      PageTransition(
          duration: Duration(milliseconds: 200),
          type: PageTransitionType.fade,
          child: child));
}

push({
  @required BuildContext context,
  @required Widget child,
}) {
  Navigator.push(
      context,
      PageTransition(
          duration: Duration(milliseconds: 200),
          type: PageTransitionType.fade,
          child: child));
}
