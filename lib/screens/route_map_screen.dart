import 'package:flutter/material.dart';
import './tabs_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:geolocator/geolocator.dart';

class RouteMapScreen extends StatefulWidget {
  static const routeName = '/route_map_screen';
  final List route;
  RouteMapScreen({this.route});
  @override
  _RouteMapScreenState createState() => _RouteMapScreenState();
}

class _RouteMapScreenState extends State<RouteMapScreen> {
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
      _myLocation = widget.route[0];

      print(_myLocation);
      print(widget.route);
    });
    buildMap(_myLocation);
  }

  List<Marker> rootPoints = [];

  void addCurentRoutePointsToList() async {
    rootPoints.add(
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
              )),
    );
    widget.route.asMap().forEach((index, value) {
      rootPoints.add(Marker(
          width: 45.0,
          height: 45.0,
          point: widget.route[index],
          builder: (context) => new Container(
                child: IconButton(
                  icon: Icon(Icons.assistant_photo),
                  color: Colors.blue,
                  iconSize: 45.0,
                  onPressed: () {
                    print('I fckn work');
                  },
                ),
              )));
    });
  }

  void initState() {
    // NOTE: Calling this function here would crash the app.

    getCurrentLocation();
    addCurentRoutePointsToList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new FlutterMap(
            mapController: controller,
            options: new MapOptions(center: _myLocation, minZoom: 15.0),
            layers: [
          new TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/volkanarisli/ck98y0o8j070n1io5b6wciro3/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoidm9sa2FuYXJpc2xpIiwiYSI6ImNrOThtOXM2cDA5NmszbXByd3Uyb3JveHYifQ.824CdensYZcPPR0Fgwu9xQ",
          ),
          new MarkerLayerOptions(markers: rootPoints),
          new PolylineLayerOptions(polylines: [
            new Polyline(
                points: widget.route, strokeWidth: 5.0, color: Colors.red)
          ])
        ]));
  }
}
