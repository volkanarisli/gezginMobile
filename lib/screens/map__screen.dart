import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import '../models/cityroute_model.dart';
import '../models/venue_model.dart';
import 'package:geolocator/geolocator.dart';
import '../widgets/hotel_carousel.dart';

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
    getData(position.latitude, position.longitude);
  }

  void initState() {
    // NOTE: Calling this function here would crash the app.

    getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          mapController: controller,
          options: new MapOptions(center: _myLocation, minZoom: 15.0),
          layers: [
            new TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/volkanarisli/ck98y0o8j070n1io5b6wciro3/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoidm9sa2FuYXJpc2xpIiwiYSI6ImNrOThtOXM2cDA5NmszbXByd3Uyb3JveHYifQ.824CdensYZcPPR0Fgwu9xQ",
            ),
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
          ]),
    );
  }
}
