import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    WidgetBuilder widgetBuilder,
    RouteSettings routeSettings,
  }) : super(builder: widgetBuilder, settings: routeSettings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.isInitialRoute) {
      return child;
    }

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (route.settings.isInitialRoute) {
      return child;
    }

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
