import 'package:carsevowner/controller/ownerservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Trackpage extends StatelessWidget {
  const Trackpage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Ownerservice());
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0XFF3D433E),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height/2,
              child: GetBuilder<Ownerservice>(

                builder: (controller) => 
                 GoogleMap(
                  mapType: MapType.normal,
                  markers: controller.markers,
                  // onMapCreated: controller.map(),
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                        10.1004,76.3570),
                      zoom: 10.0),
                ),
              ),
      
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Works",style: TextStyle(color: Colors.white,fontSize: 30,letterSpacing:1),),
            ),
             Padding(
                padding:
                    const EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Work Done",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Color(0xFF008000), width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFF008000)),
                    ),
                  ),
                ),
              ),
               Padding(
                padding:
                    const EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Spare change",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Color(0xFF008000), width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFF008000)),
                    ),
                  ),
                ),
              ),
                 Padding(
                padding:
                    const EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Date",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Color(0xFF008000), width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFF008000)),
                    ),
                  ),
                ),
              ),
                 Padding(
                padding:
                    const EdgeInsets.all(10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Amount",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Color(0xFF008000), width: 1)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFF008000)),
                    ),
                  ),
                ),
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
                                //  Navigator.push(context,MaterialPageRoute(builder: (context) => Trackpage(),));
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      letterSpacing: 1),
                                ),
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