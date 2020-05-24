import 'package:gezginmobile/models/cityroute_model.dart';
import 'package:latlong/latlong.dart';

class Activity {
  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;
  List<LatLng> route;

  Activity({
    this.imageUrl,
    this.name,
    this.type,
    this.startTimes,
    this.rating,
    this.price,
    this.route
  });
}
