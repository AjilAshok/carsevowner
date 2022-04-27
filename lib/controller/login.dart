import 'package:carsevowner/Authentication/googlesign.dart';
import 'package:carsevowner/bottomnav/bottomnav.dart';
import 'package:carsevowner/registeration/registration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Logincontrol extends GetxController {
  var _googlesign = GoogleSignIn();
  bool? exist;
  // var googleaccount=Rx<GoogleSignInAccount?>(null);
  GoogleSignInAccount? user;
  GoogleSignInAccount get _user => user!;

  login(ctx) async {
    final googleuser = await GoogleSignIn().signIn();
try {
  if (googleuser == null) {
      await GoogleSignIn().signIn();
    } else {
      user = googleuser;
      print(user!.email);

      final googleauth = await googleuser.authentication;

      final credenintal =  GoogleAuthProvider.credential(
          accessToken: googleauth.accessToken, idToken: googleauth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credenintal);
      var currenownerid = FirebaseAuth.instance.currentUser!.uid;
      final snapshot = await FirebaseFirestore.instance
          .collection('Owner')
          .doc(currenownerid)
          .get();
      if (snapshot.exists) {
        Navigator.pushReplacement(
            ctx,
            MaterialPageRoute(
              builder: (context) => Bottomnav(),
            ));
      } else {
        Navigator.pushReplacement(
            ctx,
            MaterialPageRoute(
              builder: (context) => Registrationpage(),
            ));
      }

      //

      update();
      //

    }
  
} catch (e) {
  print("*********************");
  print(e);


}
    
  }
}
