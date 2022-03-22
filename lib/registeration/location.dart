import 'package:carsevowner/Servies/placesearch.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class LocationService extends StatefulWidget {
  LocationService({Key? key}) : super(key: key);
  TextEditingController search = TextEditingController();

  @override
  State<LocationService> createState() => _LocationServiceState();
}

final initialPosition = LatLng(10.1004, 76.3570);

class _LocationServiceState extends State<LocationService> {
  GoogleMapController? _mapController;
  static final Marker _orgin = Marker(
      infoWindow: InfoWindow(title: "Orgin"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(10.1004, 76.3570),
      markerId: MarkerId('Orgin'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: PlacePicker(
      usePlaceDetailSearch: true,
      initialMapType: MapType.hybrid,
      apiKey: 'AIzaSyB5bzRmVqr1uZ6Q-ZriIYr7Bj1dtSJZcMw',
      initialPosition: initialPosition,
      hintText: "Find a place ...",
      // searchingText: "Please wait ...",
      selectText: "Select place",
      outsideOfPickAreaText: "Place not in area",
      onPlacePicked: (PickResult result) {
        print(result.addressComponents);
        // });
      },
    )));
  }
}
