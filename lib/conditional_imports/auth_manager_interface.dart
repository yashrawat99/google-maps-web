import 'package:flutter/material.dart';
import 'auth_manager_stub.dart'
if (dart.library.io) 'package:multi_package/map_screen_mobile.dart'
if (dart.library.html) 'package:multi_package/map_screen_web.dart';

abstract class MapScreen {

  Widget? getMapScreenView(Widget mapView) {
    return mapView;
  }
  factory MapScreen() => getMapScreen();
}
