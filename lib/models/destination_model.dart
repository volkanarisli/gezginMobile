import 'package:gezginmobile/models/cityroute_model.dart';

import './activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;
  // List<cityRoute> routes;
  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> istanbulActivities = [
  Activity(
      imageUrl: 'assets/images/mapicon.png',
      name: 'Tarihi Yarım Ada',
      type: 'Yürüme',
      startTimes: ['3:00 H'],
      rating: 5,
      price: 30,
      route: yarimada),
  Activity(
      imageUrl: 'assets/images/mapicon.png',
      name: 'Modern İstanbul',
      type: 'Araba',
      startTimes: ['3:00 H'],
      rating: 4,
      price: 210,
      route: modernistanbul),
  Activity(
      imageUrl: 'assets/images/mapicon.png',
      name: 'Sahil turları',
      type: 'Araba',
      startTimes: ['3:00 H'],
      rating: 3,
      price: 125,
      route: sahil),
];

List<Activity> izmirActivities = [
  Activity(
      imageUrl: 'assets/images/mapicon.png',
      name: 'İzmir turu',
      type: 'Araba',
      startTimes: ['3:00 H'],
      rating: 5,
      price: 30,
      route: izmir),
];

List<Activity> ankaraActivities = [
  Activity(
      imageUrl: 'assets/images/mapicon.png',
      name: 'Ankara turu',
      type: 'Araba',
      startTimes: ['3:00 H'],
      rating: 5,
      price: 30,
      route: ankara),
];
List<Activity> adanaActivities = [
  Activity(
      imageUrl: 'assets/images/mapicon.png',
      name: 'Adana turu',
      type: 'Araba',
      startTimes: ['3:00 H'],
      rating: 5,
      price: 30,
      route: adana),
];
List<Activity> konyaActivities = [
  Activity(
      imageUrl: 'assets/images/mapicon.png',
      name: 'Konya turu',
      type: 'Araba',
      startTimes: ['3:00 H'],
      rating: 5,
      price: 30,
      route: konya),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/istanbul.jpg',
    city: 'İstanbul',
    country: 'Türkiye',
    description: 'Visit İstanbul for an amazing and unforgettable adventure.',
    activities: istanbulActivities,
  ),
  Destination(
    imageUrl: 'assets/images/izmir.jpg',
    city: 'İzmir',
    country: 'Türkiye',
    description: 'Visit izmir for an amazing and unforgettable adventure.',
    activities: izmirActivities,
  ),
  Destination(
    imageUrl: 'assets/images/ankara.jpg',
    city: 'Ankara',
    country: 'Türkiye',
    description: 'Visit Ankara for an amazing and unforgettable adventure.',
    activities: ankaraActivities,
  ),
  Destination(
    imageUrl: 'assets/images/adana.jpg',
    city: 'Adana',
    country: 'Türkiye',
    description: 'Visit Adana for an amazing and unforgettable adventure.',
    activities: adanaActivities,
  ),
  Destination(
    imageUrl: 'assets/images/konya.jpg',
    city: 'Konya',
    country: 'Türkiye',
    description: 'Visit Konya for an amazing and unforgettable adventure.',
    activities: konyaActivities,
  ),
];
