import 'package:flutter/material.dart';

class NavigationAnimation<T> extends PageRouteBuilder<T> {
  final Widget screen;
  NavigationAnimation({required this.screen})
      : super(
    opaque: false,
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(
            begin: Offset(-1.0, 0.0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.fastOutSlowIn),
          ),
        ),
        child: child,
      );
    },
  );
}
