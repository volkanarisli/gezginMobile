import 'package:flutter/material.dart';
import './tabs_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/map_screen';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var points = <LatLng>[
    new LatLng(35.22, -101.83),
    new LatLng(32.77, -96.79),
    new LatLng(29.76, -95.36),
    new LatLng(29.42, -98.49),
    new LatLng(35.22, -101.83),
  ];

  // MapController controller = new MapController();
  // getPermission() async {
  //   final GeolocationResult result =
  //       await Geolocation.requestLocationPermission(
  //           permission: const LocationPermission(
  //     android: LocationPermissionAndroid.fine,
  //     ios: LocationPermissionIOS.always,
  //   ));
  //   return result;
  // }

  // getLocation() {
  //   getPermission().then((result) async {
  //     if (result.isSuccesful()) {
  //       final coords =
  //           await Geolocation.currentLocation(accuracy: LocationAccuracy.best);
  //     }
  //   });
  // }

  // buildMap() {
  //   getLocation().then((response) {
  //     if (response.isSuccesful) {
  //       response.listen((value) {
  //         controller.move(
  //             new LatLng(value.location.latitude, value.loation.longitude),
  //             15.0);
  //       });
  //     }
  //   });
  // }
  LatLng _myLocation = new LatLng(41.067911, 28.945787);
  void getCurrentLocation() async {
    var position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      // _myLocation = "${position.latitude}, ${position.longitude}";
      _myLocation = new LatLng(position.latitude, position.longitude);
    });
  }

  void initState() {
    super.initState();
    // NOTE: Calling this function here would crash the app.
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: new Text('KEŞFET')),
        body: new FlutterMap(
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
                    point: LatLng(41.067911, 28.945787),
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
                    points: points, strokeWidth: 5.0, color: Colors.red)
              ])
            ]));
  }
}
