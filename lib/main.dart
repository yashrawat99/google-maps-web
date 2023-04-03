import 'package:flutter/material.dart';
import 'conditional_imports/auth_manager_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:multi_package/conditional_imports/auth_manager_interface.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MapScreen mapScreen = MapScreen();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreenWidget(mapScreen: mapScreen),
    );
  }
}

class MapScreenWidget extends StatefulWidget {
  final MapScreen mapScreen;

  MapScreenWidget({required this.mapScreen});

  @override
  _MapScreenWidgetState createState() => _MapScreenWidgetState();
}

class _MapScreenWidgetState extends State<MapScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kIsWeb ? 'Google Maps Web' : 'Google Maps Mobile'),
        backgroundColor: Colors.green[700],
      ),
      body: widget.mapScreen.getMapScreenView(Container()),
    );
  }
}
