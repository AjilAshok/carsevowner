import 'dart:math';

import 'package:carsevowner/bottomnav/bottomnav.dart';
import 'package:carsevowner/controller/login.dart';
import 'package:carsevowner/controller/ownerservice.dart';
import 'package:carsevowner/homescreen/homescreen.dart';
import 'package:carsevowner/homescreen/profile.dart';
import 'package:carsevowner/registeration/location.dart';
import 'package:carsevowner/registeration/requestwait.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:native_notify/native_notify.dart';
import 'package:open_file/open_file.dart';

class Registrationpage extends StatelessWidget {
  Registrationpage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  String lat = "10.1004";

  String log = " 76.3570";

  bool? register = false;

  final types = ["Bike", "Car"];

  TextEditingController shopname = TextEditingController();

  TextEditingController phonenumber = TextEditingController();

  TextEditingController ownername = TextEditingController();

  TextEditingController email = TextEditingController();

  final control = Get.put(Logincontrol());

  final ownercontrol = Get.put(Ownerservice());

  // String pdfName = "Shop license proof";

  @override
  Widget build(BuildContext context) {
    // email.text=control.value?.email??'';
    ownername.text = control.user?.displayName ?? '';
    email.text = control.user?.email ?? "";
    // String apikey="AIzaSyB5bzRmVqr1uZ6Q-ZriIYr7Bj1dtSJZcMw";
    // final inital=LatLng(10.1004,76.3570);
    // PickResult selectedplace;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Register Your shop",
          style: GoogleFonts.aclonica(fontSize: 20, color: Color(0XFF72E77E)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0XFF738878),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/team-profile.jpg"),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
                child: TextFormField(
                  controller: shopname,
                  validator: ((value) {
                    if (value!.isEmpty || value == null) {
                      return "Enter the name";
                    }
                  }),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Shop name",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Color(0xFF008000), width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFF008000)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
                child: TextFormField(
                  controller: phonenumber,
                  validator: ((value) {
                    if (value!.isEmpty || value == null) {
                      return "Enter a valid number";
                      // }else if(value != 10){
                      //      return '';
                    }
                  }),
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Phone number",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Color(0xFF008000), width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFF008000)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
                child: TextFormField(
                  validator: ((value) {
                    if (value!.isEmpty || value == null) {
                      return "Enter the name";
                    }
                  }),
                  controller: ownername,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Owner Name",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Color(0xFF008000), width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFF008000)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
                child: TextFormField(
                  validator: ((value) {
                    if (value!.isEmpty || value == null) {
                      return "Enter a valid email";
                    }
                  }),
                  controller: email,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Color(0xFF008000), width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFF008000)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
                child: InkWell(
                  onTap: () {
                    Get.to(LocationService());
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    // margin: const EdgeInsets.only(right: 20.0, left: 20),
                    // padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFF008000))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 12),
                      child: GetBuilder<Ownerservice>(
                        builder: (controller) => 
                         Text(
                           controller.address,
                          
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GetBuilder<Ownerservice>(
                init: Ownerservice(),
                builder: (controller) => Padding(
                  padding:
                      EdgeInsets.only(top: 20, right: 25, left: 25, bottom: 10),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Colors.black,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(color: Color(0xFF008000))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              controller.dropDownText,
                              style: TextStyle(color: controller.dropDownTextColor),
                            ),
                          ),
                          isExpanded: true,
                          iconEnabledColor: Color(0xFF008000),
                          value: controller.values,
                          // items: years.map(buildmenu).toList(),
                          onChanged: (value) {
                            controller.dropdowntype(value);
                          },
                          items: types.map((String value) {
                            return DropdownMenuItem(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(value,
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 250, 250))),
                                ));
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
                child: InkWell(
                  onTap: () {
                    ownercontrol.pickfiles();
                  },
                  child: GetBuilder<Ownerservice>(
                    builder: (controller) => Container(
                      height: 60,
                      width: double.infinity,
                      // margin: const EdgeInsets.only(right: 20.0, left: 20),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFF008000))),
                      child: controller.name == null
                          ? Text(
                              controller.pdfText,
                              style: TextStyle(color: controller.textColor),
                            )
                          : Text(
                              controller.name.toString(),
                              //
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 25),
                child: Text(
                  "Works",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF008000),
                    decorationThickness: 2,
                  ),
                ),
              ),
              GetBuilder<Ownerservice>(
                init: Ownerservice(),
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    checkbox("Enginework", controller.Enginework, controller),
                    checkbox("Oilchange", controller.Oilchange, controller),
                  ],
                ),
              ),
              GetBuilder<Ownerservice>(
                init: Ownerservice(),
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: checkbox(
                          "Brekdown", controller.breakdown, controller),
                    ),
                    checkbox("Washing", controller.carwash, controller),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GetBuilder<Ownerservice>(builder: (controller) {
                return Center(
                  child: Text(
                    controller.checkBoxText,
                    style: TextStyle(
                        color: controller.checkBoxTextColor, fontSize: 15),
                  ),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF62A769)),
                  ),
                  onPressed: () async {
                    final controller = Get.find<Ownerservice>();
                    if (controller.name == null) {
                      controller.pdfvalidate(
                          Colors.red, 'Please select a proof');
                    }

                    if (checkBoxList.isEmpty) {
                      controller.checkboxValidate(Colors.red, 'Please select ');
                    }

                    if (controller.values == null) {
                      controller.dropdownValidate('Select Type', Colors.red);
                    }

                    if (_formKey.currentState!.validate()) {
                      await addowner();
                      yourLoginFunction();

                      if (register == false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Requestwait(),
                            ));
                      }
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.black, fontSize: 20, letterSpacing: 1),
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  List<String> checkBoxList = [];

  Widget checkbox(String title, bool boolValue, Ownerservice control) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Checkbox(
            activeColor: Color(0xFF008000),
            value: boolValue,
            onChanged: (value) {
              if (value == true) {
                checkBoxList.add(title);
              } else {
                checkBoxList.remove(title);
              }
              control.chekbox(title, value!);
              // print(a);
            },
          )
        ],
      ),
    );
  }

  addowner() async {
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference usercollection =
        FirebaseFirestore.instance.collection("Owner-Requests");
    return usercollection
        .doc(user!.uid.toString())
        .set({
          "ownerId": user.uid,
          "showname": shopname.text,
          "phonenumber": phonenumber.text,
          "ownername": ownername.text,
          "email": email.text,
          "location": ownercontrol.address,
          "type": ownercontrol.values.toString(),
          "proof": ownercontrol.name,
          "chekbox": checkBoxList,
          "register": register,
          "latitude":ownercontrol.latitude,
          "longitude":ownercontrol.longitude,
           "date":DateFormat('dd-MM-yyyy').format(DateTime.now())
        })
        .then((value) => print("Owneradded"))
        .onError((error, stackTrace) => print(error));
  }
   void yourLoginFunction() {
    
    NativeNotify.registerIndieID('4');
}

}
