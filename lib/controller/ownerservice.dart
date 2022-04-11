import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:open_file/open_file.dart';

UploadTask? task;

class Ownerservice extends GetxController {
  String? selected;
  File? selfile;
  String? name;
  String pdfText = 'Select a proof';
  String checkBoxText = 'Select any options!';
  Color checkBoxTextColor = Colors.white;
  String address = "Select the location";

  String dropDownText = 'Type';
  Color dropDownTextColor = Colors.white;

  Color textColor = Colors.white;

  String? values;
  bool Enginework = false;
  bool Oilchange = false;
  bool breakdown = false;
  bool carwash = false;
  double latitude=0;
  double longitude=0;
  //

  int currentindex = 0;
  final Set<Marker> markers = {};

  bottomnavbar(index) {
    currentindex = index;

    update();
  }

  map({required long, required lat, required title}) {
//

    markers.add(Marker(
        markerId: MarkerId("id-1"),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: title)));
  }

  dropdowntype(value) {
    values = value;
    update();
  }

  chekbox(title, bool vallue) {
    switch (title) {
      case "Enginework":
        Enginework = vallue;
        //  Enginework=false;

        break;
      case "Oilchange":
        Oilchange = vallue;
        break;
      case "Brekdown":
        breakdown = vallue;
        break;
      case "Washing":
        carwash = vallue;
        break;
    }
    update();
  }

  pickfiles() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result == null) return;

    final path = result.files.single.path;
    name = result.files.first.name;

    // print(file.name);
    // viewfile(file);
    // selected=file.path;
    selfile = File(path.toString());
    //  firebase_storage.UploadTask task =  uploadFile(file);
    fileupload(name);
    update();
  }

  viewfile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Future fileupload(name) async {
    if (selfile == null) return;
    final fileName = selfile!.path;
    task = Firebaseapi.uploadFile(selfile!, name);
  }

  pdfvalidate(Color color, String txt) {
    pdfText = txt;
    textColor = color;
    update();
  }

  checkboxValidate(Color color, String text) {
    checkBoxText = text;
    checkBoxTextColor = color;
    update();
  }

  dropdownValidate(String text, Color color) {
    dropDownText = text;
    dropDownTextColor = color;
    update();
  }

  locationservies(LatLng) async {
    latitude = LatLng.latitude;
    longitude = LatLng.longitude;
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark marker = placemark[0];
    address = '${marker.subLocality},${marker.locality},${marker.country}';

    update();
    print(address);
    print(latitude);
    print(longitude);
  }
}

class Firebaseapi {
  static UploadTask? uploadFile(File file, String name) {
    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(name);

      return ref.putFile(file);
    } on firebase_storage.FirebaseException catch (e) {
      print(file);
      return null;
    }
  }
}
