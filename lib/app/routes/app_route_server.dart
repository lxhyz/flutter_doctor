import 'package:flutter/material.dart';


class AppRouteService extends  RouteObserver{

  @override
  void didPush(Route route,Route? previousRoute) {
    print('didPush route: ${route.settings.name},  previousRoute:${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    print('didPush route: ${route.settings.name},  previousRoute:${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    print('didReplace newRoute: $newRoute,oldRoute:$oldRoute');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('didRemove route: ${route.settings.name},  previousRoute:${previousRoute?.settings.name}');
  }
}