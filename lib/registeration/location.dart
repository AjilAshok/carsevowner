import 'package:carsevowner/Servies/placesearch.dart';
import 'package:carsevowner/controller/ownerservice.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';

class LocationService extends StatefulWidget {
  LocationService({Key? key}) : super(key: key);
  TextEditingController search = TextEditingController();
  String? adress;

  @override
  State<LocationService> createState() => _LocationServiceState();
}

// final initialPosition = LatLng(10.1004, 76.3570,);

class _LocationServiceState extends State<LocationService> {
  double latitude = 0;
  double longitude = 0;
  List<Marker> marker = [];
  addmarker(coordinates, addres) {
    setState(() {
      //  marker.add(markerId: MarkerId('1'),
      //  position: coordinates,
      //   icon: BitmapDescriptor.defaultMarker,
      //  infoWindow:InfoWindow(title: addres)
      //  );
      marker.add(Marker(
          position: coordinates,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: addres),
          markerId: MarkerId('1')));
    });
  }

  final CameraPosition intialise =
      CameraPosition(target: LatLng(10.1004, 76.3570));
  GoogleMapController? _mapController;
  static final Marker _orgin = Marker(
      infoWindow: InfoWindow(title: "Orgin"),
      icon: BitmapDescriptor.defaultMarker,
      // position: LatLng(),
      markerId: MarkerId('Orgin'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        GetBuilder<Ownerservice>(
          builder: (controller) => GoogleMap(
            markers: marker.toSet(),
            myLocationButtonEnabled: true,
            initialCameraPosition:
                CameraPosition(target: LatLng(10.1004, 76.3570), zoom: 15),
            mapType: MapType.hybrid,
            onMapCreated: (GoogleMapController mapController) {
              setState(() {
                _mapController = mapController;
              });
            },
            onTap: (LatLng) async {
              await addmarker(LatLng, widget.adress);
              

              controller.locationservies(LatLng);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: SearchMapPlaceWidget(
            placeType: PlaceType.cities,
            hasClearButton: true,
            textColor: Colors.black,
            bgColor: Colors.white,
            apiKey: 'AIzaSyB5bzRmVqr1uZ6Q-ZriIYr7Bj1dtSJZcMw',
            onSelected: (Place place) async {
              // print();
         
              Geolocation? geolocation = await place.geolocation;
              print(place.description);
              _mapController!.animateCamera(
                  CameraUpdate.newLatLng(geolocation!.coordinates));
              _mapController!.animateCamera(
                  CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
            },
          ),
        )
      ],
    )));
  }
}
