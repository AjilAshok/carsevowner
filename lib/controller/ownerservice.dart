import 'dart:io';

import 'package:carsevowner/report/reportpage.dart';
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
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

UploadTask? task;

class Ownerservice extends GetxController {
  final user = FirebaseAuth.instance.currentUser;
  String? selected;
  File? selfile;
  String? name;
  String pdfText = 'Select a proof';
  String checkBoxText = 'Select any options!';
  Color checkBoxTextColor = Colors.white;
  String address = "Select the location";
  DateTimeRange range =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  String dropDownText = 'Type';
  Color dropDownTextColor = Colors.white;

  Color textColor = Colors.white;

  String? values;
  bool Enginework = false;
  bool Oilchange = false;
  bool breakdown = false;
  bool carwash = false;
  double latitude = 0;
  double longitude = 0;
  var location;
  // List days = [];
  int? totalowner;
  int? totalrevenue;
  var totalowersss = 0;
  List allorders = [];
  List orderslist=[];
  List username=[];
  List amount=[];
  List payment=[];

  var ordercollection;

  //

  int currentindex = 0;
  final Set<Marker> markers = {};
  final List<ChartData> chartData = [
    // ChartData(2010, 35),
    // ChartData(2011, 28),
    // ChartData(2012, 34),
    // ChartData(2013, 32),
    // ChartData(2014, 40),
    // ChartData(2015, 28),
    // ChartData(2017, 34),
    // ChartData(2018, 32),
    // ChartData(2019, 40)
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addres();
    details();
    update();
  }

  // List getDaysInBetween(DateTime startDate, DateTime endDate) {
  //   for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
  //     days.add(
  //         DateFormat('dd-MM-yyyy').format(startDate.add(Duration(days: i))));
  //   }
  //   print(days);

  //   return days;
  // }

  getuser(List result) async {
    // totalowner=0;
    totalrevenue = 0;
    // print(result);
    for (var i = 0; i < result.length; i++) {
      await FirebaseFirestore.instance
          .collection('Owner')
          .where('date', isEqualTo: result[i])
          .get()
          .then((value) {
        totalowersss = value.size;
        // print(value.size);
      });
      update();
      print(totalowersss);
    }
  }

// int ranger=int.parse()
  final now = DateTime.now();

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

  addres() async {
    final userid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('Owner')
        .doc(userid)
        .get()
        .then((value) {
      location = value.get('location');
      print(location);
    });
  }

  var email;
  var phonenmber;
  var ownername;
  details() async {
    final userid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('Owner')
        .doc(userid)
        .get()
        .then((value) {
      email = value.get('email');
      phonenmber = value.get('phonenumber');
      ownername = value.get('ownername');
    });
    print(email);
    print(phonenmber);
  }

  sortOrderCustom(DateTime days) async {
    // print(user!.uid);
    allorders.clear();
    username.clear();
    amount.clear();
    payment.clear();
  
  orderslist.clear();
    ordercollection = await FirebaseFirestore.instance
        .collection('Bills')
        .orderBy('date')
        .startAt([days.millisecondsSinceEpoch]).get();

    Iterable allordersday = ordercollection.docs.map((e) => e.data()['userid']);
    // Iterable orderslist=ordercollection.d
   Iterable orderslistwork=  ordercollection.docs.map((e) => e.data()['work']);
   Iterable usernamelist=ordercollection.docs.map((e) => e.data()['username']);
   Iterable amountlist=ordercollection.docs.map((e) => e.data()['amount']);
   Iterable paymentlist=ordercollection.docs.map((e) => e.data()['paymentoption']);

   

    allorders = allordersday.toList();
    orderslist=orderslistwork.toList();
    username=usernamelist.toList();
   amount=amountlist.toList();
   payment=paymentlist.toList();

    // print(ordercollection.docs.map((e) => e.data()['userid']).toList());
    print(this.allorders);
    update();
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
