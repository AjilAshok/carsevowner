import 'package:carsevowner/Authentication/googlesign.dart';
import 'package:carsevowner/controller/login.dart';
import 'package:carsevowner/controller/ownerservice.dart';
import 'package:carsevowner/registeration/registration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

bool isSwitched = true;

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;
  final control = Get.put(Logincontrol());
  final Ownercontroler=Get.put(Ownerservice());
  

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;
    // details();
   
    emailcontroller.text = user?.email ?? "";
    namecontroller.text = user?.displayName ?? "";
    // phonecontroller.text=Ownercontroler.phonenmber;
    final ownercontroller = Get.put(Ownerservice());

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0XFF738878),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor: Colors.black,
                          title: Text("Are you sure",
                              style: TextStyle(color: Colors.white)),
                          // content: Text("This is my message."),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 66, 219, 102)),
                                )),
                            TextButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  GoogleSignIn().signOut();
                                  ownercontroller.currentindex = 0;
                                  Get.offAll(Googlesign());
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 66, 219, 102)),
                                ))
                          ]);
                    });
                // control.logout();

                //  Get.off(Googlesign());
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Googlesign(),));
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => Googlesign(),), (route) => false);
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.black,
                size: 30,
              ))
        ],
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontSize: 25, letterSpacing: 1),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"),
                //  AssetImage("assets/default_profile.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 10, right: 10, bottom: 10),
              child: TextFormField(
                controller: namecontroller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Name",
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
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: phonecontroller,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Phonenumber",
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
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailcontroller,
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
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    "Online / Offline",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                 
                  GetBuilder<Ownerservice>(
                    init: Ownerservice(),
                    builder: (controller) => Switch(
                      activeTrackColor: Color.fromARGB(255, 37, 80, 199),
                      activeColor: Color.fromARGB(255, 49, 207, 9),
                      onChanged: (value) {},
                      value: isSwitched,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            Text(
              // control.googleaccount.value?.displayName??"",
              "Account details",

              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Bank Name",
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
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Account Number",
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
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "IFSC",
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
            Container(
              width: 180,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF62A769)),
                ),
                onPressed: () {},
                child: Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, letterSpacing: 1),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }
}
