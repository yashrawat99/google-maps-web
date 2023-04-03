import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_package/conditional_imports/auth_manager_interface.dart';

class MapScreenMobile implements MapScreen {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(25.31766, 82.987289);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget? getMapScreenView(Widget mapView) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }

}

MapScreen getMapScreen() => MapScreenMobile();