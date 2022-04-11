import 'package:carsevowner/controller/ownerservice.dart';
import 'package:carsevowner/homescreen/widgets/Track.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              child: GetBuilder<Ownerservice>(
                builder: (controller) => Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 5),
                    controller.address == null
                        ? Text("Current location",
                            style: GoogleFonts.montserrat(color: Colors.black))
                        : Text(controller.address,
                            style: GoogleFonts.montserrat(color: Colors.black))
                  ],
                ),
              ),
            ),
            SizedBox(
              // height:MediaQuery.of(context).size.height*1.5,
              child: StreamBuilder<QuerySnapshot>(
                stream:  FirebaseFirestore.instance
              .collection('Accepted').snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState==ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                   
            
                    
                  }if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text("No Result"),
                    );
                    
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final detaisl=snapshot.data!.docs[index];
                      return Container(
                          margin: EdgeInsets.all(15),
                          height: 220,
                          decoration: BoxDecoration(
                              color: Color(0XFF3D433E),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  detaisl['nameuser'],
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Text(
                                   detaisl['complaint'],
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                               Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10,),
                                child: Text(
                                  detaisl['works'],
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Trackpage(username: detaisl['nameuser'] ,latitude: detaisl['latitude'],logitude: detaisl['longitude'],index: index,currentuserid:detaisl['currentuserid'] ,),
                                          ));
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
                    itemCount: snapshot.data!.docs.length,
                  );
                }
              ),
            )
          ],
        ),
      ),
    ));
  }
}
