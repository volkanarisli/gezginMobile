import 'package:flutter/material.dart';
import '../widgets/destination_carousel.dart';
import '../widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:delayed_display/delayed_display.dart';

import 'package:latlong/latlong.dart';

import '../models/venue_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  LatLng _myLocation = new LatLng(41.067911, 28.945787);

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

    getData(position.latitude, position.longitude);
  }

  void initState() {
    // NOTE: Calling this function here would crash the app.

    getCurrentLocation();

    super.initState();
  }

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Şuan nerede olmak istersin?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // SizedBox(height: 20.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: _icons
            //       .asMap()
            //       .entries
            //       .map(
            //         (MapEntry map) => _buildIcon(map.key),
            //       )
            //       .toList(),
            // ),
            SizedBox(height: 20.0),
            DelayedDisplay(
              delay: Duration(seconds: 1),
              child: DestinationCarousel(),
            ),
            SizedBox(height: 20.0),
            DelayedDisplay(
              delay: Duration(seconds: 2),
              child: HotelCarousel(data: data),
            ),
          ],
        ),
      ),
    );
  }
}
