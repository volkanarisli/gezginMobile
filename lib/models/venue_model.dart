import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Map<String, dynamic> data;

  Future<dynamic> getData(double lat, double long) async {
    var response = await http.get(
      Uri.encodeFull("https://api.foursquare.com/v2/venues/search?client_id=TLJH1DPK0UG2UZ0E2BH4SYPZQ4US5AN5DVW1UDBK0LZI1EZ5&client_secret=ZYDVH4SNJIHGGY42I0E4NROPXYUIF4FEZRICC1NBHE3O0LZP&v=20120609&ll=${lat}, ${long}&intent=browse&radius=1000&limit=10"),
      headers: {
        "Accept": "application/json"
      }
    );
    data = json.decode(response.body);
    print(data['response']['venues']);
    
    return data;
  }
