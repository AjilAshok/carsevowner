import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:carsevowner/Authentication/googlesign.dart';
import 'package:carsevowner/bottomnav/bottomnav.dart';
import 'package:carsevowner/controller/login.dart';
import 'package:carsevowner/homescreen/homescreen.dart';
import 'package:carsevowner/registeration/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({Key? key}) : super(key: key);
  final auth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    //  print(auth);

    return AnimatedSplashScreen(
      backgroundColor: Color(0XFF3D433E),
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: [
          Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(500)),
                image: DecorationImage(
                    image: AssetImage(
                        "assets/1b3f3e2ac8d54e252aaf4bf798e9dbfa--motorcycle-mechanic-motorcycle-logo.jpg"))),
          ),
          SizedBox(
            height: 100,
          ),
          Text("CarServ",
              style: GoogleFonts.rye(fontSize: 30, color: Colors.white))
        ],
      ),
      nextScreen: auth == null ? Googlesign() : Bottomnav(),
      duration: 3000,
      splashTransition: SplashTransition.rotationTransition,
      // pageTransitionType:,
      animationDuration: Duration(seconds: 1),
      splashIconSize: 350,
    );
  }

  //
}
