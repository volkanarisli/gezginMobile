import 'package:flutter/material.dart';
import './tabs_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:map_controller/map_controller.dart';
import '../models/cityroute_model.dart';

import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/map_screen';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var points = <LatLng>[
    new LatLng(41.076717, 28.949108),
    new LatLng(41.067911, 28.945787),
    new LatLng(41.059441, 28.949312),
    // new LatLng(29.42, -98.49),
    // new LatLng(35.22, -101.83),
  ];

  MapController controller = new MapController();
  LatLng _myLocation = new LatLng(41.067911, 28.945787);
  buildMap(LatLng location) {
    controller.move(location, 15.0);
  }

  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    print(_myLocation);
    setState(() {
      // _myLocation = "${position.latitude}, ${position.longitude}";
      _myLocation = new LatLng(position.latitude, position.longitude);

      print(_myLocation);
    });
    buildMap(_myLocation);
  }

  void initState() {
    // NOTE: Calling this function here would crash the app.

    getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: new Text('KEŞFET')),
        body: new FlutterMap(
            mapController: controller,
            options: new MapOptions(center: _myLocation, minZoom: 15.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c']),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: _myLocation,
                    builder: (context) => new Container(
                          child: IconButton(
                            icon: Icon(Icons.person_pin),
                            color: Colors.blue,
                            iconSize: 45.0,
                            onPressed: () {
                              print('Marker tapped');
                            },
                          ),
                        ))
              ]),
              new PolylineLayerOptions(polylines: [
                new Polyline(
                    points: yarimada, strokeWidth: 5.0, color: Colors.red)
              ])
            ]));
  }
}
