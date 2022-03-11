

import 'package:carsevowner/homescreen/widgets/Track.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Carserv",
          style: GoogleFonts.aclonica(fontSize: 30, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Color(0XFF738878),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 5),
                  Text("Current location",
                      style: GoogleFonts.montserrat(color: Colors.black))
                ],
              ),
            ),
            SizedBox(
              // height:MediaQuery.of(context).size.height*1.5,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.all(15),
                      height: 200,
                      decoration: BoxDecoration(
                          color: Color(0XFF3D433E),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Name of user",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Complaint",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              width: 180,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF62A769)),
                                ),
                                onPressed: () {
                                 Navigator.push(context,MaterialPageRoute(builder: (context) => Trackpage(),));
                                },
                                child: Text(
                                  "Track",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                          )
                        ],
                      ));
                },
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
