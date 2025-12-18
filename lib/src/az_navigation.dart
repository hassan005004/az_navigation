import 'package:flutter/material.dart';

enum Transition {
  fade,
  rightToLeft,
  leftToRight,
  downToUp,
  upToDown,
}

class AzNavigation {
  /// Global navigator key
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Navigate to widget with transition
  static Future<dynamic> to(
      Widget page, {
        Transition transition = Transition.fade,
        Object? arguments,
      }) {
    return navigatorKey.currentState!.push(
      _buildRoute(page, transition, arguments),
    );
  }

  /// Replace widget with transition
  static Future<dynamic> off(
      Widget page, {
        Transition transition = Transition.fade,
        Object? arguments,
      }) {
    return navigatorKey.currentState!.pushReplacement(
      _buildRoute(page, transition, arguments),
    );
  }

  /// Navigate to named route WITH TRANSITION
  static Future<dynamic> toNamed(
      String route, {
        Object? arguments,
        Transition transition = Transition.fade,
      }) {
    return navigatorKey.currentState!.pushNamed(
      route,
      arguments: {
        "data": arguments,
        "transition": transition,
      },
    );
  }

  /// Replace with named route WITH TRANSITION
  static Future<dynamic> offNamed(
      String route, {
        Object? arguments,
        Transition transition = Transition.fade,
      }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      route,
      arguments: {
        "data": arguments,
        "transition": transition,
      },
    );
  }

  /// Pop
  static void back({dynamic result}) {
    navigatorKey.currentState!.pop(result);
  }

  // =============================================================
  // INTERNAL — Transition Builder for direct Widget navigation
  // =============================================================
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
              position: Tween(begin: const Offset(1, 0), end: Offset.zero)
                  .animate(animation),
              child: child,
            );

          case Transition.leftToRight:
            return SlideTransition(
              position: Tween(begin: const Offset(-1, 0), end: Offset.zero)
                  .animate(animation),
              child: child,
            );

          case Transition.downToUp:
            return SlideTransition(
              position: Tween(begin: const Offset(0, 1), end: Offset.zero)
                  .animate(animation),
              child: child,
            );

          case Transition.upToDown:
            return SlideTransition(
              position: Tween(begin: const Offset(0, -1), end: Offset.zero)
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
