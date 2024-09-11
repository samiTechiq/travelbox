import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';

abstract class Navigation {
  void go(BuildContext context, String path);

  void goWithArgs<T>(BuildContext context, String path, {required T args});

  void goNamed(BuildContext context, String path);

  void push(BuildContext context, String path);

  void replace(BuildContext context, String path);

  void pushWithArgs<T>(BuildContext context, String path, {required T args});

  void goBack(BuildContext context);

  void pushReplacement(BuildContext context, String path);

  void popUntil(BuildContext context, String path);

  bool routeExists(String route);
}

@LazySingleton(as: Navigation)
class NavigationImpl implements Navigation {
  @override
  void go(BuildContext context, String path) {
    context.go(path);
  }

  @override
  void goNamed(BuildContext context, String path) {
    context.goNamed(path);
  }

  @override
  void push(BuildContext context, String path) {
    // if (kIsWeb) {
    //   context.go(path);
    //   return;
    // }
    context.push(path);
  }

  @override
  void goBack(BuildContext context) {
    context.pop();
  }

  @override
  void pushWithArgs<T>(BuildContext context, String path, {required T args}) {
    // if (kIsWeb) {
    //   context.go(path, extra: args);
    //   return;
    // }
    context.push(path, extra: args);
  }

  @override
  void goWithArgs<T>(BuildContext context, String path, {required T args}) {
    context.go(path, extra: args);
  }

  @override
  void replace(BuildContext context, String path) {
    context.replace(path);
  }

  @override
  void pushReplacement(BuildContext context, String path) {
    context.pushReplacement(path);
  }

  @override
  void popUntil(BuildContext context, String? routeName) {
    if (!NavigationObserver.backStack.contains(routeName)) {
      return;
    }

    while (NavigationObserver.backStack.last != Routes.homeRoute && NavigationObserver.backStack.last != routeName) {
      GoRouter.of(context).pop();
    }
  }

  @override
  bool routeExists(String route) {
    return NavigationObserver.backStack.contains(route);
  }
}

class NavigationObserver extends NavigatorObserver {
  static List<String> backStack = [];
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('did push route');
    backStack.add(route.settings.name ?? '');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('did pop route');
    backStack.removeLast();
  }
}
