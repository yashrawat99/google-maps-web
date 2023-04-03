import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart' as gMap;
import 'package:flutter/src/widgets/framework.dart';
import 'package:multi_package/conditional_imports/auth_manager_interface.dart';

class MapScreenWeb implements MapScreen {
  @override
  Widget? getMapScreenView(Widget mapView) {
    return mapViewWeb();
  }

  Widget mapViewWeb() {
    //A unique id to name the div element
    // String htmlId = "6";
    //creates a webView in dart
    //ignore: undefined_prefixed_name
    // ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    // //   final latLang = LatLng(25.31766, 82.987289);

    // //   final mapOptions = MapOptions()
    // //     ..zoom = 11
    // //     ..tilt = 90
    // //     ..center = latLang;
    // //   final elem = DivElement()
    // //     ..id = htmlId
    // //     ..style.width = "100%"
    // //     ..style.height = "100%"
    // //     ..style.border = "none";

    // //   final map = GMap(elem, mapOptions);
    // //   Marker(MarkerOptions()
    // //     ..position = latLang
    // //     ..map = map
    // //     ..title = 'My position');
    // //   Marker(MarkerOptions()
    // //     ..position = LatLng(25.31766, 82.987289)
    // //     ..map = map
    // //     ..title = 'My position');
    // //   return elem;
    // // });
    //creates a platform view for Flutter Web
    final String htmlId = "map";

//ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final mapOptions = gMap.MapOptions()
        ..zoom = 15.0
        ..center = gMap.LatLng(35.7560423, 139.7803552);

      final elem = DivElement()..id = htmlId;
      final map = gMap.GMap(elem, mapOptions);
      final _icon = gMap.Icon()
        ..scaledSize = gMap.Size(30, 30)
        ..url = "assets/marker.png";

      final polyline = gMap.Polyline(gMap.PolylineOptions()
        ..path = [
          gMap.LatLng(35.7560423, 139.7803552),
          gMap.LatLng(35.7713533, 139.7754953)
        ]
        ..strokeColor = "#75A9FF"
        ..strokeOpacity = 1.0
        ..strokeWeight = 3);
      polyline.map = map;

      gMap.Marker(gMap.MarkerOptions()
        ..anchorPoint = gMap.Point(0.5, 0.5)
        ..icon = _icon
        ..position = gMap.LatLng(35.7560423, 139.7803552)
        ..map = map
        ..title = htmlId);
      return elem;
    });
    return HtmlElementView(viewType: htmlId);
  }
}

MapScreen getMapScreen() => MapScreenWeb();
