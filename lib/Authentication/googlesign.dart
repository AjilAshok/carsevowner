import 'package:carsevowner/bottomnav/bottomnav.dart';
import 'package:carsevowner/controller/login.dart';
import 'package:carsevowner/registeration/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Googlesign extends StatelessWidget {
   Googlesign({Key? key}) : super(key: key);
   final controler=Get.put(Logincontrol());
  // final GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ['email']);
  // GoogleSignInAccount?  _user;

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0XFF3D433E),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(
                top: 50,
              ),
              height: 350,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/1b3f3e2ac8d54e252aaf4bf798e9dbfa--motorcycle-mechanic-motorcycle-logo.jpg"))),
            ),
          ),
          Text(
            "Register your shop",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          InkWell(
            onTap: ()async{
            
               controler.login(context);
             

     
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 30, 49, 32),
                  borderRadius: BorderRadius.circular(20)),
          
              padding: EdgeInsets.only(left: 30, right: 10),
              margin: EdgeInsets.only(top: 40, left: 10, right: 10),
              width: double.maxFinite,
              height: 60,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage("assets/Google__G__Logo.svg.png"),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Google Signin",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
          
            ),
          ),
        ],
      ),
    ));
  }
}
