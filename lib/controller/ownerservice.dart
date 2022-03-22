import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io';
import 'dart:math';
// import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:open_file/open_file.dart';

UploadTask? task;

class Ownerservice extends GetxController {
  String? selected;
  File? selfile;
  String? name;

  String? values;
  bool Enginework = false;
  bool Oilchange = false;
  bool breakdown = false;
  bool carwash = false;
  //

  int currentindex = 0;
  final Set<Marker> markers = {};

  bottomnavbar(index) {
    currentindex = index;
    update();
  }

  map() {
    markers.add(Marker(
        markerId: MarkerId("id-1"),
        position: LatLng(10.1004, 76.3570),
        infoWindow: InfoWindow(
            // title:address.value
            )));
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
      case "Carwash":
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
  }

  viewfile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Future fileupload(name) async {
    if (selfile == null) return;
    final fileName = selfile!.path;
    task = Firebaseapi.uploadFile(selfile!, name);
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
