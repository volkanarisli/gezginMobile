import 'package:latlong/latlong.dart';

class cityRoute {
  String cityName;
  String routeName;
  String routeType;
  List<LatLng> points;

  cityRoute({this.cityName, this.routeName, this.routeType, this.points});
}

List<LatLng> yarimada = [
  LatLng(41.0114101, 28.9831302),
  LatLng(41.0086275, 28.980276),
  LatLng(41.0118376, 28.9815937),
  LatLng(41.0083788, 28.9779271),
  LatLng(41.0080405, 28.9765544),
  LatLng(41.0054136, 28.9766251),
  LatLng(41.0084912, 28.9710759),
  LatLng(41.0106877, 28.9680205),
  LatLng(41.0155177, 28.96443),
  LatLng(41.0165717, 28.9707575),
  LatLng(41.0171216, 28.972015),
  LatLng(41.0160542, 28.9733457),
];
List<LatLng> modernistanbul = [
  LatLng(41.0368951, 28.985089),
  LatLng(41.0353954, 28.9803022),
  LatLng(41.0338393, 28.9781063),
  LatLng(41.0338393, 28.9781063),
  LatLng(41.0256317, 28.9740622),
  LatLng(41.023935, 28.9733782),
  LatLng(41.0228914, 28.977407),
  LatLng(41.026453, 28.9807863),
  LatLng(41.0383169, 28.9968791),
  LatLng(41.0416291, 29.0053788),
];
List<LatLng> sahil = [
  LatLng(41.042353, 29.0064496),
  LatLng(41.0472683, 29.026563),
  LatLng(41.0678687, 29.045395),
  LatLng(41.076464, 29.043273),
  LatLng(41.0825339, 29.0540044),
  LatLng(41.084849, 29.0567925),
  LatLng(41.097113, 29.0526153),
  LatLng(41.104746, 29.0561712),
  LatLng(41.105557, 29.0569888),
  LatLng(41.107461, 29.0565188),
];

List<LatLng> izmir = [
  LatLng(38.438415, 27.1473201),
  LatLng(38.4392602, 27.1438205),
  LatLng(38.4355797, 27.140482),
  LatLng(38.4358523, 27.1394721),
  LatLng(38.43038, 27.1337967),
  LatLng(38.4288946, 27.134332),
  LatLng(38.4298375, 27.1419306),
  LatLng(38.4186247, 27.1388011),
  LatLng(38.4183026, 27.1321551),
  LatLng(38.4188994, 27.1286316),
];
List<LatLng> ankara = [
  LatLng(39.9249542, 32.8367604),
  LatLng(39.9369107, 32.8496052),
  LatLng(39.9369107, 32.8496052),
  LatLng(39.9417433, 32.8547208),
  LatLng(39.9326843, 32.8552246),
  LatLng(39.9380909, 32.8618021),
  LatLng(39.9374922, 32.8633863),
  LatLng(39.939151, 32.8652771),
  LatLng(39.9204771, 32.8542107),
  LatLng(39.9120672, 32.8509285),
  LatLng(39.9020406, 32.8600466),
  LatLng(39.8859671, 32.8557096),
];
List<LatLng> adana = [
  LatLng(36.9874717, 35.3258812),
  LatLng(36.983987, 35.33008),
  LatLng(36.9849449, 35.3307692),
  LatLng(36.9863404, 35.3350289),
  LatLng(36.9884352, 35.3318315),
  LatLng(36.9886607, 35.3317436),
  LatLng(36.9915777, 35.3341025),
  LatLng(36.9959583, 35.3344055),
  LatLng(37.0018188, 35.326922),
];
List<LatLng> konya = [
  LatLng(37.87004, 32.5116909),
  LatLng(37.8707308, 32.5048894),
  LatLng(37.8699496, 32.500737),
  LatLng(37.8725337, 32.492295),
  LatLng(37.8733942, 32.4925919),
  LatLng(37.8749637, 32.4927826),
  LatLng(37.8728698, 32.489955),
  LatLng(37.8728698, 32.489955),
  LatLng(37.8666206, 32.4914155),
];

List<cityRoute> routes = [
  cityRoute(
    cityName: 'Istanbul',
    routeName: 'Tarihi yarım ada',
    routeType: 'Walking',
    points: yarimada,
  )
];
