import 'package:flutter/material.dart';

enum Transition {
  fade,
  rightToLeft,
  leftToRight,
  downToUp,
  upToDown,
}

class AzNavigation {
  static Future<dynamic> to(
      BuildContext context,
      Widget page, {
        Transition transition = Transition.fade,
        Object? arguments,
      }) {
    return Navigator.push(
      context,
      _buildRoute(page, transition, arguments),
    );
  }

  static Future<dynamic> off(
      BuildContext context,
      Widget page, {
        Transition transition = Transition.fade,
        Object? arguments,
      }) {
    return Navigator.pushReplacement(
      context,
      _buildRoute(page, transition, arguments),
    );
  }

  static void back(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }

  static PageRouteBuilder _buildRoute(
      Widget page,
      Transition transition,
      Object? arguments,
      ) {
    return PageRouteBuilder(
      settings: RouteSettings(arguments: arguments),
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (_, animation, __, child) {
        switch (transition) {
          case Transition.rightToLeft:
            return SlideTransition(
              position:
              Tween(begin: const Offset(1, 0), end: Offset.zero)
                  .animate(animation),
              child: child,
            );

          case Transition.leftToRight:
            return SlideTransition(
              position:
              Tween(begin: const Offset(-1, 0), end: Offset.zero)
                  .animate(animation),
              child: child,
            );

          case Transition.downToUp:
            return SlideTransition(
              position:
              Tween(begin: const Offset(0, 1), end: Offset.zero)
                  .animate(animation),
              child: child,
            );

          case Transition.upToDown:
            return SlideTransition(
              position:
              Tween(begin: const Offset(0, -1), end: Offset.zero)
                  .animate(animation),
              child: child,
            );

          default:
            return FadeTransition(
              opacity: animation,
              child: child,
            );
        }
      },
    );
  }
}
