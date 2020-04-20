import 'package:latlong/latlong.dart';

class cityRoute {
  String cityName;
  String routeName;
  String routeType;
  List<LatLng> points;

  cityRoute({this.cityName, this.routeName, this.routeType, this.points});
}

List<LatLng> yarimada = [
  LatLng(41.005640, 28.976801),
  LatLng(41.005459, 28.974814),
  LatLng(41.005969, 28.975306),
  LatLng(41.006707, 28.976207),
];

List<cityRoute> routes = [
  cityRoute(
    cityName: 'Istanbul',
    routeName: 'Tarihi yarım ada',
    routeType: 'Walking',
    points: yarimada,
  )
];
