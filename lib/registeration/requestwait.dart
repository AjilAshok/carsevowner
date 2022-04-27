import 'package:carsevowner/bottomnav/bottomnav.dart';
import 'package:carsevowner/controller/login.dart';
import 'package:carsevowner/homescreen/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/sockets_io.dart';

import 'package:lottie/lottie.dart';
import 'package:native_notify/native_notify.dart';

class Requestwait extends StatelessWidget {
  const Requestwait({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final controler = Get.put(Logincontrol());

    var user = FirebaseAuth.instance.currentUser;
// DocumentSnapshot colection=FirebaseFirestore.instance.collection('Owner').doc(user.toString()).get();
    // /check = colection.data['r']

    return Scaffold(
        backgroundColor: Color(0XFF3D433E),
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Owner-Requests')
                .doc(user!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionStatus.connecting) {
                print('connecting');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var documentFields = snapshot.data;

              print(documentFields["register"]);
              if (documentFields["register"] == false) {
                return Center(
                    child: Column(
                  children: [
                    const SizedBox(
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
                  ],
                ));
              }

              // if (snapshot.connectionState == ConnectionState.done) {
              return Bottomnav();
              // }
              // return Container();
              // return Column(
              //   children: [
              //     SizedBox(
              //       height: 30,
              //     ),
              //     Container(
              //       child: Lottie.network(
              //           'https://assets2.lottiefiles.com/packages/lf20_kel01toa.json'),
              //     ),
              //     Spacer(),
              //     Container(
              //       child: Text(
              //         "Please Wait....",
              //         style: TextStyle(
              //             fontSize: 25,
              //             color: Colors.green,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 50,
              //     ),

              //   ],

              // );
            }));
  }
}
