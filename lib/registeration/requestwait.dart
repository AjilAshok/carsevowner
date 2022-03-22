import 'package:carsevowner/bottomnav/bottomnav.dart';
import 'package:carsevowner/homescreen/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

class Requestwait extends StatefulWidget {
  const Requestwait({Key? key}) : super(key: key);

  @override
  State<Requestwait> createState() => _RequestwaitState();
}

class _RequestwaitState extends State<Requestwait> {
  bool? reg;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geter();
  }

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
// DocumentSnapshot colection=FirebaseFirestore.instance.collection('Owner').doc(user.toString()).get();
    // /check = colection.data['r']

    return Scaffold(
      backgroundColor: Color(0XFF3D433E),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Owner').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Lottie.network(
                      'https://assets2.lottiefiles.com/packages/lf20_kel01toa.json'),
                ),
                Spacer(),
                Container(
                  child: Text(
                    "Please Wait....",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextButton(
                    onPressed: () async{
                      bool check = await geter();
                      print(check);

                      if (check == true) {
                        // Get.to(Homescreen());
                        Get.to(Bottomnav());
                        
                      }
                    },
                    child: Text('hhjhj'))
              ],
            );
          }),
    );
  }

  Future<bool> geter() async {
    var user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('Owner')
        .doc(user!.uid.toString())
        .get();

    return Future<bool>.value(variable['register']);
  }
}
