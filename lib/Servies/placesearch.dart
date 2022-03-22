import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Locationmap {
  final String key = 'AIzaSyB5bzRmVqr1uZ6Q-ZriIYr7Bj1dtSJZcMw';

  Future<String?> getplaceid(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][1]['place_id'] as String;
    print(placeId);
    return placeId;
  }
  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getplaceid(input);

    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;

    print(results);
    return results;
  }

}
